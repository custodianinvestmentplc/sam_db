CREATE procedure [dbo].[cpc_get_inbound_proposal_packs]
    @user_email varchar(150)
as
begin

    set nocount on;
    declare @user_id int;
    declare @user_app int;
    declare @branch_ptions table
(
        branchCode varchar(150)
);
    declare @submitted_packs table
(
        TableRowId varchar(150),
        ReferenceNumber varchar(150),
        Title varchar(150),
        InitiatingBranchCode varchar(150),
        InitatingAgentCode varchar(150),
        CreateDate varchar(150),
        CreateUserEmail varchar(150),
        InitiatingBranchName varchar(150),
        InitiatingAgentName varchar(150),
        CreateUserName varchar(150)
);

    declare @dt date = cast(getdate() as date);

    select @user_id = a.ROW_ID
    from dbo.USER_REGISTER a
    where a.USER_EMAIL = @user_email;

    if (@user_id is not null)
	begin
        insert into @branch_ptions
            (branchCode)
        select c.LOCAL_SYSTEM_CODE
        from dbo.USER_BRANCHES_REGISTER a
            join dbo.USER_REGISTER b on b.ROW_ID = a.USER_ROW_ID
            join dbo.CPC_BRANCHES c on c.ROW_ID = a.BRANCH_ROW_ID
        where a.USER_ROW_ID = @user_id;

        insert into @submitted_packs
            (
            TableRowId,
            ReferenceNumber,
            Title,
            InitiatingBranchCode,
            InitatingAgentCode,
            CreateDate,
            CreateUserEmail,
            InitiatingBranchName,
            InitiatingAgentName,
            CreateUserName
            )
        select
            a.ROW_ID ,
            a.REF_NBR,
            a.TITLE,
            a.LOCAL_SYS_BRANCH_CODE,
            a.AGENT_SHT_DESC,
            a.CREATE_DATE,
            a.CREATE_USER,
            b.BRANCH_NAME,
            c.AGN_NAME,
            d.DISPLAY_NAME
        from dbo.CPC_PROPOSAL_PACKS a
            join dbo.CPC_BRANCHES b on a.LOCAL_SYS_BRANCH_CODE = b.LOCAL_SYSTEM_CODE
            join dbo.SALES_TEAM c on a.AGENT_SHT_DESC = c.AGN_SHT_DESC
            join dbo.USER_REGISTER d on a.CREATE_USER = d.USER_EMAIL
        where exists (
		select 1
        from dbo.CPC_PROPOSAL_PACK_STATUS_LOG p
        where p.CPP_REF_NBR = a.REF_NBR
            and p.STATUS_DESC = 'SUBMITTED'
	);

        select
            a.TableRowId TableRowId,
            a.ReferenceNumber ReferenceNumber,
            a.Title Title,
            a.InitiatingBranchCode InitiatingBranchCode,
            a.InitatingAgentCode InitatingAgentCode,
            a.CreateDate CreateDate,
            a.CreateUserEmail CreateUserEmail,
            a.InitiatingBranchName InitiatingBranchName,
            a.InitiatingAgentName InitiatingAgentName,
            a.CreateUserName CreateUserName
        from @submitted_packs a
        where a.InitiatingBranchCode in (select branchCode
        from @branch_ptions)

    end;


end

GO

