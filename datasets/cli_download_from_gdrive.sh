#!/bin/bash
# To use this script download it to your working directory, and execute it with the command
# bash cli_download_from_gdrive.sh 
# 
# By default, it will download the file SHO_10e.h5 
# Note that the file is large (~100 GB), so if you are on a slow connection this will take a long time 

#   filename filename
# SHO_10e.h5 198gqXAZc-1PFfNqhOKBsVbiO5p2TtMdu
#  SHO_3e.h5 1lxCr-zU18NWJb-lJvTehwS9n2yOZT3Nc
#  SHO_2e.h5 1IgKJhPqQk2CvXA-pOGk2zdit1BxZkBsH
#  SHO_1e.h5 1FRnEhxjnKo4jnhRpYfBgUBlHTCjqet2X

# RND_10e.h5 1Ij3k_rPrJqIDNaG1_QATvp7a6aqy-tzy
#  RND_3e.h5 1nokZMZWyOt58_PjNrNNLeNF3TkJC9tto
#  RND_2e.h5 1va3B0pJURNNcoBCZ7T0Uyx_sKs7tuWuf
#  RND_1e.h5 1bMZVsK3C62_1lyUrA40Zq1TBNJ6ahPAw

# This script is adapted from here:
#  https://www.matthuisman.nz/2019/01/download-google-drive-files-wget-curl.html 

export filename=SHO_10e.h5
export fileid=198gqXAZc-1PFfNqhOKBsVbiO5p2TtMdu

## WGET ##
wget --save-cookies cookies.txt 'https://docs.google.com/uc?export=download&id='$fileid -O- \
     | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' > confirm.txt

wget --load-cookies cookies.txt -O $filename \
     'https://docs.google.com/uc?export=download&id='$fileid'&confirm='$(<confirm.txt)

rm -f confirm.txt cookies.txt
