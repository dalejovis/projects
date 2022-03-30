#!/bin/bash

todos_diretorios=("dir1" "dir2")

todos_arquivos_zst=("bar/foo1.tar.zst" "bar/foo2.tar.zst")

todos_arquivos_zip=("bar/foo1.zip" "bar/foo2.zip")

caminho_base=nome-do-bucket-s3

destino=/destino/dentro/do/node

testador(){

    if [ -d $destino ]; then
        cd $destino
        echo
        echo "Removendo os diretórios e arquivos atuais:"
        echo "..."
        echo
        rm -rf *
    else
        echo
        echo "Destino inexistente!"
        echo
        echo "O diretório ${destino} não existe!"
        echo
        exit 1
    fi 
}

sincronizador-diretorios(){
    
    for caminho in ${todos_diretorios[@]}; do
        dir=$(basename -s .tar.zst ${caminho}) #retira o basename do diretório
        mkdir -p $dir 
        aws s3 sync s3://$caminho_base/$caminho $destino/$dir --delete #sync do conteúdo do destino com o conteúdo do bucket
    done
}

copiador-arquivos-zst(){
    
    for caminho in ${todos_arquivos_zst[@]}; do
        dir=$(dirname ${caminho}) #retira o nome do diretório "bar"
        mkdir -p $dir
        aws s3 cp s3://$caminho_base/$caminho $destino/$dir #copia o conteúdo do bucket para o destino
    done
}   

copiador-arquivos-zip(){
    
    for caminho in ${todos_arquivos_zip[@]}; do
        dir=$(dirname ${caminho})
        mkdir -p $dir
        aws s3 cp s3://$caminho_base/$caminho $destino/$dir 
    done
}

descompactador-zst(){

    for raiz in $(find . -name "*.zst" -type f); do #faz uma varredura em todos os arquivos com final ".zst"
        cd $(dirname $raiz) #entra no diretório onde está a "raiz"
        nome=$(basename -s .tar.zst $raiz) #retira o basename da "raiz" sem a extensão ".tar.zst"
        mkdir $nome
        nome2=$(basename $raiz) #retira o basename de "raiz"
        mv $nome2 $nome/ #move o arquivo para o diretório criado com mesmo nome, porém sem a extensão
        cd $nome
        tar -I zstd -xf $nome2 #decompacta o arquivo
        rm $nome2 #remove o artefato compactado
        cd $destino   
    done
}

descompactador-zip(){

    for raiz in $(find . -name "*.zip" -type f); do
        cd $(dirname $raiz)
        nome=$(basename -s .zip $raiz)
        mkdir $nome
        nome2=$(basename $raiz)
        mv $nome2 $nome/
        cd $nome
        unzip $nome2  
        rm $nome2
        cd $destino   
    done
}

echo "Testando existência do destino especificado:"
echo "..."
echo

testador

echo "Iniciando sincronização:"
echo "..."
echo

sincronizador-diretorios

copiador-arquivos-zst

copiador-arquivos-zip

echo
echo "Iniciando a descompactação:"
echo "..."
echo

descompactador-zst

descompactador-zip