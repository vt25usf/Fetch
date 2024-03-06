-- Business Question 1 - When considering average spend from receipts with 'rewardsReceiptStatus’ 
-- of ‘Accepted’ or ‘Rejected’, which is greater?
SELECT 
    rewardsReceiptStatus, 
    AVG(totalSpent) AS AverageSpend
FROM 
    Receipts
WHERE 
    rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY 
    rewardsReceiptStatus;

-- Business Question 2 - When considering the total number of items purchased from receipts with 
-- 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

SELECT 
    rewardsReceiptStatus, 
    SUM(purchasedItemCount) AS TotalItemsPurchased
FROM 
    Receipts
WHERE 
    rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY 
    rewardsReceiptStatus;
