#!/bin/bash

# Aluna: Karina Bressan Felicetti

usuarioArgumento=$1
# $USER obtém o usuario atual
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
# Variável para criar o nome do arquivo com padrão de nome <AAAAMMDD>_Processos_<usuário>.csv
nomeArquivo=$hoje"_Processos_"$usuario".csv"
# Cabeçalho
cabecalho="Número total de processos ativos no sistema,Número de processos ativos do usuário,Quantidade total de threads dos processos do usuário,Processo mais antigo do usuário,Nome do usuário corrente,Quantidade de processos sendo executados, excluindo-se os do usuário corrente,Quantidade de processos sendo executados como root"

# Declaração das variáveis dos itens
# a) Número total de processos ativos no sistema
processosAtivoSis=$(ps ax | wc -l)
# b) Número de processos ativos do usuário.
processosAtivosUser=$(ps -f -u $usuario | wc -l)
# c) Quantidade total de threads dos processos do usuário.
qtdThreadUser=$(ps -Lf -u $usuario | wc -l)
# d) Processo mais antigo do usuário.
procMaisAntigo=$(ps aux --sort=start_time | awk 'NR==2{print $2}')
# e) Nome do usuário corrente.
nomeUserCorrente=$usuario
# f) Quantidade de processos sendo executados, excluindo-se os do usuário corrente.
procExecutados=$((processosAtivoSis-processosAtivosUser))
# g) Quantidade de processos sendo executados como root.
procRoot=$(ps -f -u root | wc -l)
procExecutadosRoot=$((processosAtivoSis-procRoot))

# Criando o arquivo .csv com as respectivas variáveis de cada item
informacoes=$processosAtivoSis","$processosAtivosUser","$qtdThreadUser","$procMaisAntigo","$nomeUserCorrente","$procExecutados","$procExecutadosRoot

# Se o arquivo para o usuário e data já existe...
if test -e $nomeArquivo; then
# ...adiciona nova linha
    echo $informacoes >> $nomeArquivo
# Se o arquivo não existe, será criado com as informações da primeira execução:    
else
    # Criando o arquivo 
    echo "$cabecalho">$nomeArquivo
    echo $informacoes >> $nomeArquivo
fi

# Sessão de teste
echo "usuario escolhido: $usuario"