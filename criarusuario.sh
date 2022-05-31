#!/bin/bash

LOG=criar_usuario.log
DATE=`date "+%d/%m/%Y - %H:%M:%S"` 
ARQUIVO=/tmp/suporte/novousuarios
NUM_USERS=$(awk -F'[: \t]+' '{print NF}' $ARQUIVO)
OS=$(grep "ubuntu" /etc/os-release)
PREFIX="sre_"
i=1
echo "$DATE [INFO] CRIANDO USUARIOS" >> $LOG && \
while [ $i -le $NUM_USERS ]
do
  USER=$(cut -d':' -f $i $ARQUIVO)
  useradd $PREFIX$USER &>> $LOG
  $OS
  STATUS=$(echo $?)
  if [[ "$STATUS" -eq 0 ]]; then
    #sistemas debian/ubuntu
  	usermod -aG sudo $PREFIXUSER &>> $LOG
  else
    #sistemas redhat/suse
	usermod -aG wheel $PREFIXUSER &>> $LOG
  fi
  i=$((i+1))
done