#!/bin/bash -l

#$ -P bf528
#$ -cwd
#$ -j y
#$ -pe mpi_16_tasks_per_node 16

# load the modules
module load bowtie2 boost tophat
module load python3 samtools rseqc/3.0.0

# inner_distance
inner_distance.py -i ./P0_1_tophat/accepted_hits.bam -r /project/bf528/project_2/reference/annot/mm9.bed -o inner_distance_out
