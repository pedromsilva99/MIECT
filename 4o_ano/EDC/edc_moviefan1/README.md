# edc_moviefan1

Projeto desenvolvido com [Pedro Gonçalves](https://github.com/PedroG-8) e [Rui Oliveira](https://github.com/ruimigueloliveira) para a unidade curricular Engenharia de Dados e Conhecimento do 1º semestre do 4º ano do curso Mestrado Integrado em Engenharia de Computadores e Telemática.
Neste projeto, pretende-se desenvolver uma aplicação web que apresente os filmes presentes na base de dados (ficheiro xml -> "./app/data/streamData.xml"). É possível adicionar, classificar e remover filmes da base de dados. As queries à base de dados são efetuadas através da BaseX. 
Procede-se também à verificação do estado do ficheiro xml e à transformação de dados. Existe ainda uma página que utiliza a tecnologia RSS para apresentar as mais recentes notícias de filmes.

Abrir BaseX e criar nova base de dados com o nome "streamData" com o ficheiro 'app/data/streamData.xml'
Instalar todos os packages da pasta 'app/queries/'
Abrir a pasta 'basex/bin' e correr o ficheiro 'basexserver'
Instalar o package requests e restantes que não estejam já instalados através do PyCharm
Correr o projeto através do PyCharm
Conectar-se no browser através do endereço 'http://127.0.0.1:8000/'
