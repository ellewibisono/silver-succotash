##Change 1 for git practice 
##Change 2 
### This script is used to count how many genes are contained in an organism's
# genome that is in the .gff file.
### The first part of the script (from if to fi) functions to give a usage 
# direction if it is not run in the correct way. For example, if we try to 
# bash the script without specifying the file name of the organism genome 
# sequence, it will give an output in the form of a direction. 
### The second part of the script (from filename=$1 to echo) prints the 
# sentence specified in echo and makes sure that all outputs will be 
# printed on the same line (to give the effect of the two commands being 
# in the same sentence).  
### The third part of the script (from cat) is a series of pipes to determine 
# the number of genes that will be printed in the output. The number of
# genes is than printed on the same line as the output from the previous 
# command.    
### How to use the script. In the shell, type: bash 01-run.sh genomefilename 
# with 01-run.sh the name of the file the script is saved in 
# and the genomefilename, the name of file that contains all of the genome 
# A caveat: since to determine the number of genes, we cut out the third 
# field of the dataset, this script can only be used if the data file is 
# formatted in the same way that this one is. 
# Otherwise the third field may reflect some other columns. 

#!/bin/bash

if [ $# -eq 0 ]; then 
# if the filename is not specified ($# is a 
# positional parameter and in the case that number of 
# filename specified is zero), then 
	echo "Usage: $0 filename" 
# print the sentence in quotation mark 
# and replace the $0 with the filename of this script file (01-run.sh)
	exit 1 
# exits the script if there is an error status 1 
fi 
# the closing clause after if  

filename=$1 
#any mention of $filename will be substituted with a file that is 
# specified for the first time in the command line 

echo -n "The number of genes in $filename is " 
# prints the sentence specified in the quotations and replaces the 
# $filename into the filename we speciefied and prints the number of genes on 
# the same line as the sentence 

cat $filename | 
#opens and prints the specified file and then pipe to   
grep -v '^#' | 
#search and select the file for lines that DO NOT begin 
# with #. This is achieved by using the -v invert command. Otherwise we will
# be searching for lines that start with a # sign. ^ means begins with.    
cut -f3 | # cuts the third field from the data set and keeps it. 
# The -f tail specifies how the data is formatted. 
grep gene | # find "gene" from the third field 
wc -l #conduct a word count on how many times the word gene is found/ 
# how many lines the word gene comes up   
