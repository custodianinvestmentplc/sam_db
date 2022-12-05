create procedure dbo.get_all_cpc_branches
as
begin
	set nocount on;

	select
		a.ROW_ID RowId,
		a.SRC_SYSTEM_CODE SourceSystemCode,
		a.LOCAL_SYSTEM_CODE LocalSystemCode,
		a.BRANCH_NAME BranchName,
		a.BRANCH_EMAIL BranchEmailAddress
	from dbo.CPC_BRANCHES a
end

GO

