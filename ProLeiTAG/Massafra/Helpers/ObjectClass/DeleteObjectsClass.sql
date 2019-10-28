DECLARE @ClassName  NVARCHAR(200) = N'ZTemplate'
DECLARE @ClassKey   BIGINT        = (SELECT _Key FROM dbOds.ydm.ObjectClass WHERE _Name = @ClassName)
--
SELECT _Key, _Name  FROM dbOds.ydm.ObjectClass WHERE _Key = @ClassKey
SELECT _ObjectClassKey, _Name FROM dbOds.ydm.ObjectClassProperty WHERE _ObjectClassKey = @ClassKey

-- Drop table
IF OBJECT_ID('dbOds.Ods.' + @ClassName, 'U') IS NOT NULL EXEC('DROP TABLE Ods.' + @ClassName)
-- Drop view
IF OBJECT_ID('dbOds.Facade.' + @ClassName, 'V') IS NOT NULL EXEC('DROP VIEW Facade.' + @ClassName)

---- Delete property
DELETE FROM dbOds.ydm.ObjectClassProperty WHERE _ObjectClassKey = @ClassKey

---- Delete class
DELETE FROM dbOds.ydm.ObjectClass WHERE _Key = @ClassKey

----
SELECT _Key, _Name FROM dbOds.ydm.ObjectClass WHERE _Key = @ClassKey
SELECT _ObjectClassKey, _Name FROM dbOds.ydm.ObjectClassProperty WHERE _ObjectClassKey = @ClassKey
----