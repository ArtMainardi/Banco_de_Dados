# =========== Data Query Language ===========
# -----------> Básicas
# 1. Liste todos os alunos cadastrados.
SELECT * FROM Alunos;
# 2. Liste apenas os nomes dos alunos.
SELECT nome FROM Alunos;
# 3. Exiba todos os cursos cadastrados.
SELECT * FROM Cursos;
# 4. Mostre os alunos que moram em São Paulo.
SELECT * FROM Alunos 
WHERE cidade = 'São Paulo';
# 5. Liste os alunos com idade maior que 20 anos.
SELECT * FROM Alunos 
WHERE idade > 20;
# 6. Exiba os cursos com carga horária maior que 50 horas.
SELECT * FROM Cursos
WHERE carga_horaria > 50;
# 7. Mostre os alunos com idade entre 18 e 22 anos.
SELECT * FROM Alunos 
WHERE idade BETWEEN 18 and 22;
# 8. Liste os alunos da cidade de Curitiba.
SELECT * FROM Alunos 
WHERE cidade = 'Curitiba';
# 9. Exiba os alunos cuja idade seja menor que 21 anos.
SELECT * FROM Alunos 
WHERE idade < 21;
# 10. Liste todas as matrículas cadastradas.
SELECT * FROM Matriculas;



# -----------> Intermediárias
# 1. Mostre os alunos que possuem nota maior que 8.
SELECT A.*, M.nota FROM Alunos A
JOIN Matriculas M
ON A.id_aluno = M.id_aluno
WHERE M.nota > 8;
# 2. Liste os alunos que tiveram mais de 5 faltas.
SELECT A.*, M.faltas FROM Alunos A
JOIN Matriculas M
ON A.id_aluno = M.id_aluno
WHERE M.faltas > 5;
# 3. Exiba os cursos com carga horária igual a 80 horas.
SELECT * FROM Cursos
WHERE carga_horaria = 80;
# 4. Mostre os alunos que NÃO moram em São Paulo.
SELECT * FROM Alunos 
WHERE NOT cidade = 'São Paulo';
# 5. Liste os alunos cujo nome começa com a letra “A”.
SELECT * FROM Alunos 
WHERE nome LIKE 'A%';
# 6. Exiba os alunos cujo nome termina com a letra “a”.
SELECT * FROM Alunos 
WHERE nome LIKE '%a';
# 7. Liste os cursos cujo nome contenha a palavra “Dados”.
SELECT * FROM Cursos 
WHERE nome_curso LIKE '%Dados%';
# 8. Mostre as matrículas com nota entre 7 e 9.
SELECT * FROM Matriculas
WHERE nota BETWEEN 7 and 9;
# 9. Liste os alunos que possuem exatamente 20 anos.
SELECT * FROM Alunos 
WHERE idade = 20;
# 10. Exiba os cursos com carga horária menor ou igual a 60 horas.
SELECT * FROM Cursos
WHERE carga_horaria <= 60;



# -----------> Questões com GROUP BY
# 1. Mostre quantos alunos existem em cada cidade.
SELECT A.cidade, COUNT(*) as 'Quantidade de Alunos' FROM Alunos A
GROUP BY A.cidade;
# 2. Exiba a média de idade dos alunos agrupada por cidade.
SELECT A.cidade, AVG(A.idade) as 'Média de Idade' FROM Alunos A
GROUP BY A.cidade;
# 3. Mostre a quantidade de matrículas por curso.
SELECT C.nome_curso, COUNT(M.id_curso) as 'Quantidade de Matrículas' FROM Cursos C
JOIN Matriculas M
ON C.id_curso = M.id_curso
GROUP BY C.nome_curso;
# 4. Exiba a média das notas por curso.
SELECT C.nome_curso, AVG(M.nota) as 'Média das Notas' FROM Cursos C
JOIN Matriculas M
ON C.id_curso = M.id_curso
GROUP BY C.nome_curso;
# 5. Mostre o total de faltas agrupado por curso.
SELECT C.nome_curso, SUM(M.faltas) as 'Quantidade de Faltas' FROM Cursos C
JOIN Matriculas M
ON C.id_curso = M.id_curso
GROUP BY C.nome_curso;
# 6. Liste a maior nota obtida em cada curso.
SELECT C.nome_curso, MAX(M.nota) as 'Maior Nota' FROM Cursos C
JOIN Matriculas M
ON C.id_curso = M.id_curso
GROUP BY C.nome_curso;
# 7. Exiba a menor nota registrada em cada curso.
SELECT C.nome_curso, MIN(M.nota) as 'Maior Nota' FROM Cursos C
JOIN Matriculas M
ON C.id_curso = M.id_curso
GROUP BY C.nome_curso;
# 8. Mostre a soma total das faltas agrupadas por aluno.
SELECT A.nome, SUM(M.faltas) as 'Quantidade de Faltas' FROM Alunos A
JOIN Matriculas M
ON A.id_aluno = M.id_aluno
GROUP BY A.nome;
# 9. Exiba a média de notas agrupada por aluno.
SELECT A.nome, AVG(M.nota) as 'Média de Notas' FROM Alunos A
JOIN Matriculas M
ON A.id_aluno = M.id_aluno
GROUP BY A.nome;
# 10. Mostre quantos alunos existem em cada faixa etária.
SELECT A.idade, COUNT(A.id_aluno) as 'Quantidade de Alunos' FROM Alunos A
GROUP BY A.idade;



