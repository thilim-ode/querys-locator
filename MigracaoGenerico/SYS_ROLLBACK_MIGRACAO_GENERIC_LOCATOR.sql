update SysConfiguration..Campaign 
set OutboundDnis = 
	case OutboundDnis
		when 'ada-locator-semcpf-generic-v2' 
			then 'ada-locator-semcpf-history'
		when 'ada-locator-comcpf-generic-v2' 
			then 'ada-locator-cpf-history' 
	end,
	VirtualAgentUUI = NULL,
	LastModified = GETDATE()
where OutboundDnis in ('ada-locator-semcpf-generic-v2', 'ada-locator-comcpf-generic-v2');