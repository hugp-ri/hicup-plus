#! /bin/bash

## usage
## set output names as arguments
## bash split_bam.sh input_R1_2_001.hicup.bam output_R1_001.hicup.bam output_R2_001.hicup.bam
##
## defaults to input_R1_001.hicup.bam input_R2_001.hicup.bam output names if not given
## bash split_bam.sh input_R1_2_001.hicup.bam

###################################################################################
###################################################################################
##This file is Copyright (C) 2022, S. Thomas Kelly                               ##
##                                                                               ##
##                                                                               ##
##This file is part of HiCUP-Plus.                                               ##
##                                                                               ##
##HiCUP+ is free software: you can redistribute it and/or modify                 ##
##it under the terms of the GNU General Public License as published by           ##
##the Free Software Foundation, either version 3 of the License, or              ##
##(at your option) any later version.                                            ##
##                                                                               ##
##HiCUP is distributed in the hope that it will be useful,                       ##
##but WITHOUT ANY WARRANTY; without even the implied warranty of                 ##
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                  ##
##GNU General Public License for more details.                                   ##
##                                                                               ##
##You should have received a copy of the GNU General Public License              ##
##along with HiCUP+.  If not, see <http://www.gnu.org/licenses/>.                ##
###################################################################################
###################################################################################

input=$1
echo $input
in_prefix=$(echo $input | sed -E "s/(.*)_R1_2(.*)/\1/g")
echo $in_prefix
if [[ ! -z $2 ]]; then
    r1=$2
    r1_prefix=$(echo $r1 | sed -E "s/(.*)_R1(.*)/\1/g")
    if [[ ! -z $3 ]]; then
        r2=$3
        r2_prefix=$(echo $r2 | sed -E "s/(.*)_R2(.*)/\1/g")
    else
        r2_prefix=$r1_prefix
    fi
else
    r1_prefix=$in_prefix
    r2_prefix=$in_prefix
fi
echo $r1_prefix
echo $r2_prefix

# copy SAM header to new files
samtools view -H ${input} > ${r1_prefix}_R1_001.hicup.sam
cp ${r1_prefix}_R1_001.hicup.sam ${r2_prefix}_R2_001.hicup.sam

# add matching files from unsorted HiCUP BAM file (R1 and R2 interleaved) 
samtools view ${input} | grep S._L00._R1_001.map >> ${r1_prefix}_R1_001.hicup.sam
samtools view ${input} | grep S._L00._R2_001.map >> ${r2_prefix}_R2_001.hicup.sam

# convert to BAM files
samtools view -bS  ${r1_prefix}_R1_001.hicup.sam >  ${r1_prefix}_R1_001.hicup.bam
samtools view -bS  ${r2_prefix}_R2_001.hicup.sam >  ${r2_prefix}_R2_001.hicup.bam

# remove intermediate files
rm ${r1_prefix}_R1_001.hicup.sam ${r2_prefix}_R2_001.hicup.sam
