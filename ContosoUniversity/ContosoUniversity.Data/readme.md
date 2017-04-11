# ContosoUniversity.Data Migrations

## Using Package Manager Console

http://stackoverflow.com/questions/42971449/vs2017-the-operation-failed-as-details-for-project-could-not-be-loaded

If you get an error opening the Package Manager console after opening the solution,
Start Visual Studio 2017 without opening a solution, open the Package Manager Console,
and after you get the PM prompt, then open the solution.

Make sure the solution has ContosoUniversity as the default project, and
that the Package Manager Console has ContosoUniversity.Data as its "Default project".

Run the following command:
```
Add-Migration Schema_01_Initial
```

```
Script-Migration -From 0 -To Schema_01_Initial
```
and save the resulting SQL script under ContosoUniversity\\SqlScripts

Run the script to populate the database schema.
