
CREATE PROCEDURE [dbo].[GetUserByEmail]
    @user_email varchar(150)
AS
BEGIN
    set nocount on;

    select
        a.ROW_ID UserRegisterRowId,
        a.USER_EMAIL UserEmail,
        a.DISPLAY_NAME UserDisplayName,
        a.ROLE_ID UserRoleId,
        b.ROLE UserRole
    from dbo.USER_REGISTER a
        join dbo.USER_ROLE b on b.ROW_ID = a.ROLE_ID
    where a.USER_EMAIL = @user_email;
END

GO

