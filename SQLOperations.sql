
select * from dbo.Users;

SELECT 
    *, COUNT(*) as DuplicateCount
FROM 
    dbo.Users
GROUP BY 
    id, state, role, active, createdDate, lastLogin
HAVING 
    COUNT(*) > 1;

;WITH RankedDuplicates AS (
    SELECT
        [id],
        [state],
        [role],
        [active],
        [createdDate],
        [lastLogin],
        ROW_NUMBER() OVER (
            PARTITION BY [id], [state], [role], [active], [createdDate], [lastLogin]
            ORDER BY (CASE WHEN [role] = 'consumer' THEN 1 ELSE 2 END)
        ) AS RowNum
    FROM dbo.Users
)
DELETE FROM RankedDuplicates
WHERE RowNum > 1;


SELECT id, COUNT(*)
FROM dbo.Users
GROUP BY id
HAVING COUNT(*) > 1;

ALTER TABLE dbo.Receipts
ADD CONSTRAINT FK_Receipts_Users_userId
FOREIGN KEY (userId) REFERENCES dbo.Users(id); 

SELECT DISTINCT r.userId
FROM dbo.Receipts r
LEFT JOIN dbo.Users u ON r.userId = u.id
WHERE u.id IS NULL;

select count(*) from dbo.Receipts;

Delete FROM dbo.Receipts
WHERE userId NOT IN (SELECT id FROM dbo.Users);
