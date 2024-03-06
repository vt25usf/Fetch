-- Users Table
CREATE TABLE Users (
    _id VARCHAR(255) PRIMARY KEY,
    state VARCHAR(2),
    createdDate DATETIME,
    lastLogin DATETIME,
    role VARCHAR(50),
    active BIT
);

-- Receipts Table
CREATE TABLE Receipts (
    _id VARCHAR(255) PRIMARY KEY,
    bonusPointsEarned INT,
    bonusPointsEarnedReason VARCHAR(255),
    createDate DATETIME,
    dateScanned DATETIME,
    finishedDate DATETIME,
    modifyDate DATETIME,
    pointsAwardedDate DATETIME,
    pointsEarned INT,
    purchaseDate DATETIME,
    purchasedItemCount INT,
    rewardsReceiptStatus VARCHAR(50),
    totalSpent MONEY,
    userId VARCHAR(255),
    CONSTRAINT fk_userId FOREIGN KEY (userId) REFERENCES Users(_id)
);

-- Brand Table
CREATE TABLE Brand (
    _id VARCHAR(255) PRIMARY KEY,
    barcode VARCHAR(255),
    brandCode VARCHAR(255),
    category VARCHAR(255),
    categoryCode VARCHAR(255),
    cpg VARCHAR(255),
    topBrand BIT,
    name VARCHAR(255)
);
