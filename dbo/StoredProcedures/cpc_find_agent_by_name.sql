create procedure dbo.cpc_find_agent_by_name (
	@search_key varchar(150)
)
as
begin
	set nocount on;

	declare @search_term varchar(150) = lower(@search_key);

	select
		x.AGN_CODE AgentSystemCode,
		x.AGN_SHT_DESC BusinessCode,
		x.AGN_NAME FullName,
		x.AGN_POSITION SalesLevel
	from (
		select
			a.AGN_CODE,
			a.AGN_SHT_DESC,
			a.AGN_NAME,
			lower(a.AGN_NAME) name_lower,
			a.AGN_POSITION
		from dbo.SALES_TEAM a
	) x
	where x.name_lower like '%' + @search_term + '%'
	order by x.AGN_NAME
end

GO

