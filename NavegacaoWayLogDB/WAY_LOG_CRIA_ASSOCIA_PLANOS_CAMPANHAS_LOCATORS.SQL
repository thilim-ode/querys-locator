USE Waylogdb

DECLARE @id_plano_locator int;
DECLARE @id_campanha_locator int
DECLARE @id_plano_locator_cpf int;
DECLARE @id_campanha_locator_cpf int;

SELECT @id_plano_locator = MAX(IdNavigationDetail) + 1 from NavigationDetail
SELECT @id_plano_locator_cpf = @id_plano_locator + 1

SELECT @id_campanha_locator_cpf = MIN(CampaignId) from sysconfiguration..campaign where Description like 'Locator%CPF%';
SELECT @id_campanha_locator = MIN(CampaignId) from sysconfiguration..campaign where Description like 'Locator%Padrao' or
Description like 'Locator%Template'

INSERT INTO CampaignNavigationPlan(Campaignid ,IdNavigationDetail)
VALUES 
(@id_campanha_locator, @id_plano_locator),
(@id_campanha_locator_cpf, @id_plano_locator_cpf)