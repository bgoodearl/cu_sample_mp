# ContosoUniversity.Data Migrations

## Using Package Manager Console

http://stackoverflow.com/questions/42971449/vs2017-the-operation-failed-as-details-for-project-could-not-be-loaded

If you get an error opening the Package Manager console after opening the solution,
Start Visual Studio 2017 without opening a solution, open the Package Manager Console,
and after you get the PM prompt, then open the solution.

Make sure the solution has ContosoUniversity.DataHelper as the default project, and
that the Package Manager Console has ContosoUniversity.Data as its "Default project".

Be sure to copy appsettings.json from _SettingsSource\ContosoUniversity.DataHelper
to ContosoUniversity.DataHelper and correct the connection string as necessary.

In order to do schema updates by SQL scripts (rather than in code), create the database
ContosoUniversity3Dev in your SQL instance.

Run the following command:
```
Add-Migration Schema_01_Initial
```

```
Script-Migration -From 0 -To Schema_01_Initial
```
and save the resulting SQL script under ContosoUniversity\\SqlScripts

Run the script to populate the database schema.
