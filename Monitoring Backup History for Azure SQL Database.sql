#SCRIPT-1
=======
SELECT db.name
    , backup_start_date
    , backup_finish_date
    , CASE backup_type
        WHEN 'D' THEN 'Full'
        WHEN 'I' THEN 'Differential'
        WHEN 'L' THEN 'Transaction Log'
    END AS BackupType
    , CASE in_retention
        WHEN 1 THEN 'In Retention'
        WHEN 0 THEN 'Out of Retention'
        END AS is_Backup_Available
FROM sys.dm_database_backups AS ddb
INNER MERGE JOIN sys.databases AS db
    ON ddb.physical_database_name = db.physical_database_name
ORDER BY backup_start_date DESC;

#SCRIPT-2
=======

SELECT db.name
    , backup_start_date
    , backup_finish_date
    , CASE backup_type
        WHEN 'D' THEN 'Full'
        WHEN 'I' THEN 'Differential'
        WHEN 'L' THEN 'Transaction Log'
    END AS BackupType
    , CASE in_retention
        WHEN 1 THEN 'In Retention'
        WHEN 0 THEN 'Out of Retention'
        END AS is_Backup_Available
FROM sys.dm_database_backups AS ddb
INNER MERGE JOIN sys.databases AS db
    ON ddb.physical_database_name = db.physical_database_name
WHERE db.name = 'SampleDB' 
ORDER BY backup_start_date DESC;

#SCRIPT-3
=======
SELECT * 
FROM sys.dm_database_backups     
ORDER BY backup_finish_date DESC; 
