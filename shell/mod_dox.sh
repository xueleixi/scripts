#!bin/bash

workdir=/Users/xueleixi/Desktop/word-html/word_tpls/nfy/
tpls=(1_bj 1_rcx 1_sh 1_tx 2_bj 2_rcx 2_sh 2_tx)

for tpl in ${tpls[@]}
do
  dir=$workdir$tpl
  cd $dir
  zip -r $tpl.docx * -x *.docx
  mv $tpl.docx ../../
done
