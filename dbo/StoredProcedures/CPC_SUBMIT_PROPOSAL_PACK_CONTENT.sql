create procedure dbo.CPC_SUBMIT_PROPOSAL_PACK_CONTENT (
	@ref_nbr varchar(50),
	@content_type varchar(50)
)
AS
begin
	declare @content_state varchar(50);

	select 
		@content_state = a.PPC_STATUS
	from dbo.CPC_PROPOSAL_PACK_CONTENTS a
	where a.PPC_CPP_REF_NBR = @ref_nbr
	and a.PPC_PPCT_TYPE_CODE = @content_type;

	if (@content_state is NULL)
	begin
		raiserror('Cannot find Proposal Pack. Invalid input parameters', 16, 1);
	end

	if (@content_state != 'NEW')
	begin
		raiserror('You can only submit a Proposal Pack content that has a current status of NEW.', 16, 1);
	end

	update a set
		a.PPC_STATUS = 'SUBMITTED'
	from dbo.CPC_PROPOSAL_PACK_CONTENTS a
	where a.PPC_CPP_REF_NBR = @ref_nbr
	and a.PPC_PPCT_TYPE_CODE = @content_type;
end

GO

