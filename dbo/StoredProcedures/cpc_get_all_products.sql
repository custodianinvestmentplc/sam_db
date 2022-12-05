create procedure dbo.cpc_get_all_products
as
begin
	set nocount on

	select
		a.REF_TYPE_REF_CODE ProductCode,
		a.REF_TYPE_REF_CODE_DESC ProductName,
		a.CREATE_DATE CreateDate,
		a.CREATE_USER CreatedBy
	from dbo.CPC_REF_TYPES_CODE a
	where a.REF_TYPE_CODE = '001'
end

GO

