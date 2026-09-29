USE SysConfiguration

DECLARE @id_plano_locator int;
DECLARE @id_campanha_locator int
DECLARE @id_plano_locator_cpf int;
DECLARE @id_campanha_locator_cpf int;

SELECT @id_plano_locator = MAX(IdNavigationPlan)  + 1 from navigationplan
SELECT @id_plano_locator_cpf = @id_plano_locator + 1

SELECT @id_campanha_locator_cpf = MIN(CampaignId) from campaign where Description like 'Locator%CPF%';
SELECT @id_campanha_locator = MIN(CampaignId) from campaign where Description like 'Locator%Padrao' or
Description like 'Locator%Template'


-- Cria plano de navegação 
INSERT INTO NavigationPlan (IdNavigationPLan, name, lastupdateUserId, LastUpdate, IsActive, InsertDate)
VALUES 
(@id_plano_locator, '[ ADA ] Locator', 1, getdate(), 1, getdate() ),
(@id_plano_locator_cpf, '[ ADA ] Locator (com CPF)', 1, getdate(), 1, getdate() )

-- Associa campanha com o plano de navegação
INSERT INTO NavigationPlanCampaign(Campaignid ,IdNavigationPlan)
VALUES 
(@id_campanha_locator, @id_plano_locator),
(@id_campanha_locator_cpf, @id_plano_locator_cpf)