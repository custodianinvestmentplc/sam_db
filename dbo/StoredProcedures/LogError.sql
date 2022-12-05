CREATE PROCEDURE [dbo].[LogError]
	@agn_code varchar(50),
	@err varchar(4000)
AS
BEGIN
	set nocount on;

	insert into dbo.COMS_ERROR (
		AGN_CODE,
		ERR_MSG
	)
	values (
		@agn_code,
		@err
	);
END

GO

