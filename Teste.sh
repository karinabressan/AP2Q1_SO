#!/bin/bash

usuario=$USER

# Variável para guardar a informação da data atual
hoje=$(date +"%Y%m%d")
# Variável para criar o nome do arquivo 
nomeArquivo=$hoje"_Processos_"$usuario".csv"

# Cabeçalho
cabecalho="Número total de processos ativos no sistema,Número de processos ativos do usuário,Quantidade total de threads dos processos do usuário,Processo mais antigo do usuário,Nome do usuário corrente,Quantidade de processos sendo executados, excluindo-se os do usuário corrente,Quantidade de processos sendo executados como root"
# Criando o arquivo com padrão de nome <AAAAMMDD>_Processos_<usuário>.csv
echo "$cabecalho">$nomeArquivo

# sessao de teste  

echo "$hoje"
echo "$nomeArquivo"