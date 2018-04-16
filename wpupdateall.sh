#!/bin/bash
# INFO:  SCRIPT DE ATUALIZACAO DO CORE+PLUGINS DESATUALIZADOS DO WORDPRESS
# AUTOR: JOEL PINHEIRO
# EMAIL: JOEL@OPOVODIGITAL.COM
# LAST UPDATE 13/04/2018
# Update CORE+PLUGINS festivalvidaearte.com.br
plist=$(wp plugin list)
accuratelist=`cat /tmp/accuratelist.txt`

#LISTAGEM DE BLOGS/SITES GREMLINS

#Especial O POVO /home/devadm/public_html/esp/
#Festival Vida & Arte /home/devadm/public_html/fva/
#Casa Azul 2018 /home/devadm/public_html/casaazulwp/
#Anuario do Ceara /home/devadm/public_html/ce/
#Empregos e Carreiras 2018 /home/devadm/public_html/empregosecarreiras/

# LISTA DOS DIRETORIOS DAS INSTALACOES WORDPRESS, ADICIONADO MANUALMENTE PARA
# EVITAR ALGUM ERRO ESPECIFICO
cat '/tmp/gremlins.txt' | while read y
do
wp core update 

# CONSULTA A LISTA DE PLUGINS, VERIFICA QUAL PRECISA SER ATUALIZADO E ENVIA PARA O ARQUIVO PLUGINSLIST.TXT
echo "$plist" | grep "available" > /tmp/pluginslist.txt
# LE A LISTA APURADA DE PLUGINS
   cat /tmp/pluginslist.txt | cut -f 1 | grep -v name > /tmp/accuratelist.txt
# Inicia a atualizacao de todos os plugins listados anteriormente
	for i in $accuratelist; do wp plugin update $i; done
done



