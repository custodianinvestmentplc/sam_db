create procedure dbo.cpc_get_states
as
begin
	set nocount on

	select
		a.REF_TYPE_REF_CODE StateCode,
		a.REF_TYPE_REF_CODE_DESC StateName,
		a.CREATE_DATE CreateDate,
		a.CREATE_USER CreatedBy
	from dbo.CPC_REF_TYPES_CODE a
	where a.REF_TYPE_CODE = '002'
end

GO

