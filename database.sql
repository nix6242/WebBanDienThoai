CREATE TABLE AdminUser (
    ID INT PRIMARY KEY IDENTITY(1,1),
    NameUser NVARCHAR(100) NOT NULL,
    RoleUser NVARCHAR(50) NOT NULL,
    PasswordUser NVARCHAR(255) NOT NULL
);

-- B?ng Customer
CREATE TABLE Customer (
    IDCus INT PRIMARY KEY IDENTITY(1,1),
    NameCus NVARCHAR(100) NOT NULL,
    PhoneCus NVARCHAR(20),
    EmailCus NVARCHAR(100)
);

-- B?ng Category
CREATE TABLE Category (
    IDCate INT PRIMARY KEY IDENTITY(1,1),
    NameCate NVARCHAR(100) NOT NULL
);

-- B?ng Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    NamePro NVARCHAR(100) NOT NULL,
    DescriptionPro NVARCHAR(255),
    CategoryID INT FOREIGN KEY REFERENCES Category(IDCate),
    Price DECIMAL(18,2) NOT NULL,
    ImagePro NVARCHAR(255)
);

-- B?ng OrderPro
CREATE TABLE OrderPro (
    ID INT PRIMARY KEY IDENTITY(1,1),
    DateOrder DATE NOT NULL,
    IDCus INT FOREIGN KEY REFERENCES Customer(IDCus),
    AddressDelivery NVARCHAR(255)
);

-- B?ng OrderDetail
CREATE TABLE OrderDetail (
    ID INT PRIMARY KEY IDENTITY(1,1),
    IDProduct INT FOREIGN KEY REFERENCES Products(ProductID),
    IDOrder INT FOREIGN KEY REFERENCES OrderPro(ID),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL
);

-- B?ng Payment
CREATE TABLE Payment (
    IDPayment INT PRIMARY KEY IDENTITY(1,1),
    IDOrder INT FOREIGN KEY REFERENCES OrderPro(ID),
    PaymentDate DATE NOT NULL,
    PaymentMethod NVARCHAR(50),
    PaymentAmount DECIMAL(18,2) NOT NULL
);

-- B?ng Supplier
CREATE TABLE Supplier (
    IDSupplier INT PRIMARY KEY IDENTITY(1,1),
    NameSupplier NVARCHAR(100) NOT NULL,
    PhoneSupplier NVARCHAR(20),
    AddressSupplier NVARCHAR(255)
);

-- B?ng Inventory
CREATE TABLE Inventory (
    IDInventory INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    QuantityInStock INT NOT NULL
);