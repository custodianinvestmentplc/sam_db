CREATE procedure dbo.CPC_PROPOSAL_FORM_ADD_OTHER_INSURER (
	@caller varchar(150),
	@ref_nbr varchar(50),
	@content_type varchar(50),
	@has_other_insurer varchar(50),
	@other_insurer_name varchar(150),
	@other_sum_assured decimal(18,2),
	@prior_decline varchar(50),
	@decline_reason varchar(4000)
)
as
begin
	set nocount on;

	declare @rec_count int;
	declare @other_insurer_name_loc varchar(150);
	declare @other_sum_assured_loc decimal(18,2);
	declare @decline_reason_loc varchar(50);
	declare @canDelete varchar(10);

	select @rec_count = count(*)
	from dbo.CPC_PROPOSAL_FORM_TRAD_OTHER_INSURER_DETAILS a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type;

	set @other_insurer_name_loc = (
		case
			when @has_other_insurer = 'YES' then @other_insurer_name
			else NULL
		end
	);

	set @other_sum_assured_loc = (
		case
			when @has_other_insurer = 'YES' then @other_sum_assured
			else NULL
		end	
	);

	set @decline_reason_loc = (
		case
			when @prior_decline = 'YES' then @prior_decline
			else NULL
		end	
	);

	set @canDelete = (
		case
			when @has_other_insurer = 'NO' and @prior_decline = 'NO' then 'YES'
			else 'NO'
		end
	);

	if (@canDelete = 'YES')
	begin
		delete
		from dbo.CPC_PROPOSAL_FORM_TRAD_OTHER_INSURER_DETAILS
		where CPF_CPP_REF_NBR = @ref_nbr
		and CPF_PPCT_TYPE_CODE = @content_type;
	end
	else
	begin
		if (@rec_count = 1)
		begin
			update a set
				a.HAS_OTHER_INSURER = @has_other_insurer,
				a.INSURER_NAME = @other_insurer_name_loc,
				a.SUM_ASSURED = @other_sum_assured_loc,
				a.PRIOR_PROPOSAL_DECLINE = @prior_decline,
				a.DECLINE_REASON = @decline_reason_loc
			from dbo.CPC_PROPOSAL_FORM_TRAD_OTHER_INSURER_DETAILS a
			where a.CPF_CPP_REF_NBR = @ref_nbr
			and a.CPF_PPCT_TYPE_CODE = @content_type;
		end

		if (@rec_count = 0)
		begin
			insert into dbo.CPC_PROPOSAL_FORM_TRAD_OTHER_INSURER_DETAILS (
				CPF_CPP_REF_NBR,
				CPF_PPCT_TYPE_CODE,
				HAS_OTHER_INSURER,
				INSURER_NAME,
				SUM_ASSURED,
				PRIOR_PROPOSAL_DECLINE,
				DECLINE_REASON,
				CREATE_DATE,
				CREATE_USER,
				LAST_MODIFIED_DATE,
				LAST_MODIFIED_USER
			)
			values (
				@ref_nbr,
				@content_type,
				@has_other_insurer,
				@other_insurer_name_loc,
				@other_sum_assured_loc,
				@prior_decline,
				@decline_reason_loc,
				GETDATE(),
				@caller,
				GETDATE(),
				@caller
			);
		end
	end
end

GO

