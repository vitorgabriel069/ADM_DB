--
-- author: Vitor Gabriel Silva Nascimento
-- vitor.nascimento99@academico.ifs.edu.br - 2019
-- 
CREATE TRIGGER tg_regra19
ON [dbo].[turma_matriculada]
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE 
	 @cod_disc	int
	,@cod_curso	tinyint
	,@mat_alu	int

	--Pega cod_disc e mat_alu que estão sendo inseridos
	SELECT @cod_disc = cod_disc, @mat_alu = mat_alu  FROM inserted
	
	--Pega cod_curso do aluno que está realizando a matrícula
	SELECT @cod_curso = cod_curso FROM aluno
	WHERE mat_alu = @mat_alu
	
	IF(
		--Testando se o cod_disc que está sendo inserido faz parte de um curriculo
			(SELECT count(*) FROM curriculo 
			WHERE cod_curso = @cod_curso AND cod_disc = @cod_disc) = 0
	  )
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR('A DISCIPLINA NÃO PERTENCE AO CURRÍCULO DO ALUNO!', 11, 1)
	END
END
