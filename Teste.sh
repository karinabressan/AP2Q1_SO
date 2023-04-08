#!/bin/bash

usuario=$USER

# Variável para guardar a informação da data atual
hoje=$(date +"%Y%m%d")
# Variável para criar o nome do arquivo 
nomeArquivo=$hoje"_Processos_"$usuario".csv"
# Cabeçalho
cabecalho="Número total de processos ativos no sistema,Número de processos ativos do usuário,Quantidade total de threads dos processos do usuário,Processo mais antigo do usuário,Nome do usuário corrente,Quantidade de processos sendo executados, excluindo-se os do usuário corrente,Quantidade de processos sendo executados como root"

# Declaração das variáveis dos itens
# a) Número total de processos ativos no sistema
processosAtivoSis=1
# b) Número de processos ativos do usuário.
processosAtivosUser=2
# c) Quantidade total de threads dos processos do usuário.
qtdThreadUser=3
# d) Processo mais antigo do usuário.
procMaisAntigo=4
# e) Nome do usuário corrente.
nomeUserCorrente=$usuario
# f) Quantidade de processos sendo executados, excluindo-se os do usuário corrente.
procExecutados=6
# g) Quantidade de processos sendo executados como root.
procExecutadosRoot=7

informacoes=$processosAtivoSis","$processosAtivosUser","$qtdThreadUser","$procMaisAntigo","$nomeUserCorrente","$procExecutados","$procExecutadosRoot

# Se o arquivo existe...
if test -e $nomeArquivo; then
# ...adiciona nova linha
    echo $informacoes >> $nomeArquivo
else
    # Criando o arquivo com padrão de nome <AAAAMMDD>_Processos_<usuário>.csv
    echo "$cabecalho">$nomeArquivo
    echo $informacoes >> $nomeArquivo
fi

# sessao de teste  

echo "nome usuario= $nomeUserCorrente"
