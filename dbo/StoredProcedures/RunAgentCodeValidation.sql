CREATE PROCEDURE [dbo].[RunAgentCodeValidation]
	@agent_code varchar(50)
AS
BEGIN
	exec dbo.ValidateAgentCode @agent_code;
	exec dbo.ValidateAgentCodeStatus @agent_code;
	exec dbo.ValidateAgentCodeUniqueness @agent_code;
	exec dbo.ValidateAgentCodeUtilization @agent_code;
	exec dbo.ValidateAgentSalesCodeUniqueness @agent_code;
END

GO

