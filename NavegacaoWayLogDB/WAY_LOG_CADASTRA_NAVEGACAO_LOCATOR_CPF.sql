USE Waylogdb

DECLARE @id_plano_locator_cpf int;
SELECT @id_plano_locator_cpf=  MAX(IdNavigationDetail) from CampaignNavigationPlan

ALTER TABLE NavigationDetail
ALTER COLUMN Description VARCHAR(255)

INSERT INTO WaylogDB..NavigationDetail(IdNavigationDetail, IndexValue, Description, DispositionId) 
VALUES 
(@id_plano_locator_cpf, '01','Iniciou o fluxo', NULL),
(@id_plano_locator_cpf, '02','Último contato foi agendamento', NULL),
(@id_plano_locator_cpf, '03','Último contato foi para transferido para o receptivo', NULL),
(@id_plano_locator_cpf, '04','Último contato foi com terceiro e coletou telefone do titular', NULL),
(@id_plano_locator_cpf, '05','Contato com um CPC', NULL),
(@id_plano_locator_cpf, '06','Pergunta se é a pessoa - Primeiro contato', NULL),
(@id_plano_locator_cpf, '07','Pergunta se é a pessoa - Segundo contato', NULL),
(@id_plano_locator_cpf, '08','Pergunta se é a pessoa - Terceiro contato', NULL),
(@id_plano_locator_cpf, '09','Pergunta se é a pessoa - Quarto contato', NULL),
(@id_plano_locator_cpf, '10','Pergunta se é a pessoa - Quinto contato', NULL),
(@id_plano_locator_cpf, '11','Pergunta se é a pessoa - Mais que cinco contatos', NULL),
(@id_plano_locator_cpf, '12','Pergunta CPF_CNPJ', NULL),
(@id_plano_locator_cpf, '13','Não confirmou CPF_CNPJ', NULL),
(@id_plano_locator_cpf, '14','Confirmou CPF_CNPJ e direcionou atendimento', NULL),
(@id_plano_locator_cpf, '15','Pergunta se é possivel localizar nesse telefone', NULL),
(@id_plano_locator_cpf, '16','Pergunta periodo ou horario', NULL),
(@id_plano_locator_cpf, '17','Agenda período ou horário combinado', NULL),
(@id_plano_locator_cpf, '18','Não agendou período', NULL),
(@id_plano_locator_cpf, '19','Pergunta número do telefone', NULL),
(@id_plano_locator_cpf, '20','Agenda ligação para o novo número de telefone', NULL),
(@id_plano_locator_cpf, '21','Não coleta telefone', NULL),
(@id_plano_locator_cpf, '22','Cliente em atrito', NULL),
(@id_plano_locator_cpf, '23','Cliente recluso - preso', NULL),
(@id_plano_locator_cpf, '24','Falecido', NULL),
(@id_plano_locator_cpf, '25','Pergunta se conhece', NULL),
(@id_plano_locator_cpf, '26','Desconhece o cliente - Engano', NULL),
(@id_plano_locator_cpf, '27','Cliente enfermo - hospitalizado', NULL),
(@id_plano_locator_cpf, '28','Correio de voz – Não está disponível – Grave sua mensagem', NULL),
(@id_plano_locator_cpf, '29','É uma pessoa próxima - deixou recado', NULL)