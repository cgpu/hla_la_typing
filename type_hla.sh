#!/bin/bash

#Input parameters
nr_threads=$1
cram_file_name=$2
ref_fasta_file_name=$3
graph_dir=$4
sample_id=`basename $cram_file_name | cut -f1 -d"."` 

#Output parameters
best_out_file_name=${sample_id}_output_G.txt
all_out_file_name=${sample_id}_output.txt

#Link graph files
target_dir=/usr/local/bin/HLA-LA/graphs/
ln -s $graph_dir $target_dir

#Type HLA
/usr/local/bin/HLA-LA/src/HLA-LA.pl --BAM $cram_file_name --graph PRG_MHC_GRCh38_withIMGT --sampleID $sample_id --samtools_T $ref_fasta_file_name --maxThread $nr_threads 

#Create output
cp /usr/local/bin/HLA-LA/working/${sample_id}/hla/R1_bestguess_G.txt $best_out_file_name
cp /usr/local/bin/HLA-LA/working/${sample_id}/hla/R1_bestguess.txt $all_out_file_name

