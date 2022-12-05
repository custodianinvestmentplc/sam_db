CREATE PROCEDURE [dbo].[SaveValidationResult]
	@agn_code varchar(50),
	@test_name varchar(150),
	@test_msg varchar(250)
AS
BEGIN
	insert into dbo.COMMS_VALIDATION_RESULT (
		AGN_CODE,
		VALIDATION_TEST,
		VALIDATION_MESSAGE
	)
	values (
		@agn_code,
		@test_name,
		@test_msg
	);
END

GO

