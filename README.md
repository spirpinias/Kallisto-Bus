[![Code Ocean Logo](images/CO_logo_135x72.png)](http://codeocean.com/product)

<hr>

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

## Source 

https://pachterlab.github.io/kallisto/about

## Output

**.tsv**: Output Counts Matrix
**.h5** 
**.json** Logging information

<hr>

[Code Ocean](https://codeocean.com/) is a cloud-based computational platform that aims to make it easy for researchers to share, discover, and run code.<br /><br />
[![Code Ocean Logo](images/CO_logo_68x36.png)](https://www.codeocean.com)