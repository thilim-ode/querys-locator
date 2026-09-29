USE SysConfiguration

DECLARE @id_plano_locator_cpf int;
SELECT @id_plano_locator_cpf = IdNavigationPlan from NavigationPlan where name = '[ ADA ] Locator (com CPF)'
---
UPDATE Disposition
SET Description = 'LOC_Pergunta periodo ou horario'
WHERE Description = 'LOC_Pergunta quando pode retornar'

UPDATE Disposition
SET Description = 'LOC_Agenda periodo ou horario combinado'
WHERE Description = 'LOC_Agenda periodo'

UPDATE Disposition
SET Description = 'LOC_Cliente recluso - preso'
WHERE Description = 'LOC_Cliente recluso'

UPDATE Disposition
SET Description = 'LOC_Correio de voz - Nao esta disponivel - Grave sua mensagem'
WHERE Description = 'LOC_Correio de voz - Gravacao'
---
DECLARE @disposition_id_iniciou_o_fluxo int; 
SELECT @disposition_id_iniciou_o_fluxo = DispositionId FROM Disposition 
where Description = 'LOC_Iniciou o fluxo';

DECLARE @disposition_id_pergunta_se_e_pessoa int;
SELECT @disposition_id_pergunta_se_e_pessoa = DispositionId FROM Disposition 
where Description = 'LOC_Pergunta se e a pessoa';

DECLARE @disposition_id_pergunta_cpf_cnpj int; 
SELECT @disposition_id_pergunta_cpf_cnpj = DispositionId FROM Disposition 
where Description = 'LOC_Pergunta CPF_CNPJ';

DECLARE @disposition_id_nao_confirmou_cpf_cnpj int;
SELECT @disposition_id_nao_confirmou_cpf_cnpj = DispositionId FROM Disposition 
where Description = 'LOC_Nao confirmou CPF_CNPJ'

DECLARE @disposition_id_confirmou_cpf_cnpj int;
SELECT @disposition_id_confirmou_cpf_cnpj = DispositionId FROM Disposition 
where Description = 'LOC_Confirmou CPF_CNPJ e direcionou atendimento'

DECLARE @disposition_id_pergunta_se_pode_localizar int;
SELECT @disposition_id_pergunta_se_pode_localizar = DispositionId FROM Disposition 
where Description = 'LOC_Pergunta se e possivel localizar nesse telefone'

DECLARE @disposition_id_pergunta_periodo int;
SELECT @disposition_id_pergunta_periodo = DispositionId FROM Disposition 
where Description = 'LOC_Pergunta periodo ou horario'

DECLARE @disposition_id_agenda_periodo int;
SELECT @disposition_id_agenda_periodo = DispositionId FROM Disposition 
where Description = 'LOC_Agenda periodo ou horario combinado'

DECLARE @disposition_id_nao_agendou int;
SELECT @disposition_id_nao_agendou = DispositionId FROM Disposition 
where Description = 'LOC_Nao agendou periodo'

DECLARE @disposition_id_pergunta_numero_telefone int;
SELECT @disposition_id_pergunta_numero_telefone = DispositionId FROM Disposition 
where Description = 'LOC_Pergunta numero do telefone'

DECLARE @disposition_id_agenda_licacao_numero_novo int;
SELECT @disposition_id_agenda_licacao_numero_novo = DispositionId FROM Disposition 
where Description = 'LOC_Agenda ligacao para novo numero de telefone'

DECLARE @disposition_id_nao_coleta_telefone int;
SELECT @disposition_id_nao_coleta_telefone = DispositionId FROM Disposition 
where Description = 'LOC_Nao coleta telefone'

DECLARE @disposition_id_ciente_atrito int;
SELECT @disposition_id_ciente_atrito = DispositionId FROM Disposition 
where Description = 'LOC_Cliente em atrito'

DECLARE @disposition_id_cliente_recluso int;
SELECT @disposition_id_cliente_recluso = DispositionId FROM Disposition 
where Description = 'LOC_Cliente recluso - preso'

DECLARE @disposition_id_falecido int;
SELECT @disposition_id_falecido = DispositionId FROM Disposition 
where Description = 'LOC_Falecido'

DECLARE @disposition_id_pergunta_se_conhece int;
SELECT @disposition_id_pergunta_se_conhece = DispositionId FROM Disposition 
where Description = 'LOC_Pergunta se conhece'

DECLARE @disposition_id_desconhece_o_cliente int;
SELECT @disposition_id_desconhece_o_cliente = DispositionId FROM Disposition 
where Description = 'LOC_Desconhece o cliente - Engano'

DECLARE @disposition_id_cliente_enfermo int;
SELECT @disposition_id_cliente_enfermo = DispositionId FROM Disposition 
where Description = 'LOC_Cliente enfermo - hospitalizado'

DECLARE @disposition_id_correio_de_voz int;
SELECT @disposition_id_correio_de_voz = DispositionId FROM Disposition 
where Description = 'LOC_Correio de voz - Nao esta disponivel - Grave sua mensagem'

