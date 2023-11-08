# HiCUP+ (Hi-C User Pipeline Plus)
--------------------------

![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/kellysthri/hicup-plus/latest?label="latest")
![Docker Image Version (latest by date)](https://img.shields.io/docker/v/kellysthri/hicup-plus/latest)
![Docker Image Size (latest)](https://img.shields.io/docker/image-size/kellysthri/hicup-plus/latest)
![Docker Manual build](https://img.shields.io/docker/automated/kellysthri/hicup-plus?label=docker%20local%20build)
![Docker Cloud Status](https://img.shields.io/docker/cloud/build/kellysthri/hicup-plus?label=cloud%20build)
![Docker Stars](https://img.shields.io/docker/stars/kellysthri/hicup-plus)
![Docker Pulls](https://img.shields.io/docker/pulls/kellysthri/hicup-plus)

![GitHub release (latest by date)](https://img.shields.io/github/v/release/hugp-ri/hicup-plus?label=GitHub%20release)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/hugp-ri/hicup-plus)
![GitHub repo size](https://img.shields.io/github/repo-size/hugp-ri/hicup-plus)
![GitHub top language](https://img.shields.io/github/languages/top/hugp-ri/hicup-plus)
![HiCUP+ Test (Bowtie2)](https://github.com/hugp-ri/hicup-plus/actions/workflows/main.yml/badge.svg)

![GitHub Release Date](https://img.shields.io/github/release-date/hugp-ri/hicup-plus)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/hugp-ri/hicup-plus/master)
![GitHub issues](https://img.shields.io/github/issues/hugp-ri/hicup-plus)
![GitHub pull requests](https://img.shields.io/github/issues-pr/hugp-ri/hicup-plus)

![GitHub forks](https://img.shields.io/github/forks/hugp-ri/hicup-plus?style=social)
![GitHub Repo stars](https://img.shields.io/github/stars/hugp-ri/hicup-plus?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/hugp-ri/hicup-plus?style=social)

HiCUP+ (HiCUP-plus) is a bioinformatics pipeline for processing Hi-C data. 

[HiCUP+](https://github.com/hugp-ri/hicup-plus/) is a fork of [HiCUP](https://github.com/StevenWingett/HiCUP/)
with additional functionality. Please note that this is a maintained separately, a
lthough efforts have been made to ensure compatibility with configurations with prior versions.

This version is maintained by [H.U. Group Research Institute, G.K.](https://www.hugp.com/research/en) (Akiruno-shi, Tokyo, Japan).
We acknowledge the original developers at Babraham Institute (Cambridge, English, United Kingdom). 

## Source

HiCUP+ is released open-source:
https://github.com/hugp-ri/hicup-plus/

A Docker image is available:
https://hub.docker.com/r/kellysthri/hicup-plus

## Bug Reports

Report issues to the following repository:
https://github.com/hugp-ri/hicup-plus/issues/new

## Maintainers

HiCUP (v0.8.2) maintainer: Steven Wingett

Contact:
Contact the software author to discuss the software, report bugs or suggest enhancements at:
https://github.com/StevenWingett/HiCUP/issues

HiCUP+ (v1.0.3) maintainer: S. Thomas Kelly

Contact:
simonthomas.kelly [at] hugp [dot] com

## Documentation

New features are documented here.

HiCUP+ Documentation:
https://hicup-plus.readthedocs.io/en/latest/index.html

HiCUP+ is backwards compatible with HiCUP configuration files. 
Please refer to the documentation for the original version for more details:

HiCUP homepage:
http://www.bioinformatics.babraham.ac.uk/projects/hicup

HiCUP Documentation:
https://www.bioinformatics.babraham.ac.uk/projects/hicup/read_the_docs/html/index.html

## Supported aligners

HiCUP+ supports aligner configuration for several algorithms.

- Bowtie (Langmead et al., 2009)

- Bowtie2 (Langmead and Salzberg, 2012)

- HiSAT2 (Kim et al., 2019)

- Dragen Bio-IT platform v3.8.4 (Illumina, 2019)

- STAR (Dobin et al., 2013)

## Citation

Please cite the following preprint:

> Kelly, S. T. & Yuhara, S. (2022) HiCUP-Plus: a fast open-source pipeline for accurately processing large scale Hi-C sequence data.
> _bioRxiv_ 2022.05.18.492393; doi: [10.1101/2022.05.18.492393](https://doi.org/10.1101/2022.05.18.492393)

BibTeX version:

```
@article {Kelly2022.05.18.492393,
    author = {Kelly, S. Thomas and Yuhara, Satoshi},
    title = {{H}i{C}{U}{P}-{P}lus: a fast open-source pipeline for accurately processing large scale {H}i-{C} sequence data},
    elocation-id = {2022.05.18.492393},
    year = {2022},
    doi = {[10.1101/2022.05.18.492393](https://doi.org/10.1101/2022.05.18.492393)},
    publisher = {Cold Spring Harbor Laboratory},
    abstract = {Hi-C is an unbiased genome-wide assay to study 3D chromosome conformation and gene-regulation. The HiCUP pipeline is an open-source tool to process Hi-C from massively parallel sequencing while accounting for biases specific to the restriction enzyme digests used. It is an excellent solution tailored to analyse this technique, however the latest aligner supported by the current release is Bowtie2. To improve the computational performance and mapping accuracy when using the HiCUP pipeline, we have modified it to optionally call the HiSAT2 and Dragen aligners. This allows using the HiCUP pipeline with 3rd party aligners, including the commercially-licensed high performance Dragen aligner. The HiCUP+ pipeline is modified extensively to be compatible with Dragen outputs while ensuring that the same results as the original pipeline can be reproduced with the Bowtie or Bowtie2 aligners. Using the highly accurate HiSAT2 or Dragen aligners produces larger outputs with a higher proportion of uniquely mapped read pairs. It is therefore feasible to leverage the reduced compute-time of Dragen to reduce compute costs and turnaround-time without compromising quality of results. The HiCUP pipeline and Dragen both compute rich summary information.Competing Interest StatementThe authors have declared no competing interest.},
    URL = {https://www.biorxiv.org/content/early/2022/05/19/2022.05.18.492393},
    eprint = {https://www.biorxiv.org/content/early/2022/05/19/2022.05.18.492393.full.pdf},
    journal = {bioRxiv}
}
```

The software release can be cited as follows:

> Kelly, S. T. & Yuhara, S. (2022) HiCUP+: a fast open-source pipeline for accurately processing large scale Hi-C sequence data.
> Software release v1.0.3 URL: [https://github.com/hugp-ri/hicup-plus/](https://github.com/hugp-ri/hicup-plus/)

BibTex version:

```
@Manual{,
    author = {Kelly, S. Thomas and Yuhara, Satoshi},
    title = {{H}i{C}{U}{P}-{P}lus: a fast open-source pipeline for accurately processing large scale {H}i-{C} sequence data}},
    year = {2022},
    note = {Software release version v1.0.3},
    url = {[https://github.com/hugp-ri/hicup-plus/](https://github.com/hugp-ri/hicup-plus/)},
}
```

The original pipeline is described here:

> Wingett S., Ewels P., Furlan-Magaril M., Nagano T., Schoenfelder S., Fraser P., and Andrews S. (2015)
> HiCUP: pipeline for mapping and processing Hi-C data.
> _F1000Research_, **4**:1310; doi: [10.12688/f1000research.7334.1](https://doi.org/10.12688/f1000research.7334.1)

BibTeX version:

```
@Article{pmid26835000,
   author = {Wingett, S.  and Ewels, P.  and Furlan-Magaril, M.  and Nagano, T.  and Schoenfelder, S.  and Fraser, P.  and Andrews, S.},
   title = {{H}i{C}{U}{P}: pipeline for mapping and processing {H}i-{C} data},
   year = {2015},
   doi = {[10.12688/f1000research.7334.1](https://doi.org/10.12688/f1000research.7334.1)}
   publisher = {Faculty of 1000},
   abstract = {HiCUP is a pipeline for processing sequence data generated by Hi-C and Capture Hi-C (CHi-C) experiments, which are techniques used to investigate three-dimensional genomic organisation. The pipeline maps data to a specified reference genome and removes artefacts that would otherwise hinder subsequent analysis. HiCUP also produces an easy-to-interpret yet detailed quality control (QC) report that assists in refining experimental protocols for future studies. The software is freely available and has already been used for processing Hi-C and CHi-C data in several recently published peer-reviewed studies.},
   URL = {[https://doi.org/10.12688/f1000research.7334.1](https://doi.org/10.12688/f1000research.7334.1)},
   eprint = {[https://f1000research.com/articles/4-1310/v1/pdf?article_uuid=1db6bc91-55db-475d-995a-e1eb25cac0f1](https://f1000research.com/articles/4-1310/v1/pdf?article_uuid=1db6bc91-55db-475d-995a-e1eb25cac0f1)},
   journal = {F1000Res},
   volume = {4},
   pages = {1310}
}
```
