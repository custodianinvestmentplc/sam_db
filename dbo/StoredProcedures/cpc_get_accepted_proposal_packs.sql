CREATE procedure [dbo].[cpc_get_accepted_proposal_packs]
as
begin

    set nocount on;

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
        d.DISPLAY_NAME CreateUserName
    from dbo.CPC_PROPOSAL_PACKS a
        join dbo.CPC_BRANCHES b on a.LOCAL_SYS_BRANCH_CODE = b.LOCAL_SYSTEM_CODE
        join dbo.SALES_TEAM c on a.AGENT_SHT_DESC = c.AGN_SHT_DESC
        join dbo.USER_REGISTER d on a.CREATE_USER = d.USER_EMAIL
    where exists (
		select 1
    from dbo.CPC_PROPOSAL_PACK_STATUS_LOG p
    where (p.CPP_REF_NBR = a.REF_NBR
        and p.STATUS_DESC = 'ACCEPTED')
        or
        (p.CPP_REF_NBR = a.REF_NBR
        and p.STATUS_DESC = 'UNDER-REVIEW')
	);
end

GO