---
DECLARE @max_disposition_id INT;
SELECT @max_disposition_id = MAX(DispositionId) + 1 FROM Disposition 
INSERT INTO Disposition (DispositionId, Description, flag_AutoDisposition, Activated, LastModifiedUserId, LastModified, BillingCode)
VALUES (@max_disposition_id, 'LOC_E uma pessoa proxima - Deixou recado', 0, 1, 1, GETDATE(), NULL)
---

DECLARE @disposition_id_e_proximo_deixou_recado int;
SELECT @disposition_id_e_proximo_deixou_recado = DispositionId FROM Disposition 
where Description = 'LOC_E uma pessoa proxima - Deixou recado'

-- Cria detalhes do plano de navegação 

ALTER TABLE NavigationDetail
ALTER COLUMN Description VARCHAR(255)

INSERT INTO NavigationDetail(IdNavigationPlan, IndexValue, Description, DispositionId, IndexFather, ItemOrder, MilestoneFlowTypeId) 
VALUES 
(@id_plano_locator_cpf, '01','Iniciou o fluxo',@disposition_id_iniciou_o_fluxo,NULL,1,3),
(@id_plano_locator_cpf, '02','Último contato foi agendamento',@disposition_id_pergunta_se_e_pessoa,'01',1,3),
(@id_plano_locator_cpf, '03','Último contato foi para transferido para o receptivo',@disposition_id_pergunta_se_e_pessoa,'01',2,3),
(@id_plano_locator_cpf, '04','Último contato foi com terceiro e coletou telefone do titular',@disposition_id_pergunta_se_e_pessoa,'01',3,3),
(@id_plano_locator_cpf, '05','Contato com um CPC',@disposition_id_pergunta_se_e_pessoa,'01',4,3),
(@id_plano_locator_cpf, '06','Pergunta se é a pessoa - Primeiro contato',@disposition_id_pergunta_se_e_pessoa,'01',5,3),
(@id_plano_locator_cpf, '07','Pergunta se é a pessoa - Segundo contato',@disposition_id_pergunta_se_e_pessoa,'01',6,3),
(@id_plano_locator_cpf, '08','Pergunta se é a pessoa - Terceiro contato',@disposition_id_pergunta_se_e_pessoa,'01',7,3),
(@id_plano_locator_cpf, '09','Pergunta se é a pessoa - Quarto contato',@disposition_id_pergunta_se_e_pessoa,'01',8,3),
(@id_plano_locator_cpf, '10','Pergunta se é a pessoa - Quinto contato',@disposition_id_pergunta_se_e_pessoa,'01',9,3),
(@id_plano_locator_cpf, '11','Pergunta se é a pessoa - Mais que cinco contatos',@disposition_id_pergunta_se_e_pessoa,'01',10,3),
(@id_plano_locator_cpf, '12','Pergunta CPF_CNPJ',@disposition_id_pergunta_cpf_cnpj,'06',1,3),
(@id_plano_locator_cpf, '13','Não confirmou CPF_CNPJ',@disposition_id_nao_confirmou_cpf_cnpj,'12',1,3),
(@id_plano_locator_cpf, '14','Confirmou CPF_CNPJ e direcionou atendimento',@disposition_id_confirmou_cpf_cnpj,'12',2,3),
(@id_plano_locator_cpf, '15','Pergunta se é possivel localizar nesse telefone',@disposition_id_pergunta_se_pode_localizar,'06',2,3),
(@id_plano_locator_cpf, '16','Pergunta periodo ou horario',@disposition_id_pergunta_periodo,'15',1,3),
(@id_plano_locator_cpf, '17','Agenda período ou horário combinado',@disposition_id_agenda_periodo,'16',1,3),
(@id_plano_locator_cpf, '18','Não agendou período',@disposition_id_nao_agendou,'16',2,3),
(@id_plano_locator_cpf, '19','Pergunta número do telefone',@disposition_id_pergunta_numero_telefone,'15',2,3),
(@id_plano_locator_cpf, '20','Agenda ligação para o novo número de telefone',@disposition_id_agenda_licacao_numero_novo,'19',1,3),
(@id_plano_locator_cpf, '21','Não coleta telefone',@disposition_id_nao_coleta_telefone,'19',2,3),
(@id_plano_locator_cpf, '22','Cliente em atrito',@disposition_id_ciente_atrito,'06',3,3),
(@id_plano_locator_cpf, '23','Cliente recluso - preso',@disposition_id_cliente_recluso,'06',4,3),
(@id_plano_locator_cpf, '24','Falecido',@disposition_id_falecido,'06',5,3),
(@id_plano_locator_cpf, '25','Pergunta se conhece',@disposition_id_pergunta_se_conhece,'06',6,3),
(@id_plano_locator_cpf, '26','Desconhece o cliente - Engano',@disposition_id_desconhece_o_cliente,'25',1,3),
(@id_plano_locator_cpf, '27','Cliente enfermo - hospitalizado',@disposition_id_cliente_enfermo,'06',7,3),
(@id_plano_locator_cpf, '28','Correio de voz – Não está disponível – Grave sua mensagem',@disposition_id_correio_de_voz,'06',8,3),
(@id_plano_locator_cpf, '29','É uma pessoa próxima - deixou recado',@disposition_id_e_proximo_deixou_recado,'06',9,3)



