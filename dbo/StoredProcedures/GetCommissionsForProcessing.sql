CREATE PROCEDURE [dbo].[GetCommissionsForProcessing]
AS
BEGIN
	set nocount on;

	with cte_1 as (
		select
			a.AGN_CODE AgentCode,
			abs((abs(a.GROSS_COMM) - abs(a.WHT_AMT))) NetCommissionAmount,
			case 
				when a.DR_CR = 'C' then 1 
				else -1 
			end CommissionFactor,
			COMMS_PKG.GET_PRODUCT_TYPE(a.PROD_CODE) ProductType,
			A.SRC CommissionSource,
			abs(a.GROSS_COMM) GrossCommission,
			a.PROD_NAME ProductName,
			a.UPLOAD_DATA_ROW_ID,
			a.RECEIPT_NUMBER,
			a.POLICY_NUMBER,
			a.ALLOCATED_AMOUNT,
			a.DEPOSIT_AMOUNT,
			a.COMMISSION_RATE_PCT,
			a.WHT_AMT,
			a.AGN_SHT_DESC
		from dbo.TQ_COMS_DATA a
	),
	cte_2 as (
		select
			a.AgentCode,
			(a.NetCommissionAmount * a.CommissionFactor) CommissionAmount,
			a.ProductType,
			a.CommissionSource,
			a.GrossCommission * a.CommissionFactor GrossCommissionAmount,
			a.ProductName,
			a.UPLOAD_DATA_ROW_ID RowId,
			a.RECEIPT_NUMBER ReceiptNumber,
			a.POLICY_NUMBER PolicyNumber,
			a.ALLOCATED_AMOUNT AllocatedAmount,
			a.DEPOSIT_AMOUNT DepositAmount,
			a.COMMISSION_RATE_PCT CommissionRate,
			a.WHT_AMT WithholdingAmount,
			a.AGN_SHT_DESC AgentBusinessCode
		from cte_1 a
	)
	select
		convert(varchar(50), a.AgentCode) AgentCode,
		convert(numeric(18,5), a.CommissionAmount) CommissionAmount,
		a.ProductType,
		a.CommissionSource,
		a.GrossCommissionAmount,
		a.ProductName,
		a.RowId,
		a.ReceiptNumber,
		a.PolicyNumber,
		a.AllocatedAmount,
		a.DepositAmount,
		a.CommissionRate,
		a.WithholdingAmount,
		a.AgentBusinessCode
	from cte_2 a	
END

GO

