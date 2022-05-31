#!/bin/bash

###
### USO: execute o arquivo apontando o /etc/passwd como primeiro parametro
###
awk '/sre_/{print}' $1