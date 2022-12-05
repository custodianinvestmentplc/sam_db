create procedure grp.searcg_group_customer_db
	@search_term varchar(150)
as
begin
	set nocount on;

	select distinct 
		a._key_out FuzzyKey, 
		a.CustName_clean CustomerName
	from dbo.group_cust a
	where upper(a.CustName) like upper('%' + @search_term + '%')
end

GO

