CREATE procedure dbo.cpc_delete_proposal_pack_content (
	@ref_nbr varchar(50),
	@row_id numeric(25,0),
	@is_deleted int output
)
as
begin
	set nocount on;

	declare @rec_count int = 1;

	set @is_deleted = 0;

	if exists (
		select 1
		from dbo.CPC_PROPOSAL_PACK_CONTENTS a
		where a.ROW_ID = @row_id
		and a.PPC_CPP_REF_NBR = @ref_nbr
	)
	begin
		delete from dbo.CPC_PROPOSAL_PACK_CONTENTS
		where ROW_ID = @row_id
		and PPC_CPP_REF_NBR = @ref_nbr;

		select
			@rec_count = count(*)
		from dbo.CPC_PROPOSAL_PACK_CONTENTS a
		where a.ROW_ID = @row_id
		and a.PPC_CPP_REF_NBR = @ref_nbr;

		if (@rec_count = 0)
		begin
			set @is_deleted = 1;
			return;
		end
	end;
end

GO

