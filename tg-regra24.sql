--
-- author: Vitor Gabriel Silva Nascimento
-- vitor.nascimento99@academico.ifs.edu.br - 2019
--
CREATE TRIGGER tg_regra24
ON [dbo].[turma_matriculada]
FOR INSERT
AS
BEGIN
	DECLARE 
	 @v_nota1		NUMERIC(3, 1)
	,@v_nota2		NUMERIC(3, 1)
	,@v_nota3		NUMERIC(3, 1)
	,@v_nota4		NUMERIC(3, 1)
	,@cont			INT
	,@v_ano			SMALLINT
	,@v_semestre	TINYINT
	,@v_cod_disc	INT
	,@v_mat_aluno	INT
	,@v_turma		CHAR(3)
	SET @cont = 0
	SELECT @v_nota4 = nota_4, @v_ano = ano, @v_semestre = semestre, @v_cod_disc = cod_disc, @v_mat_aluno = mat_alu, @v_turma = turma FROM INSERTED

	SELECT @v_nota1 = nota_1, @v_nota2 = nota_2, @v_nota3 = nota_3, @v_nota4 = nota_4 FROM turma_matriculada 
	WHERE ano = @v_ano AND semestre = @v_semestre AND mat_alu = @v_mat_aluno AND cod_disc = @v_cod_disc
	
	IF (@v_nota1 < 0 OR @v_nota2 < 0 OR @v_nota3 < 0 OR @v_nota4 < 0)
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR('Não é possível inserir uma nota menor que 0', 11, 1)
	END
	
	IF (@v_nota4 >= 0)
	BEGIN
		IF ( ISNULL(@v_nota1, -1) = -1 )
			SET @cont += 1
		IF ( ISNULL(@v_nota2, -1) = -1 )
			SET @cont += 1
		IF ( ISNULL(@v_nota3, -1) = -1 )
			SET @cont += 1
		IF ( @cont = 0 )
		BEGIN
			ROLLBACK TRANSACTION
			RAISERROR('A quarta nota só pode ser preenchida se uma das anteriores estiver nula', 11, 1)
		END
		IF ( @cont > 1 )
		BEGIN
			ROLLBACK TRANSACTION
			RAISERROR('A quarta nota só pode ser preenchida se apenas uma das anteriores estiver nula', 11, 1)
		END
	END
END
