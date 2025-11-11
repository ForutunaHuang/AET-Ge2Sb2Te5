# AET-Ge2Sb2Te5

**Fast β-relaxation governing the temporal evolution of electrical resistance in phase-change materials**

Huang Huang<sup>1</sup>, Jiong Zhou<sup>1</sup>, Ruiqin He<sup>2</sup>, Yakun Yuan<sup>3</sup>,  Huipu Liu<sup>1</sup>, Zhenzhen Yan<sup>1</sup>, Jun Ding<sup>4</sup>, Fan Zhu<sup>1*</sup>    

<sup>1</sup>College of Smart Materials and Future Energy, Fudan University, Shanghai 200438, China    
<sup>2</sup>Ministry of Industry and Information Technology Key Lab of Micro-Nano Optoelectronic Information System, Guangdong Provincial Key Laboratory of Semiconductor Optoelectronic Materials and Intelligent Photonic Systems, Harbin Institute of Technology (Shenzhen), Shenzhen, Guangdong 518055, China     
<sup>3</sup>Future Material Innovation Center, Zhangjiang Institute for Advanced Study and School of Physics and Astronomy, Shanghai Jiao Tong University, Shanghai 200030, China     
<sup>4</sup>Center for Alloy Innovation and Design, State Key Laboratory for Mechanical Behavior of Materials, Xi’an Jiaotong University, Xi’an 710049, China    
**Correspondence and requests for materials should be addressed to corresponding author (fzhu@fudan.edu.cn).*     


## Contents

- [Overview](#overview)
- [System Requirements](#system-requirements)
- [Repositary Contents](#repositary-contents)

# Overview

Structural relaxation in amorphous chalcogenides drives critical instabilities in electronic properties. However, the atomic-scale mechanism of this relaxation has remained elusive. Here, we employ atomic electron tomography to determine the three-dimensional atomic positions in amorphous Ge<sub>2</sub>Sb<sub>2</sub>Te<sub>5</sub> nanoparticles during thermal annealing over operational timescales. The experimental data and source codes for the 3D image reconstruction and post-analysis are provided here.

# System Requirements

## Hardware Requirements

We recommend a computer with 16G DRAM, standard i7 4-core CPU, and a GPU to run most data analysis source codes. But for the 3D reconstruction of the experimental data with RESIRE, atomic tracing and refinement, we recommend a computer with large memory (512G DRAM, 16-core CPU and 1 GPU).

## Software Requirements

### OS Requirements

This package has been tested on the following Operating System:

Linux: Ubuntu 22.04.5 LTS  
Windows: Windows 11, version 23H2  
Mac OSX: We have not tested it on a Mac yet, but it should in principle work.

### Matlab Version Requirements

This package has been tested with `Matlab` R2021b. All the codes have to run in their own folders. We recommend the use of `Matlab` version R2021a or higher to test the data and source codes.

# Repositary Contents

### 1. Experiment Data

Folder: [1_Measured_data](./1_Measured_data)

This folder contains experimental images after denoising and alignment as well as their corresponding tilt angles for the amorphous Ge<sub>2</sub>Sb<sub>2</sub>Te<sub>5</sub> nanoparticles.

### 2. The REal Space Iterative REconstruction (RESIRE) Package

Folder: [2_RESIRE_package](./2_RESIRE_package)

Run the code `Main_RESIRE_as_dep_GST.m`,`Main_RESIRE_anneal_30min_GST.m`,`Main_RESIRE_anneal_120min_GST.m` to perform the 3D reconstruction of the three Ge<sub>2</sub>Sb<sub>2</sub>Te<sub>5</sub> nanoparticles.

### 3. Reconstructed 3D Volume

Folder: [3_Final_reconstruction_volume](./3_Final_reconstruction_volume)

This folder contains the 3D reconstructed volumes of the three Ge<sub>2</sub>Sb<sub>2</sub>Te<sub>5</sub> nanoparticles.

### 4. Atom Tracing

Folder: [4_Atom_tracing](./4_Atom_tracing)

Run the codes `Main_atom_tracing_as_dep_GST.m`, `Main_atom_tracing_anneal_30min_GST.m` and `Main_atom_tracing_anneal_120min_GST.m` to trace the potential atomic positions from the reconstructed 3D volumes.

Run the codes `Main_remove_non_atom_peak_as_dep_GST.m`, `Main_remove_non_atom_peak_aanneal_30min_GST.m` and `Main_remove_non_atom_peak_aanneal_120min_GST.m` to separate non-atoms from the potential atoms using the K-mean clustering method. By carefully comparing the individual atomic positions in the potential atomic models with the 3D reconstructions, a small fraction of unidentified or misidentified atoms were manually corrected, producing the 3D atomic models of the three Ge<sub>2</sub>Sb<sub>2</sub>Te<sub>5</sub> nanoparticles.

### 5. Experimental Atomic Model

Folder: [5_Final_coordinates](./5_Final_coordinates)

This folder contains the final 3D atomic models of the three Ge<sub>2</sub>Sb<sub>2</sub>Te<sub>5</sub> nanoparticles.

### 6. Post Data Analysis

Folder: [6_Data_analysis](./6_Data_analysis)

Run the codes `RDF_as_dep_GST.m`, `RDF_anneal_30min_GST.m` and `RDF_anneal_120min_GST.m` to calculate the radial distribution functions for all the atoms in the three amorphous materials.