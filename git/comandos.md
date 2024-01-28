>> git init . 
Inicia o git para fazer o versionamento do repositório

>> git status
Mostra o estado do arquivo ou da pasta que está dentro do repositório, existem 3 estados:
- Modificado: Arquivos modificados, adicionados ou removidos são marcados como modificados   
- Preparado: O arquivo fica na "Stagin Area" preparado para ser comitado
- Consolidado: As modificações são salvas no repositório onde as modificações são armazenadas
Essas 3 etapas acontecem na ordem que estão e não podem ser puladas

>> git add nome_do_arquivo ou * 
Serve para adi cionar os arquivos que estão na etapa 'modificado' para a etapa 'preparado'
Isso é util pois nem sempre que você modificar um arquivo você pretenderá salvá-lo

>> git commit -m "escreva uma mensagem"
Serve para salvar as alterações feitas em todos os arquivos, o '-m' é para poder adicionar 
uma mensagem ao commit

>> git log
Serve para veficar as alterações feitas e os metadados da alteração 

>> git log nome_do_arquivo
Esse comando serve para procurar todos os commit's que envol o arquivo especificado

>> git diff

>> git 