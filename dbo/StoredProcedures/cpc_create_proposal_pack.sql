CREATE procedure dbo.cpc_create_proposal_pack (
	@caller varchar(150),
	@title varchar(150),
	@branch_code varchar(50),
	@agent_code varchar(50),
	@proposal_type varchar(50),
	@ref_nbr varchar(50) output
)
as
begin
	set nocount on;

	declare @tbl table (new_id numeric(25,0));
	declare @refnbr varchar(50);
	declare @data_capture_form varchar(50);
	declare @new_content_row_id numeric(25,0);
	declare @msg varchar(150)

	select @data_capture_form = a.PROPOSAL_PACK_TYPE
	from dbo.CPC_PROPOSAL_PACKS_FORMS a
	inner join dbo.CPC_PROPOSAL_PACK_CONTENT_TYPES b on b.PPCT_SHT_DESC = a.PPCT_SHT_DESC
	where a.PROPOSAL_PACK_TYPE = @proposal_type;

	if (@data_capture_form is NULL)
	begin
		raiserror('Cannot find the Data Capture Form for the specified Proposal Pack Type.', 16, 1);
		return;
	end

	exec dbo.cpc_generate_proposal_pack_ref_nbr @branch_code, @refnbr output;

	insert into dbo.CPC_PROPOSAL_PACKS (
		REF_NBR,
		TITLE,
		LOCAL_SYS_BRANCH_CODE,
		AGENT_SHT_DESC,
		CREATE_DATE,
		CREATE_USER,
		PROPOSAL_PACK_TYPE
	)
	output inserted.ROW_ID into @tbl(new_id)
	values (
		@refnbr,
		@title,
		@branch_code,
		@agent_code,
		GETDATE(),
		@caller,
		@proposal_type
	);

	insert into dbo.CPC_PROPOSAL_PACK_STATUS_LOG (
		CPP_REF_NBR,
		STATUS_DESC,
		FROM_DATE,
		TO_DATE,
		CREATE_DATE_STAMP,
		CREATE_USER
	)
	values (
		@refnbr,
		'NEW',
		CAST(GETDATE() as date),
		CAST('2099-12-31' as date),
		GETDATE(),
		@caller
	);

	exec dbo.cpc_add_proposal_pack_content @refnbr, @data_capture_form, @caller, @new_content_row_id output, @msg output;

	set @ref_nbr = @refnbr;
end

GO

