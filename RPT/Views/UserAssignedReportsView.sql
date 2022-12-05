CREATE VIEW [rpt].[UserAssignedReportsView]
AS
	select
		a.USER_EMAIL UserEmail,
		a.REPORT_ITEM_ID ReportItemId,
		b.MODULE_ROW_ID ModuleId,
		b.REPORT_DISPLAY_NAME ReportDisplayName,
		b.CLIENT_ROUTE_ATTRIBUTE ReportItemClientRouteAttribute,
		c.MODULE_ID_NAME ModuleIdName,
		c.DISPLAY_NAME ModuleDisplayName,
		c.URL_SEGMENT ModuleUrlSegnment
	from rpt.REPORT_ASSIGNED_REPORT_ITEMS a
	join rpt.REPORT_ITEM b on b.REPORT_ID = a.REPORT_ITEM_ID
	join rpt.REPORT_MODULES c on c.ROW_ID = b.MODULE_ROW_ID

GO

