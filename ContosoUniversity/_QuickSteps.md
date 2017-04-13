Quick Steps
===========

Quick Notes about steps to create projects

1) Created solution with project ContosoUniversity.Models
2) Copied in model classes from cu-final
3) Added NuGet reference for Annotations

4) Added project ContosoUniversity.Data
5) Copied Context and Initializer from cu-final

6) Added ASP.NET Core MVC web application

	See https://docs.microsoft.com/en-us/aspnet/core/data/ef-mvc/intro#the-contoso-university-web-application
	Created web application with initial modifications and steps just prior to setting up database.

7) Added DataHelper
	Console project allows default setup for Migrations in data project using different database
	from that used for local dev testing.

8) Wired up database
	Added SchoolContextFactory to ContosoUniversity.Data.
	Ran Package Manager Console commands found in readme.md under ContosoUniversity.Data.

9) Added test project for InMemory tests of SchoolContext.
