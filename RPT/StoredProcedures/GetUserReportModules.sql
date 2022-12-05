CREATE PROCEDURE [rpt].[GetUserReportModules]
	@user_email varchar(150)
AS
BEGIN
	set nocount on;

	SELECT
		a.ROW_ID Id,
		a.MODULE_ID_NAME IdName,
		a.DISPLAY_NAME DisplayName,
		a.URL_SEGMENT UrlSegmentName
	FROM RPT.REPORT_MODULES a
	where exists (
		select 1
		from rpt.UserAssignedReportsView b
		where b.ModuleId = a.ROW_ID
		and b.UserEmail = @user_email
	);
END

GO

