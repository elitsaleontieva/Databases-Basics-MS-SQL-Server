CREATE PROCEDURE usp_AssignProject (@employeeID int, @projectID int)
AS
BEGIN
  DECLARE @maxEmployeeProjectsCount int = 3;
  DECLARE @employeeProjectsCount int;

  BEGIN TRAN
  INSERT INTO EmployeesProjects (EmployeeID, ProjectID) 
  VALUES (@employeeID, @projectID)

  SET @employeeProjectsCount = (
    SELECT COUNT(*)
    FROM EmployeesProjects
    WHERE EmployeeID = @employeeID
  )
  IF(@employeeProjectsCount > @maxEmployeeProjectsCount)
    BEGIN
      RAISERROR('The employee has too many projects!', 16, 1);
      ROLLBACK;
    END
  ELSE COMMIT
END
