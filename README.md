# inferMSI

This repository contains scripts and an R package for infering MSI status given sequence data from cancer samples. There are currently two main scripts for running these analyses: paired.R and unpaired.R.

## Unpaired sample inference
The unpaired.R script analyzes [repeatseq](https://github.com/adaptivegenome/repeatseq) output, making MSI inferrences by comparing observed microsatellite distributions to a training data set. We have tested and obtained good results using this technique with Illumina sequence reads, and IonTorrent data we have tested suffered from low sensitivity.

An RData object containing a prediction model from our training data (add reference here) is included in the accompanying R package, but it is recommended that users generate their own prediction model with their own data. When using your own prediction model, the unpaired.R script will need to be modified. More documentation for the inferMSI R package, including usage and methods, can be found [here](https://github.com/BCGC/inferMSI/blob/master/inferMSI/README.md).

### Calling unpaired.R
Invoking unpaired.R using all defaults is done from the command line as follows:

```
R --no-save < unpaired.R
```

To run in a working directory other than the current working directory (e.g. ../data), or to run on a specific sample (e.g. sample1.bam.repeatseq) the invocation would be:

```
R --no-save < unpaired.R --args wd=../data
R --no-save < unpaired.R --args i=sample1.bam.repeatseq
```

#### Command line arguments
- i: Path to a specific file to infer MSI status (defaults to all files ending with "repeatseq" in the current working directory or the directory indicated by wd). See repeatseq.snakefile for some example code to generate these files.
- o: File path for the output (default is "MSIresults.out").
- wd: Path to an alternate working directory where the repeatseq data can be found (default is the current working directory).
- cutoff: MSI score cutoff/threshold for inferring MSI samples (default is 0.2). If you develop your own model using your own samples (recommended), this argument may need some tuning.

### Input
This script will look in the current working directory (unless otherwise directed by the wd or i arguments) for all files ending in "repeatseq". A Snakefile, [repeatseq.snakefile](https://github.com/BCGC/inferMSI/blob/master/Scripts/repeatseq.snakefile), is included in the repository for your convenience, that will run [repeatseq](https://github.com/adaptivegenome/repeatseq) on all bam files in a directory. Some modification of the Snakefile will probably be necessary.

### Output
A tab delimited text file with the following columns:
- File name
- MSI score
- MSI status: This is TRUE if the MSI score is above the cutoff and FALSE if it falls below the cutoff

## Paired sample inference
The paired.R script utilizes [MSIsensor](https://github.com/ding-lab/msisensor) to infer MSI status and requires paired tumor/normal samples. This R script is really just a wrapper for running MSIsensor on a large group of sample pairs and returns the results in one file. We have tested and obtained good results using this technique with both Illumina and IonTorrent sequence reads.

### Calling paired.R
The paired.R script is to be run from the command line as follows:

```
R --no-save < paired.R --args <input.file> <output.file>
```

### Input
A tab delimeted file with the following columns (column headers are required to be "normal", "tumor" and "out"):
- normal: bam file from normal sample
- tumor: bam file from paired tumor sample
- out: temporary MSIsensor output file for this sample

paired.R also assumes a reference file with the target microsatellites, hg19_12.list, is in the working directory. A symbolic link to the actual file can be created, or if using a different marker panel an appropriate file will need to be generated. See the [MSIsensor](https://github.com/ding-lab/msisensor) documentation for more details. Files for HG19 and B37 builds are included in this repository in the Data directory.

### Output
A tab delimited file with the following columns:
- Sample ID (taken from the input file name)
- Number of sites tested
- Nubmer of sites flagged as somatic
- Percent of sites flagged as somatic

## Additional scripts and data
There are a few additional scripts and data are included in this repository that the user may find useful.

### align1.snakefile
This snakefile contains a pipline to align single reads and generate bam files for all fastq files in the directory. Reference files will need to be provided and some additional editing of this script will likely be necessary for each system.

### align2.snakefile
This snakefile contains a pipline to align paired end reads and generate bam files for all fastq files in the directory. Reference files will need to be provided and some additional editing of this script will likely be necessary for each system.

### repeatseq.snakefile
This snakefile contains a pipeline to generate repeatseq files for each bam file in the directory. These files will be needed for unpaired.R. b37_10.regions and hg19_10.regions are provided in the Data directory of this repository, but may need to be generated for alternate marker panels. Additional reference files will need to be provided and some additional editing of this script will likely be necessary for each system.
