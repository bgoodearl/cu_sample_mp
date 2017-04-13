using ContosoUniversity.Data;
using ContosoUniversity.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace ContosoUniversity.DataInMemoryTests
{
    [TestClass]
    public class SchoolContextTests
    {
        [TestMethod]
        public async Task Initialize_context()
        {
            var options = new DbContextOptionsBuilder<SchoolContext>()
                .UseInMemoryDatabase(databaseName: "Initialize_context")
                .Options;

            using (var context = new SchoolContext(options))
            {
                DbInitializer.Initialize(context);
                Assert.AreNotEqual(0, await context.Students.CountAsync());
                Assert.AreEqual(8, await context.Students.CountAsync());
            }
        }
    }
}
