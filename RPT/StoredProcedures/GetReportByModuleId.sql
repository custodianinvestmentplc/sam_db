
CREATE PROCEDURE [RPT].[GetReportByModuleId]
       @module_id int,
       @user_email varchar(150)
AS

BEGIN
	set nocount on;

	select
		a.ReportItemId Id,
		a.ReportDisplayName DisplayName,
		a.ModuleId,
		a.ReportItemClientRouteAttribute ClientRouteAttribute
	from [rpt].[UserAssignedReportsView] a
	where a.ModuleId = @module_id
	and a.UserEmail = @user_email
END

GO

