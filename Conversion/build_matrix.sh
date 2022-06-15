#! /bin/bash

## usage
## set output names as arguments
## bash build_matrix.sh input_R1_001.hicup.bam input_R2_001.hicup.bam output_R1_2_001.hicup.matrix.txt
##
## defaults to input_R1_001.hicup.bam input_R2_001.hicup.bam output names if not given
## bash build_matrix.sh input_R1_2_001.hicup.bam

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

conda activate hicexplorer

input=$1
echo $input
inr1_prefix=$(echo $input | sed -E "s/(.*)_R1(.*)/\1/g")
echo $inr1_prefix
if [[ ! -z $2 ]]; then
    inr1=$2
    inr2_prefix=$(echo $r1 | sed -E "s/(.*)_R2(.*)/\1/g")
else
    inr2_prefix=$inr1_prefix
fi
echo $inr2_prefix
if [[ ! -z $3 ]]; then
    out=$3
    out_prefix=$(echo $r1 | sed -E "s/(.*)_R1_2(.*)/\1/g")
else
    out_prefix=$inr1_prefix
fi
echo $out_prefix

# convert to BAM files (with headers matched)
# samtools view ${inr1_prefix}_R1_001.hicup.bam | sed -E "s/^(.{6}:.{2}:.{9}:.{1}:.{4}):.{5}:(.{4})/\1:12345:\2/" > ${inr1_prefix}_R1_001.hicup.sam
# samtools view ${inr2_prefix}_R2_001.hicup.bam | sed -E "s/^(.{6}:.{2}:.{9}:.{1}:.{4}):.{5}:(.{4})/\1:12345:\2/" > ${inr2_prefix}_R2_001.hicup.sam
#samtools view ${inr1_prefix}_R1_001.hicup.bam > ${inr1_prefix}_R1_001.hicup.sam
#samtools view ${inr2_prefix}_R2_001.hicup.bam > ${inr2_prefix}_R2_001.hicup.sam

## nano +1071 /home/kelly-t/yes/envs/mamba/envs/hicexplorer/lib/python2.7/site-packages/hicexplorer/hicBuildMatrix.py
## pysam.Samfile(args.samFiles[0].name, 'rb', check_header = False, check_sq = False)
## pysam.Samfile(args.samFiles[0].name, 'rb', check_header = False, check_sq = False)


hicBuildMatrix --threads 4 --samFiles ${inr1_prefix}_R1_001.hicup.bam ${inr2_prefix}_R2_001.hicup.bam \
  --outFileName ${out_prefix}_R1_2_001.hicup.matrix.cool \
  --QCfolder 300_INFO/1/qc --danglingSequence GATC --restrictionSequence GATC --binSize 100000 1000000

#  --skipDuplicationCheck
#  --doTestRun --doTestRunLines 10000
