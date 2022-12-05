CREATE procedure dbo.CPC_SUBMIT_PROPOSAL_PACK (
	@ref_nbr varchar(50),
	@caller varchar(150)
)
AS
begin
	set nocount on;

	declare @cnt int;
	declare @new_count int;
	declare @submitted_count int;
	declare @today date = cast(getdate() as date);
	declare @yesterday date;

	select @cnt = count(*)
	from dbo.USER_REGISTER a
	where a.USER_EMAIL = @caller;

	if (@cnt <> 1)
	begin
		raiserror('Invalid Operation. User does not exist.', 16, 1);
		return;
	end
	
	set @cnt = 0;

	select @cnt = count(*)
	from dbo.CPC_PROPOSAL_PACK_CONTENTS a 
	where a.PPC_CPP_REF_NBR = @ref_nbr;

	if (@cnt = 0)
	begin
		raiserror('Invalid Operation. You cannot submit a Proposal Pack without any content.', 16, 1);
		return;
	end

	select
		@new_count = sum(case when a.PPC_STATUS = 'NEW' then 1 else 0 end),
		@submitted_count = sum(case when a.PPC_STATUS = 'SUBMITTED' then 1 else 0 end),
		@cnt = count(a.ROW_ID)
	from dbo.CPC_PROPOSAL_PACK_CONTENTS a 
	where a.PPC_CPP_REF_NBR = @ref_nbr
	group by a.PPC_CPP_REF_NBR;

	if (@submitted_count <> @cnt)
	begin
		raiserror('Cannot submit Proposal Pack. Not all Content have been completed.', 16, 1);
		return;
	end

	select
		@cnt = count(*)
	from CPC_PROPOSAL_PACK_STATUS_LOG a
	where a.CPP_REF_NBR = @ref_nbr
	and a.STATUS_DESC = 'NEW'
	and a.FROM_DATE <= @today
	and a.TO_DATE >= @today;

	if (@cnt <> 1)
	begin
		raiserror('Invalid Operation. Database Tables are in a state of incosistency.', 16, 1);
		return;
	end

	select @yesterday = DATEADD(d, -1, @today);

	update a set
		a.TO_DATE = @yesterday
	from CPC_PROPOSAL_PACK_STATUS_LOG a
	where a.CPP_REF_NBR = @ref_nbr
	and a.STATUS_DESC = 'NEW'
	and a.FROM_DATE <= @today
	and a.TO_DATE >= @today;

	insert into CPC_PROPOSAL_PACK_STATUS_LOG (
		CPP_REF_NBR,
		STATUS_DESC,
		FROM_DATE,
		TO_DATE,
		CREATE_DATE_STAMP,
		CREATE_USER
	)
	values (
		@ref_nbr,
		'SUBMITTED',
		@today,
		cast('2099-12-31' as date),
		GETDATE(),
		@caller
	);
end

GO

