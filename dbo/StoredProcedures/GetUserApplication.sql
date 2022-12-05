
CREATE PROCEDURE [dbo].[GetUserApplication]
	@user_email varchar(150)
AS
BEGIN
	set nocount on;

	declare @user_id int;

	select @user_id = a.ROW_ID
	from dbo.USER_REGISTER a
	where a.USER_EMAIL = @user_email;

	if (@user_id is not null)
	begin
		select
			a.ROW_ID UserApplicationRegisterId,
			a.USER_ROW_ID UserRegisterRowId,
			a.APP_ROW_ID ApplicationRegisterRowId,
			b.USER_EMAIL UserEmail,
			b.DISPLAY_NAME UserDisplayName,
			c.APP_TITLE ApplicationTitle,
			c.ROLE_ID ApplicationSubtitle,
			c.CONTROLLER_NAME ControllerName,
			c.CONTROLLER_ACTION ControllerAction
		from dbo.USER_APP_REGISTER a
		join dbo.USER_REGISTER b on b.ROW_ID = a.USER_ROW_ID
		join dbo.APP_REGISTER c on c.ROW_ID = a.APP_ROW_ID
		where a.USER_ROW_ID = @user_id;
	end;
END

GO

