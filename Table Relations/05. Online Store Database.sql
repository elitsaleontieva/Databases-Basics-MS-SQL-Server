CREATE TABLE Cities(
  CityID INT NOT NULL PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Customers(
  CustomerID INT NOT NULL PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL,
  Birthday DATE,
  CityID INT FOREIGN KEY REFERENCES Cities(CityID)
)

CREATE TABLE Orders(
  OrderID INT NOT NULL PRIMARY KEY,
  CustomerID INT NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE ItemTypes(
  ItemTypeID INT NOT NULL PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Items(
  ItemID INT NOT NULL PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL,
  ItemTypeID INT NOT NULL FOREIGN KEY REFERENCES ItemTypes(ItemTypeID),
 
)

CREATE TABLE OrderItems(
  OrderID INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderID),
  ItemID INT NOT NULL FOREIGN KEY REFERENCES Items(ItemID),
  CONSTRAINT CK_OrderIDItemID PRIMARY KEY (OrderID,ItemID)
)
