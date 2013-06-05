#!/bin/bash

blastn -query ../data/rrna/stool/${1}.fsa -db ../data/rrna/stool/${2}.fsa -evalue 1e-10 -outfmt '10 ' -max_target_seqs 1 \
  > result_${1}_${2}.log

# get all seqs that had 100 pct matches
cat result_${1}_${2}.log \
  | grep '100.00' \
  | cut -d, -f1 \
  | sort | uniq \
  > perfect_matches.log

cat result_${1}_${2}.log \
  | sort | uniq -c \
  | cut -d' ' -f5 \
  | sort | uniq -c \
  | grep '1 ' \
  > uniform_matches.log

