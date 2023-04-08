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




# sessao de teste
echo "usuario escolhido: $usuario"