-- select * from SysConfiguration..Media -- verifica as midias que estão na plataforma // MediaCustomer é pra ver as orgs que o audio esta // depois que fazer os insert verificar o mediaID deles
-- select * from SysConfiguration..Customer where Activated = 1 -- pra ver a organização dos audios
 
-- insert into SysConfiguration..Media
-- values(1, 1, getdate(), 'MSGEXCECAO_04', '', 'MSGEXCECAO_04.wav') -- vai inserir a informação dos audios, um por vez tem que fazer o insert
 
-- insert into SysConfiguration..MediaCustomer
-- values(34, 19) -- (mediaID, IDorganização)
 
-- --depois disso ir no ECS1 abrir uma pasta e colocar isso \\OLOSGNPMIAECS21\
 
-- --ir na pasta de prompt depois ir na pasta da organização (procurar pelo ID dela)
 
-- --e jogar os audios nas pastas "inbound" e "Receptivo"