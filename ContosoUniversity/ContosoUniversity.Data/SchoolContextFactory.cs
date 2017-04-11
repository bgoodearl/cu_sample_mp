using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.Extensions.Configuration;
using System;

namespace ContosoUniversity.Data
{
    public class SchoolContextFactory : IDbContextFactory<SchoolContext>
    {
        public SchoolContext Create()
        {
            var environmentName =
                        Environment.GetEnvironmentVariable(
                            "Hosting:Environment");

            var basePath = AppContext.BaseDirectory;

            return Create(basePath, environmentName);
        }

        public SchoolContext Create(DbContextFactoryOptions options)
        {
            return Create(
                options.ContentRootPath,
                options.EnvironmentName);
        }

        private SchoolContext Create(string basePath, string environmentName)
        {
            var builder = new Microsoft.Extensions.Configuration.ConfigurationBuilder()
                .SetBasePath(basePath)
                .AddJsonFile("appsettings.json")
                .AddJsonFile($"appsettings.{environmentName}.json", true)
                .AddEnvironmentVariables();

            var config = builder.Build();

            var connstr = config.GetConnectionString("DefaultConnection");

            if (String.IsNullOrWhiteSpace(connstr) == true)
            {
                throw new InvalidOperationException(
                    "Could not find a connection string named 'DefaultConnection'.");
            }
            else
            {
                return Create(connstr);
            }
        }

        private SchoolContext Create(string connectionString)
        {
            if (string.IsNullOrEmpty(connectionString))
                throw new ArgumentException(
                    $"{nameof(connectionString)} is null or empty.",
                    nameof(connectionString));

            var optionsBuilder =
                new DbContextOptionsBuilder<SchoolContext>();

            optionsBuilder.UseSqlServer(connectionString);

            return new SchoolContext(optionsBuilder.Options);
        }

    }
}
