#!/bin/bash


#resultado=$((5 * 5))
#echo $resultado
#exit


usuario=$USER

# Variável para guardar a informação da data atual
hoje=$(date +"%Y%m%d")
# Variável para criar o nome do arquivo 
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
# d) Processo mais antigo do usuário (PID do processo mais antigo).
procMaisAntigo=$(ps aux --sort=start_time | awk 'NR==2{print $2}')
# e) Nome do usuário corrente.
nomeUserCorrente=$usuario
# f) Quantidade de processos sendo executados, excluindo-se os do usuário corrente.
procExecutados=$((processosAtivoSis-processosAtivosUser))
# g) Quantidade de processos sendo executados como root.
procRoot=$(ps -f -u root | wc -l)
procExecutadosRoot=$((processosAtivoSis-procRoot))

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

echo "numero processos usuario= $processosAtivosUser"
echo "numero processos sistema= $processosAtivoSis "
echo "root processes $procRoot"
echo "numero threads do usuario= $qtdThreadUser"
echo "PID processo mais antigo= $procMaisAntigo"
echo "processos menos os do usuario corrente= $procExecutados"
echo "processos menos os do usuario root= $procExecutadosRoot"