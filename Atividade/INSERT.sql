Use SIGAA;

Insert into Disciplinas VALUES(1 , 2, 'Matematica');
Insert into Disciplinas VALUES(2 , 2, 'MatematicaII');
INSERT INTO Pre_Requisitos VALUES(2, 1);

INSERT INTO Cursos VALUES (1, 120, 'Matematica Computacional', NULL);
INSERT INTO Cursos VALUES (3, 120, 'Portugues', NULL);

INSERT INTO Professores(COD_CURSO, COD_PROF, NOM_PROF) VALUES(1, 1, 'JEAN');
INSERT INTO Professores(COD_CURSO, COD_PROF, NOM_PROF) VALUES(1, 2, 'JOAO');
INSERT INTO Professores(COD_CURSO, COD_PROF, NOM_PROF) VALUES(3, 4, 'Pedro');

UPDATE Cursos SET COD_COORD = 1 WHERE COD_CURSO = 2;

UPDATE Cursos SET COD_COORD = 4 WHERE COD_CURSO = 1; -- Tem Que Gerar um Erro

INSERT INTO Alunos(MAT_ALU, NOM_ALU, COD_CURSO, DAT_NASC, MGP, TOT_CRED )
    VALUES (1234, 'Henrique', 1, '12-02-2003', 0, 0)
INSERT INTO Alunos(MAT_ALU, NOM_ALU, COD_CURSO, DAT_NASC, MGP, TOT_CRED )
    VALUES (1235, 'PAULO', 1, '12-02-2002', 0, 0)


INSERT Curriculos VALUES(1,1, 1)
INSERT Curriculos VALUES(1,2, 1)

INSERT Historicos_Escolares(ANO       
, SEMESTRE
, COD_DISC
, MAT_ALU 
, MEDIA   
, FALTAS  
, SITUACAO) VALUES (
    2019, 1, 1, 1234, 5.0, 12, 'AP'
);

INSERT Historicos_Escolares(ANO       
, SEMESTRE
, COD_DISC
, MAT_ALU 
, MEDIA   
, FALTAS  
, SITUACAO) VALUES (
    2019, 1, 1, 1235, 6.0, 22, 'RP'
);


INSERT INTO Turmas(ANO
, SEMESTRE

, COD_DISC
, TURMA   
, TOT_VAGAS
, VAG_OCUP
, COD_PROF) VALUES(2019, 1, 1, 'MA1', 20, 10, 1)

INSERT INTO Turmas(ANO
, SEMESTRE
, COD_DISC
, TURMA   
, TOT_VAGAS
, VAG_OCUP
, COD_PROF) VALUES(2019, 1, 1, 'MA2', 20, 10, 1)


INSERT INTO Tumas_Matriculadas(ANO 
, SEMESTRE
, COD_DISC
, TURMA
, MAT_ALU) VALUES(2019, 1, 1, 'MA1', 1234)

INSERT INTO Tumas_Matriculadas(ANO 
, SEMESTRE
, COD_DISC
, TURMA
, MAT_ALU) VALUES(2019, 1, 2, 'MA2', 1234)


SELECT * FROM Disciplinas
SELECT * FROM Pre_Requisitos
SELECT * FROM Cursos
SELECT * FROM Professores
SELECT * FROM Alunos
SELECT * FROM Curriculos
SELECT * FROM Historicos_Escolares
SELECT * FROM Turmas
SELECT * FROM Tumas_Matriculadas

USE Curso;