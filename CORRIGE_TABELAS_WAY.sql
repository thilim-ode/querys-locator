DECLARE @validUpdateADA int;

if exists (select * from sys.databases where name = 'WayLogDB')
begin
    USE WayLogDB
    if not exists (select * from sys.columns where object_id in (SELECT object_id FROM SYS.tables WHERE NAME = 'WayCallControl') and name in ('ExtraInfo'))
    begin
        alter table WayCallControl add ExtraInfo [varchar](50) NULL
        set @validUpdateADA = @validUpdateADA + 1
    end else set @validUpdateADA = -1
end
 
if exists (select * from sys.databases where name = 'SysConfiguration')
begin
    use SysConfiguration
    if not exists (select * from sys.columns where object_id in (SELECT object_id FROM SYS.tables WHERE NAME = 'Campaign') and name = 'VirtualAgentUUI')
    begin
        alter table Campaign add VirtualAgentUUI [varchar](100) null
        set @validUpdateADA = @validUpdateADA + 1
    end else set @validUpdateADA = -2
    if not exists (select * from sys.columns where object_id in (SELECT object_id FROM SYS.tables WHERE NAME = 'Campaign') and name = 'CouldNotTransferDispositionId')
    begin
        alter table Campaign add CouldNotTransferDispositionId [int] NULL
        set @validUpdateADA = @validUpdateADA + 1
    end else set @validUpdateADA = -3
end