#!/bin/bash

usuarioArgumento=$1
# $USER obtem o usuario atual
usuarioAtual=$USER

# Se o usuário do argumento existe, será utilizado.
if id -u "$usuarioArgumento" > /dev/null 2>&1; then
        usuario=$usuarioArgumento
# Se o usuário do argumento não existir ou não for informado, será utilizado o usuário atual.
else
        usuario=$usuarioAtual
        
fi

# Variável para guardar a informação da data atual
hoje=$(date +"%Y%m%d")
# Variável para criar o nome do arquivo 
nomeArquivo=$hoje"_Processos_"$usuario".csv"
# Cabeçalho
cabecalho="Número total de processos ativos no sistema,Número de processos ativos do usuário,Quantidade total de threads dos processos do usuário,Processo mais antigo do usuário,Nome do usuário corrente,Quantidade de processos sendo executados, excluindo-se os do usuário corrente,Quantidade de processos sendo executados como root"
# Criando o arquivo com padrão de nome <AAAAMMDD>_Processos_<usuário>.csv
echo "$cabecalho">$nomeArquivo

# Sessão de teste
echo "usuario escolhido: $usuario"