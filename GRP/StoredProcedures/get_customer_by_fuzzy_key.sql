create procedure grp.get_customer_by_fuzzy_key
	@key_out int
as
begin
	set nocount on;

	SELECT
		a._key_out FuzzyKey,
		a.CustKey CustomerKey,
		a.CustName_clean CustomerName,
		b.cust_segment CustomerSegment,
		convert(numeric(25,2), b.income_bracket) IncomeBracket,
		convert(numeric(25,2), b.prem_contribution) PremiumContribution,
		b.rm_name RelationshipManagerName,
		b.rm_phone RelationshipManagerPhone,
		b.int_type IntermediaryType,
		b.int_name IntermediaryName,
		b.cust_address CustomerAddress,
		b.cust_phone CustomerPhone,
		b.cust_email CustomerEmail,
		b.subsidiary SubsidiaryCode,
		b.cust_type CustomerType
	from dbo.group_cust a
	join grp.GROUP_CUST b on b.cust_key = a.CustKey
	where a._key_out = @key_out
end

GO

