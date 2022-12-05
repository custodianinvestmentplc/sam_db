create procedure dbo.cpc_generate_proposal_pack_ref_nbr (
	@branch_code varchar(50),
	@new_ref_nbr varchar(50) output
)
as
begin
	set nocount on;

	declare @company_code varchar(3) = 'CLA';
	declare @create_year_string varchar(4);
	declare @create_month_string varchar(2);
	declare @create_date_miliseconds varchar(50);
	declare @create_date_day_string varchar(2);

	declare @dt int;
	declare @miliseconds int;
	declare @ans varchar(50);

	set @dt = DATEPART(d, GETDATE());
	set @miliseconds = DATEPART(millisecond,GETDATE());
	set @create_year_string = RIGHT(CONCAT(REPLICATE('0', 4), convert(varchar(4), DATEPART(YYYY, GETDATE()))), 4);
	set @create_month_string = RIGHT(CONCAT(REPLICATE('0', 2), convert(varchar(2), DATEPART(m, GETDATE()))), 2);
	set @create_date_day_string = RIGHT(CONCAT(REPLICATE('0', 2), convert(varchar(2), @dt)), 2);
	set @create_date_miliseconds = RIGHT(CONCAT(REPLICATE('0', 5), convert(varchar(5), @miliseconds)), 5);
	
	set @new_ref_nbr = @company_code + '/' + @branch_code + '/' + @create_year_string + '/' + @create_month_string + '/' + CONCAT(@create_date_day_string, @create_date_miliseconds);
end

GO

