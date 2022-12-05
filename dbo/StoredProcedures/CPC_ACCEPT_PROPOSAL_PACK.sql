CREATE procedure [dbo].[CPC_ACCEPT_PROPOSAL_PACK]
    (
    @ref_nbr varchar(50),
    @picker varchar(150)
)
AS
begin
    set nocount on;

    declare @cnt int;
    declare @new_count int;
    declare @picked_count int;
    declare @today date = cast(getdate() as date);
    declare @yesterday date;

    select @cnt = count(*)
    from dbo.USER_REGISTER a
    where a.USER_EMAIL = @picker;

    if (@cnt <> 1)
	begin
        raiserror('Invalid Operation. User does not exist.', 16, 1);
        return;
    end

    select @yesterday = DATEADD(d, -1, @today);

    update a set
        a.PPC_STATUS = 'ACCEPTED'
    from dbo.CPC_PROPOSAL_PACK_CONTENTS a
    where a.PPC_CPP_REF_NBR = @ref_nbr

    update a set
        a.TO_DATE = cast('2099-12-31' as date),
        a.FROM_DATE = @today,
        a.CREATE_DATE_STAMP = GETDATE(),
        a.CREATE_USER = @picker,
        a.STATUS_DESC = 'SUBMITTED-ACCEPTED'
    from CPC_PROPOSAL_PACK_STATUS_LOG a
    where a.CPP_REF_NBR = @ref_nbr

    insert into CPC_PROPOSAL_PACK_STATUS_LOG
        (
        CPP_REF_NBR,
        STATUS_DESC,
        FROM_DATE,
        TO_DATE,
        CREATE_DATE_STAMP,
        CREATE_USER
        )
    values
        (
            @ref_nbr,
            'ACCEPTED',
            @today,
            cast('2099-12-31' as date),
            GETDATE(),
            @picker
	);
end

GO

