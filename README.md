# Project Description
The goal of this project was to reproduce part of the results of the study Transcriptional Reversion of Cardiac Myocyte Fate During Mammalian Cardiac Regenerationdone by O’Meara et al, and to learn and practice using the bioinforamtics tools implemented in this study.

The objectives of the original study was to determine if myocytes revert the transcriptional phenotype to a less differentiated state during regeneration and to systematically interrogate the transcriptional data to identify and validate potential regulators of this process.

In this project we downloaded RNA-Seq sequencing data from GEO, performed quality control, aligned the reads to mouse genome mm9, quantified gene expression, and identified differentially expressed genes associated with myocyte differentiation.

O’Meara et al. Transcriptional Reversion of Cardiac Myocyte Fate During Mammalian Cardiac Regeneration. Circ Res. Feb 2015. PMID: 25477501


# Contributors
Data Curator: Sarah Zhang (@zhiyu-zz) zzyu@bu.edu
Programmer: Jianfeng Ke (@jke20) jke@bu.edu
Analyst: Huisiyu Yu (@yuhuisiyu) yhsy@bu.edu
Biologist: Yu Zhong (@yuzhong1997) yuzhong@bu.edu

# Repository Contents
## Data Curator
### run_extract.qsub
Dependencies: SRA toolkit
Execution: `qsub run_extract.qsub`
Outputs: P0_1_1.fastq, P0_1_2.fastq
Convert sample from sra to fastq format.

### run_qc.qsub
Dependencies: FastQC
Execution: `qsub run_qc.qsub`
Outputs: P0_1_1_fastqc.html, P0_1_2_fastqc.html
Generate quality control reports
