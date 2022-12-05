CREATE PROCEDURE [dbo].[MoveUploadDataToProcessingTable]
AS
BEGIN
	set nocount on;

	truncate table dbo.TQ_COMS_DATA;

	insert into dbo.TQ_COMS_DATA (
		UPLOAD_DATA_ROW_ID,
		POLICY_NUMBER,
		RECEIPT_NUMBER,
		ALLOCATED_AMOUNT,
		DEPOSIT_AMOUNT,
		AGN_CODE,
		GROSS_COMM,
		COMMISSION_RATE_PCT,
		WHT_AMT,
		DR_CR,
		PROD_CODE,
		PROD_NAME,
		SRC,
		AGN_SHT_DESC
	)
	select
		a.ROW_ID,
		a.POLICY_NO,
		a.RECEIPT_NO,
		a.ALLOCATED_AMT,
		a.DEPOSIT_AMT,
		dbo.GET_AGN_CODE_BY_POLICY_NO(a.POLICY_NO),
		a.COMM_AMT,
		a.COMM_RATE_PCT,
		a.WHT_AMT,
		a.DR_CR_IND,
		dbo.GET_PROD_CODE_BY_POLICY_NO(a.POLICY_NO),
		a.PROD_NAME,
		a.SRC,
		a.AGN_SHT_DESC
	from dbo.TQ_UPLOAD_DATA a
END

GO

