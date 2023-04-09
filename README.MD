Avaliação individual ou em dupla. Fazer upload do .sh e do CSV da execução no seu computador. O script deve funcionar em uma instalação padrão do GNU/Linux Ubuntu 20.04.3 LTS desktop, não apenas no seu computador.  O shell script deve ser em bash.

Informar o(s) nome(s) como comentário dentro do shell script, arquivos sem esses nomes serão desconsiderados.

Não fazer plágio. Plágio = nota zero na AP inteira (não apenas nessa questão).

IMPORTANTE: como essa questão tem prazo de cinco dias  não haverá segunda chamada.

1. Elabore um programa em shell script (<primeironome1>_<primeironome2>_ProcessosSistema.sh) para coletar e armazenar informações do SO. Considerações:

i) Pode ser passado como argumento o nome de usuário (<usuario>), nesse caso as informações devem ser apenas deste usuário mais as informações dos processos do sistema. Caso não haja argumento, deve ser usado como base o usuário corrente, além das informações dos processos do sistema.

ii) As informações coletadas devem ser armazenadas em um arquivo no formato ASCII (vulgo txt) com o seguinte nome: <AAAAMMDD>_Processos_<usuário>.csv . As seguintes informações (nesta sequência) devem ser gravadas separada por vírgula em cada linha:

a) Número total de processos ativos no sistema.

b) Número de processos ativos do usuário.

c) Quantidade total de threads dos processos do usuário.

d) Processo mais antigo do usuário.

e) Nome do usuário corrente.

f) Quantidade de processos sendo executados, excluindo-se os do usuário corrente.

g) Quantidade de processos sendo executados como root.

Obs.:
(1) Fazer consistência do nome do usuário, quando passado como parâmetro.

(2) Caso o programa seja executado no mesmo dia mais de uma vez no mesmo diretório, então não deve ser criado um arquivo novo e sim adicionada uma nova linha com as informações a cada nova execução.

(3) Incluir no topo uma linha de cabeçalho com as informações quando o arquivo for criado.


Submeter .sh e uma saída com .csv da execução do shell script.

Atividade em dupla, submeter apenas uma pessoa. Colocar os nomes  completos como comentário no shell script.

Atenção códigos copiados ou com alto grau de similaridade com outros trabalhos submetidos serão considerados plágio e receberão nota Zero em toda AP2.



------

## Instrucoes para execução ##

Para executar o programa, no terminal digite: `sh Karina_ProcessosSistema.sh` e o resultado sera exibido no terminal.


Tarefas:
[x] - Instalar WSL
[x] - Instalar Ubuntu no wsl
[x] - Configurar chave ssh do git no wsl
[x] - Criar repositorio no github para o trabalho
[x] - Fazer clone do repositorio
[x] - Configurar o vscode para o wsl
[x] - Criar um SH com o nome Karina_ProcessosSistema.sh
[x] - Receber como argumento o nome do usuário.
[x] - Verificar se o usuario recebido como argumento existe
[x] - Obter o usuario corrente.
[x] - Utilizar o usuario corrente caso não seja informado um usuario por argumento ou o usuario do argumento nao existir
[x] - Criar arquivo
[x] - Criar arquivo com padrão de nome <AAAAMMDD>_Processos_<usuário>.csv
[x] - Ao criar o arquivo, escrever o cabeçalho de acordo com a obs 3
[x] - Verificar se um arquivo com um determinado nome ja existe
[x] - Caso o arquivo exista, escrever no final adicionando uma linha
[x] - Escrever no arquivo com o formato do item II.
[x] - Obter numero total de processos ativos no sistema
[x] - Obter Numero de processos ativos do usuario
[ ] - Obter quantidade total de threads dos processos do usuario (cada processo tem threads, somar todas)
[x] - Obter processo mais antigo do usuário
[x] - Obter quantidade de processos sendo executados, excluindo-se os do usuário corrente.
[x] - Obter quantidade de processos sendo executados como root
[x] - Refatorar a escrita no arquivo para utilizar as informacoes reais.