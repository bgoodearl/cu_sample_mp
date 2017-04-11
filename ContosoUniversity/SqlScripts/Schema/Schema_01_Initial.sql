--USE ContosoUniversity3Dev;
--USE ContosoUniversity3;
GO

IF OBJECT_ID(N'__EFMigrationsHistory') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Person] (
    [ID] int NOT NULL IDENTITY,
    [Discriminator] nvarchar(max) NOT NULL,
    [FirstName] nvarchar(50) NOT NULL,
    [LastName] nvarchar(50) NOT NULL,
    [HireDate] datetime2,
    [EnrollmentDate] datetime2,
    CONSTRAINT [PK_Person] PRIMARY KEY ([ID])
);

GO

CREATE TABLE [Department] (
    [DepartmentID] int NOT NULL IDENTITY,
    [Budget] money NOT NULL,
    [InstructorID] int,
    [Name] nvarchar(50),
    [RowVersion] rowversion,
    [StartDate] datetime2 NOT NULL,
    CONSTRAINT [PK_Department] PRIMARY KEY ([DepartmentID]),
    CONSTRAINT [FK_Department_Person_InstructorID] FOREIGN KEY ([InstructorID]) REFERENCES [Person] ([ID]) ON DELETE NO ACTION
);

GO

CREATE TABLE [OfficeAssignment] (
    [InstructorID] int NOT NULL,
    [Location] nvarchar(50),
    CONSTRAINT [PK_OfficeAssignment] PRIMARY KEY ([InstructorID]),
    CONSTRAINT [FK_OfficeAssignment_Person_InstructorID] FOREIGN KEY ([InstructorID]) REFERENCES [Person] ([ID]) ON DELETE CASCADE
);

GO

CREATE TABLE [Course] (
    [CourseID] int NOT NULL,
    [Credits] int NOT NULL,
    [DepartmentID] int NOT NULL,
    [Title] nvarchar(50),
    CONSTRAINT [PK_Course] PRIMARY KEY ([CourseID]),
    CONSTRAINT [FK_Course_Department_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [Department] ([DepartmentID]) ON DELETE CASCADE
);

GO

CREATE TABLE [CourseAssignment] (
    [CourseID] int NOT NULL,
    [InstructorID] int NOT NULL,
    CONSTRAINT [PK_CourseAssignment] PRIMARY KEY ([CourseID], [InstructorID]),
    CONSTRAINT [FK_CourseAssignment_Course_CourseID] FOREIGN KEY ([CourseID]) REFERENCES [Course] ([CourseID]) ON DELETE CASCADE,
    CONSTRAINT [FK_CourseAssignment_Person_InstructorID] FOREIGN KEY ([InstructorID]) REFERENCES [Person] ([ID]) ON DELETE CASCADE
);

GO

CREATE TABLE [Enrollment] (
    [EnrollmentID] int NOT NULL IDENTITY,
    [CourseID] int NOT NULL,
    [Grade] int,
    [StudentID] int NOT NULL,
    CONSTRAINT [PK_Enrollment] PRIMARY KEY ([EnrollmentID]),
    CONSTRAINT [FK_Enrollment_Course_CourseID] FOREIGN KEY ([CourseID]) REFERENCES [Course] ([CourseID]) ON DELETE CASCADE,
    CONSTRAINT [FK_Enrollment_Person_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [Person] ([ID]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_Course_DepartmentID] ON [Course] ([DepartmentID]);

GO

CREATE INDEX [IX_CourseAssignment_InstructorID] ON [CourseAssignment] ([InstructorID]);

GO

CREATE INDEX [IX_Department_InstructorID] ON [Department] ([InstructorID]);

GO

CREATE INDEX [IX_Enrollment_CourseID] ON [Enrollment] ([CourseID]);

GO

CREATE INDEX [IX_Enrollment_StudentID] ON [Enrollment] ([StudentID]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20170411230014_Schema_01_Initial', N'1.1.1');

GO

