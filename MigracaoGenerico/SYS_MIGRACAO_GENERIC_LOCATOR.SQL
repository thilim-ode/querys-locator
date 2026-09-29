declare @WayNewId varchar(50);
declare @UUIWayNew varchar(255);
declare @preTemplate varchar(50);
select @WayNewId = ServiceID from SysConfiguration..Services where Name LIKE '%Way%' AND Name LIKE '%New%';
select @UuiWayNew = ConfigValue from SysConfiguration..ServicesConfig where ServiceId = @WayNewId and ConfigKey = 'UuiService';
set @preTemplate = case
	when @UUIWayNew like '%X-Tenant%'
		then 'X-CampaignType:'
	else 'CampaignType:'
end
update SysConfiguration..Campaign 
set OutboundDnis = 
	case OutboundDnis
		when 'ada-locator-semcpf-history' 
			then 'ada-locator-semcpf-generic-v2'
		when 'ada-locator-cpf-history' 
			then 'ada-locator-comcpf-generic-v2' 
	end,
	VirtualAgentUUI =
	case OutboundDnis
		when 'ada-locator-semcpf-history' 
			then @preTemplate + 'locator'
		when 'ada-locator-cpf-history' 
			then @preTemplate + 'locatorCPF'
	end,
	LastModified = GETDATE()
where OutboundDnis in ('ada-locator-semcpf-history', 'ada-locator-cpf-history');

SELECT CampaignId, Description, Activated, LastModified, OutboundDnis, VirtualAgentUUI FROM Sysconfiguration..Campaign
WHERE Description LIKE '%loc%' and Activated = 1

USE WayLogDB

SELECT * FROM WayCallControl
WHERE CampaignId = 77
ORDER BY StartCallDate DESC

SELECT * FROM NavigationTreeLog
WHERE CampaignId = 77 ORDER BY DateStamp DESC

SELECT CampaignId, Description, Activated, LastModified, OutboundDnis, VirtualAgentUUI FROM Sysconfiguration..Campaign
WHERE CampaignId in (77, 76, 75)