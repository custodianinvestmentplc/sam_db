CREATE procedure [dbo].[cpc_get_submitted_proposal_pack_all]
as
begin
    set nocount on;

    declare @dt date = cast(getdate() as date);

    select
        a.ROW_ID TableRowId,
        a.REF_NBR ReferenceNumber,
        a.TITLE Title,
        a.LOCAL_SYS_BRANCH_CODE InitiatingBranchCode,
        a.AGENT_SHT_DESC InitatingAgentCode,
        a.CREATE_DATE CreateDate,
        a.CREATE_USER CreateUserEmail,
        b.BRANCH_NAME InitiatingBranchName,
        c.AGN_NAME InitiatingAgentName,
        d.DISPLAY_NAME CreateUserName,
        e.PPC_STATUS PpcStatus
    from dbo.CPC_PROPOSAL_PACKS a
        join dbo.CPC_BRANCHES b on a.LOCAL_SYS_BRANCH_CODE = b.LOCAL_SYSTEM_CODE
        join dbo.SALES_TEAM c on a.AGENT_SHT_DESC = c.AGN_SHT_DESC
        join dbo.USER_REGISTER d on a.CREATE_USER = d.USER_EMAIL
        join dbo.CPC_PROPOSAL_PACK_CONTENTS e on a.REF_NBR = e.PPC_CPP_REF_NBR
    where exists (
		select 1
    from dbo.CPC_PROPOSAL_PACK_STATUS_LOG p
    where (p.CPP_REF_NBR = a.REF_NBR
        and p.STATUS_DESC = 'SUBMITTED'
        and p.from_date <= @dt
        and p.to_date >= @dt)
        or (p.CPP_REF_NBR = a.REF_NBR
        and p.STATUS_DESC = 'SUBMITTED-WIP'
        and p.from_date <= @dt
        and p.to_date >= @dt)
        or (p.CPP_REF_NBR = a.REF_NBR
        and p.STATUS_DESC = 'SUBMITTED-APPROVED'
        and p.from_date <= @dt
        and p.to_date >= @dt)
         or (p.CPP_REF_NBR = a.REF_NBR
        and p.STATUS_DESC = 'SUBMITTED-ACCEPTED'
        and p.from_date <= @dt
        and p.to_date >= @dt)
        or (p.CPP_REF_NBR = a.REF_NBR
        and p.STATUS_DESC = 'SUBMITTED-REJECTED'
        and p.from_date <= @dt
        and p.to_date >= @dt)
	);
end

GO