# -----------> Questões Avançadas — HAVING e ORDER BY
# 1. Liste as cidades que possuem mais de 2 alunos.
SELECT A.cidade, COUNT(*) as 'Quantidade de Alunos' FROM Alunos A
GROUP BY A.cidade
HAVING COUNT(*) > 2;
# 2. Exiba os cursos cuja média de notas seja maior que 8.
SELECT C.nome_curso as 'Nome do Curso', AVG(M.nota) as 'Média de Notas' FROM Cursos C
JOIN Matriculas M
ON C.id_curso = M.id_curso
GROUP BY C.nome_curso
HAVING AVG(M.nota) > 8;
# 3. Mostre os cursos que possuem mais de 2 matrículas.
SELECT C.nome_curso as 'Nome do Curso', COUNT(M.id_matricula) as 'Quantidade de Matrículas' FROM Cursos C
JOIN Matriculas M
ON C.id_curso = M.id_curso
GROUP BY C.nome_curso
HAVING COUNT(M.id_matricula) > 2;
# 4. Liste os alunos cuja soma de faltas seja maior que 5.
SELECT A.nome as 'Nome do Aluno', SUM(M.faltas) as 'Quantidade de Faltas' FROM Alunos A
JOIN Matriculas M
ON A.id_aluno = M.id_aluno
GROUP BY A.nome
HAVING SUM(M.faltas) > 5;
# 5. Exiba os cursos cuja menor nota seja maior que 6.
SELECT C.nome_curso as 'Nome do Curso', MIN(M.nota) as 'Menor Nota' FROM Cursos C
JOIN Matriculas M
ON C.id_curso = M.id_curso
GROUP BY C.nome_curso
HAVING MIN(M.nota) > 6;
# 6. Mostre os cursos ordenados pela carga horária em ordem decrescente.
SELECT * FROM Cursos C
ORDER BY C.carga_horaria DESC;
# 7. Liste os alunos ordenados por idade do maior para o menor.
SELECT * FROM Alunos A
ORDER BY A.idade DESC;
# 8. Exiba a média de notas por curso ordenada da maior para a menor.
SELECT C.nome_curso as 'Nome do Curso', AVG(M.nota) as 'Média das Notas' FROM Cursos C
JOIN Matriculas M
ON C.id_curso = M.id_curso
GROUP BY C.nome_curso
ORDER BY AVG(M.nota) DESC;
# 9. Mostre as cidades ordenadas pela quantidade de alunos.
SELECT A.cidade, COUNT(*) as 'Quantidade de Alunos' FROM Alunos A
GROUP BY A.cidade
ORDER BY COUNT(*) DESC;
# 10. Liste os alunos com média de notas maior que 7 ordenados pela média decrescente.
SELECT A.nome, AVG(M.nota) as 'Média de Notas' FROM Alunos A
JOIN Matriculas M
ON A.id_aluno = M.id_aluno
GROUP BY A.nome
HAVING AVG(M.nota) > 7
ORDER BY AVG(M.nota) DESC;
