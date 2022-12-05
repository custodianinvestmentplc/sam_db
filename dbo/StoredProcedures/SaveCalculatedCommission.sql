CREATE PROCEDURE [dbo].[SaveCalculatedCommission]
	@agent_business_code varchar(50),
	@scenario_id varchar(50),
	@scenario_rate float,
	@prod_type varchar(50),
	@com_amt numeric(18,2),
	@com_type varchar(50),
	@com_owner varchar(50),
	@prod_name varchar(150),
	@src varchar(50),
	@row_id int
AS
BEGIN
	set nocount on;

	insert into dbo.COMS_COMPUTATION_OUTPUT (
		AGN_SHT_DESC,
		ORC_SCENARIO_ID,
		ORC_SCENARIO_RATE,
		PROD_TYPE,
		COM_AMOUNT,
		COM_TYPE,
		COM_OWNER_AGN_SHT_DESC,
		PRODUCT_NAME,
		SRC,
		RECEIPT_ROW_ID
	)
	values (
		@agent_business_code,
		@scenario_id,
		@scenario_rate,
		@prod_type,
		@com_amt,
		@com_type,
		@com_owner,
		@prod_name,
		@src,
		@row_id
	);
END

GO

