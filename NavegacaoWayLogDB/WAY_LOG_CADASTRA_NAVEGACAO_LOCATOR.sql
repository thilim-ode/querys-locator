USE Waylogdb

DECLARE @id_plano_locator int;
SELECT @id_plano_locator = MAX(IdNavigationDetail) - 1 from CampaignNavigationPlan

ALTER TABLE WaylogDB..NavigationDetail 
ALTER COLUMN Description VARCHAR(255)	

INSERT INTO WaylogDB..NavigationDetail(IdNavigationDetail, IndexValue, Description, DispositionId) 
VALUES 
(@id_plano_locator, '01','Iniciou o fluxo', NULL),
(@id_plano_locator, '02','Último contato foi agendamento', NULL),
(@id_plano_locator, '03','Último contato foi para transferido para o receptivo', NULL),
(@id_plano_locator, '04','Último contato foi com terceiro e coletou telefone do titular', NULL),
(@id_plano_locator, '05','Contato com um CPC', NULL),
(@id_plano_locator, '06','Pergunta se é a pessoa - Primeiro contato', NULL),
(@id_plano_locator, '07','Pergunta se é a pessoa - Segundo contato', NULL),
(@id_plano_locator, '08','Pergunta se é a pessoa - Terceiro contato', NULL),
(@id_plano_locator, '09','Pergunta se é a pessoa - Quarto contato', NULL),
(@id_plano_locator, '10','Pergunta se é a pessoa - Quinto contato', NULL),
(@id_plano_locator, '11','Pergunta se é a pessoa - Mais que cinco contatos', NULL),
(@id_plano_locator, '12','É a pessoa e direcionou atendimento', NULL),
(@id_plano_locator, '13','Pergunta se é possivel localizar nesse telefone', NULL),
(@id_plano_locator, '14','Pergunta periodo ou horario', NULL),
(@id_plano_locator, '15','Agenda no período ou horário combinado', NULL),
(@id_plano_locator, '16','Não agendou período', NULL),
(@id_plano_locator, '17','Pergunta numero do telefone', NULL),
(@id_plano_locator, '18','Agenda ligação para o novo número de telefone', NULL),
(@id_plano_locator, '19','Não coleta telefone', NULL),
(@id_plano_locator, '20','Cliente em atrito', NULL),
(@id_plano_locator, '21','Cliente recluso - preso', NULL),
(@id_plano_locator, '22','Falecido', NULL),
(@id_plano_locator, '23','Pergunta se conhece', NULL),
(@id_plano_locator, '24','Desconhece o cliente - Engano', NULL),
(@id_plano_locator, '25','Cliente enfermo - hospitalizado', NULL),
(@id_plano_locator, '26','Correio de voz – Não está disponível – Grave sua mensagem', NULL),
(@id_plano_locator, '27','É uma pessoa próxima - deixou recado', NULL)