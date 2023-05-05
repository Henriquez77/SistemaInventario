drop database Inventario
go

SELECT * FROM sys.sysprocesses WHERE dbid = DB_ID('Inventario')
go

KILL 56 
go