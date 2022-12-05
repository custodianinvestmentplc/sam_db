-- ======================================================================
-- Author:		Dandy Ogiugo
-- Create date: 22-Sep-2021
-- Modified:    22-Sep-2021
-- Description:	Returns the Product Type for the specified Product Code
-- ======================================================================
CREATE FUNCTION [COMMS_PKG].[GET_PRODUCT_TYPE] (
	@prod_code varchar(50)
)
RETURNS varchar(50)
AS
BEGIN
	declare @return_value varchar(50);

	if @prod_code in ('2017406', '2016376', '2017407')
	begin
		set @return_value = 'ANNUITY';
	end
	else
	begin
		set @return_value = 'TRADITIONAL';
	end

	RETURN @return_value;
END

GO

