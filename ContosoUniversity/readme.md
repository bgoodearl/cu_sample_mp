# Contoso University ASP.NET Core MVC sample app

Contoso University demonstrates how to use Entity Framework Core in an
ASP.NET Core MVC web application.

In this version of the app, ContosoUniversity.Models and ContosoUniversity.Data are separate projects, allowing the StudentContext to be tested apart from the
web app.

## BEFORE YOU START:

appsettings.json, appsettings.Development.json and Properties\launchSettings.json have values
that can be specific to your local environment.  Rather than version them with the application,
The files can be found in the tree under _SettingsSource and copied from there to the tree under
The solution root folder.

## Build it from scratch

** NOTE: The original tutorials put ContosoUniversity.Models and ContosoUniversity.Data into the web application.

## Download it

Download the [completed project](https://github.com/bgoodearl/cu_sample_mp) from GitHub by downloading or cloning the [cu_sample_mp repository](https://github.com/bgoodearl/cu_sample_mp) and navigating to `ContosoUniversity` in your local file system.

## Tutorials for original app

You can build the original application by following the steps in [a series of tutorials](https://docs.asp.net/en/latest/data/ef-mvc/intro.html).

## Download original project

Download the [original completed project](https://github.com/aspnet/Docs/tree/master/aspnetcore/data/ef-mvc/intro/samples/cu-final) from GitHub by downloading or cloning the [aspnet/Docs repository](https://github.com/aspnet/Docs) and navigating to `aspnetcore\data\ef-mvc\intro\samples\cu-final` in your local file system.  After downloading the project, create the database by entering `dotnet ef database update` at a command-line prompt. As an alternative you can use **Package Manager Console** -- for more information, see [Command-line interface (CLI) vs. Package Manager Console (PMC)](https://docs.microsoft.com/en-us/aspnet/core/data/ef-mvc/migrations#command-line-interface-cli-vs-package-manager-console-pmc).
