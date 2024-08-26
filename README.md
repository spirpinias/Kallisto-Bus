# Kallisto 

kallisto is a program for quantifying abundances of transcripts from bulk and single-cell RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. 

## Input data

In **data** directory, tool searches for .fastq.gz sequencing files and .fasta reference sequences.  

## Parameters 

### Main Parameters
Number of Threads
- Number of cores used by featureCounts. If not specified, will use all available. 

Type of Sequencing
- Single or Paired Ended reads

Length of Fragment

Standard Deviation of Fragment

Number of Bootstraps k > 0 

Kmer Size for DeBruijn Graph Int < 31 (Odd)

Prefix for Bus File 

Chemistry Type - See Drop Down Menu

## Source 

https://pachterlab.github.io/kallisto/about

## Output

**.tsv**: Output Counts Matrix
**.h5** 
**.json** Logging information
