CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(50) NOT NULL,
    passwordHash NVARCHAR(128) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    [status] varchar(50),
    AddressLine1 NVARCHAR(100) NULL,
    addressLine2 NVARCHAR(100) NULL,
    City NVARCHAR(50) NULL,
    [State] NVARCHAR(50) NULL,
    CountryID INT NULL,
    postalCode NVARCHAR(20) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE()
);
go
alter PROCEDURE adduser

    @name nvarchar(50),
    @password nvarchar(50),
    @email nvarchar(100),
    @status nvarchar(50),
    @address1 nvarchar(100),
    @address2 nvarchar(100),
    @city nvarchar(50),
    @state nvarchar(50),
    @countryId int,
    @postal nvarchar(20),
    @createdAt datetime
AS
BEGIN
    INSERT INTO Users (username, PasswordHash, Email, [Status], AddressLine1, AddressLine2, City, State, CountryId, PostalCode, CreatedAt)
    VALUES (@name, @password, @email, @status, @address1, @address2, @city, @state, @countryId, @postal, @createdAt)