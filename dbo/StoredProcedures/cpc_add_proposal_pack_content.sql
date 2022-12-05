create procedure dbo.cpc_add_proposal_pack_content (
	@ref_nbr varchar(50),
	@content_type_code varchar(50),
	@caller varchar(150),
	@new_row_id numeric(25,0) output,
	@msg varchar(150) output
)
as
begin
	set nocount on;

	declare @tbl table (new_id numeric(25,0));

	if exists (
		select 1
		from dbo.CPC_PROPOSAL_PACK_CONTENT_TYPES a
		where a.PPCT_TYPE_CODE = @content_type_code
	)
	begin
		insert into dbo.CPC_PROPOSAL_PACK_CONTENTS (
			PPC_CPP_REF_NBR,
			PPC_PPCT_TYPE_CODE,
			PPC_CREATE_DATE,
			PPC_CREATE_USER,
			PPC_STATUS
		)
		output inserted.ROW_ID into @tbl(new_id)
		select top (1)
			b.REF_NBR,
			@content_type_code,
			GETDATE(),
			@caller,
			'NEW'
		from dbo.CPC_PROPOSAL_PACKS b
		where b.REF_NBR = @ref_nbr;
		
		if ((select count(*) from @tbl) = 1)
		begin
			set @new_row_id = (
				select a.new_id
				from @tbl a
			);
			set @msg = 'Completed';
		end
		else
		begin
			set @new_row_id = 0;
			set @msg = 'Invalid Proposal Pack reference Nbr';
		end
	end
	else
	begin
		set @new_row_id = 0;
		set @msg = 'Invalid Proposal Content Type Code';
	end
end

GO

