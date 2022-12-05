create procedure dbo.CPC_PROPOSAL_FORM_ADD_SUM_ASSURED (
	@caller varchar(150),
	@data dbo.UDT_CPC_FORM_TRAD_SUM_ASSURED readonly
)
as
begin
	set nocount on;

	declare @ref_nbr varchar(50);
	declare @content_type varchar(50);
	declare @rec_count int;

	select top (1)
		@ref_nbr = a.CPF_CPP_REF_NBR,
		@content_type = a.CPF_PPCT_TYPE_CODE
	from @data a;

	select @rec_count = count(*)
	from dbo.CPC_PROPOSAL_FORM_TRAD_SUM_ASSURED a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type;

	if (@rec_count = 1)
	begin
		update a set
			a.FIRST_PREMIUM_PAID = b.FIRST_PREMIUM_PAID,
			a.FROM_DATE = cast(b.FROM_DATE as date),
			a.LAST_MODIFIED_DATE = GETDATE(),
			a.LAST_MODIFIED_USER = @caller,
			a.MATURIRY_DATE = cast(b.MATURIRY_DATE as date),
			a.PAYMENT_FREQUENCY = b.PAYMENT_FREQUENCY,
			a.PAYMENT_MODE = b.PAYMENT_MODE,
			a.REGULAR_PREMIUM = b.REGULAR_PREMIUM,
			a.SUM_ASSURED = b.SUM_ASSURED,
			a.TERM_YEAR = b.TERM_YEAR
		from dbo.CPC_PROPOSAL_FORM_TRAD_SUM_ASSURED a
		inner join @data b on (
			b.CPF_CPP_REF_NBR = a.CPF_CPP_REF_NBR 
			and b.CPF_PPCT_TYPE_CODE = a.CPF_PPCT_TYPE_CODE
		);
	end

	if (@rec_count = 0)
	begin
		insert into dbo.CPC_PROPOSAL_FORM_TRAD_SUM_ASSURED (
			CPF_CPP_REF_NBR,
			CPF_PPCT_TYPE_CODE,
			SUM_ASSURED,
			TERM_YEAR,
			FIRST_PREMIUM_PAID,
			REGULAR_PREMIUM,
			PAYMENT_FREQUENCY,
			FROM_DATE,
			MATURIRY_DATE,
			PAYMENT_MODE,
			CREATE_DATE,
			CREATE_USER,
			LAST_MODIFIED_DATE,
			LAST_MODIFIED_USER
		)
		select
			a.CPF_CPP_REF_NBR,
			a.CPF_PPCT_TYPE_CODE,
			a.SUM_ASSURED,
			a.TERM_YEAR,
			a.FIRST_PREMIUM_PAID,
			a.REGULAR_PREMIUM,
			a.PAYMENT_FREQUENCY,
			cast(a.FROM_DATE as date),
			cast(a.MATURIRY_DATE as date),
			a.PAYMENT_MODE,
			GETDATE(),
			@caller,
			GETDATE(),
			@caller
		from @data a
	end
end

GO

