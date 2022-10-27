


# contact-filtering
DisVis-based filtering of contacts from co-evolution data (or other sources)


![This is an image](https://github.com/haddocking/contact-filtering/blob/main/banner.png?raw=true)

Here you can find the dataset described in the manuscript:
_Improving the Quality of Co-evolution Intermolecular Contact Prediction with DisVis_
Siri Camee van Keulen, Alexandre M.J.J. Bonvin

DOI: *TBD

<br/>

## 1. Content 
In this repository you can find 26 directories for each complex in the dataset. The name of each directory is composed of the **PDB ID**, the **Green ID** (see manuscript) and the **number of true contacts** within the top 10 according to Green et al. [[1]].  

<br/>

### 1.1. Directory Structure 
```
PDBID_GreenID_contacts (e.g. 1FM0_allpdb0609_6)
│   GreenID_contacts_pdb_disvis_top20_10A.txt
│
└─── ana_scripts
│      
└─── p1_coevol_20restraints_50%
|
└─── p2_coevol_10restraints_0%
|
└─── p3_disvis_10restraints_0%
|
└─── p4_coevol_10restraints_50%
|
└─── p5_disvis_10restraints_50%
|
└─── p6_coevol_5restraints_0%
|
└─── p7_disvis_5restraints_0%
|
└─── p8_disvis_20restraints_zscore_lt0_5_50%
|
└─── p9_disvis_20restraints_zscore_lt1_50%
```

<br/>

#### 1.1.2. **DisVis calculation for a complex**
In each complex folder, 10 directories and one file can be found. In this file (GreenID_contacts_pdb_disvis_top20_10A.txt) the top 20 contacts (excluding unresolved residue contacts) are described according to DisVis format.

<br/>

---
**DisVis Format Example**
```
A 53 CA B 11 CA 0 10
```
Here a contact is described between the CA atom of residue 53 of chain A and the CA atom of residue 11 of chain B. The lower bound is 0 Angstrom and the upper bound is 10 Angstrom.

---
This file can be used together with the pdb files of the complex on the DisVis webserver [[2]] to calculate the z-score for each contact. The pdb files of each complex can be found in every protocol folder in the complex directory and are named by combining the **GreenID**, the **number of true contacts** within the top 10 according to Green et al. [[1]] and the chain ID (e.g. `allpdb0609_6_A.pdb`). Both pdb files for chain A and chain B are required to run the DisVis calculation.

<br/>

#### 1.1.3. **Docking protocols**
Nine directories in each complex directory include the files to perform the protocols described in the manuscript. The numbering of the protocols is according to Table 2 in the manuscript.

![This is an image](https://github.com/haddocking/contact-filtering/blob/main/table_2.png?raw=true)

The name of each protocol includes the **protocol number** according to the manuscript, **contact method** which was used to arrange the contacts in the distance restraint file (disvis or coevolution), **the number of contacts** included in the distance restraint file and the **percentage of random removal** for the contact list during docking (e.g. `p5_disvis_10restraints_50%`).

<br/>

Inside each **protocol** the architecture is as follows:
```
ProtocolNumber_ContactMethod_NumberOfContacts_Removal (e.g p1_coevol_20restraints_50%)
│   GreenID_contacts_chainA.pdb
|   GreenID_contacts_chainB.pdb
│   ambig.tbl
|   hbonds.tbl
|   run.cns
|
└─── output
```
* Protein Structures:
    * `GreenID_contacts_chainA.pdb` coordinates for chain A
    * `GreenID_contacts_chainB.pdb` coordinates for chain B
* Distance restraints:
	* `ambig.tbl` Ambiguous interaction restraints
	* `hbonds.tbl` Unambiguous restraints
* Docking input:
    * `run.cns`  

<br/>

The **output** directory includes selected docking output and output from the analysis scripts included in the `ana_scripts` directory.

* `ambig.tbl` Used Ambiguous interaction restraints during docking
* `DockQ.dat` List of DockQ output for all 200 models of itw also include the i-RMSD values 
* `cluster.out` cluster output list of the generated models in itw
* `file.list` ranked models according to haddock itw score
* `clusters_haddock-sorted.stat_best4` ranked clusters according to haddock itw score
* `file_nam_clust{Cluster_Number}_best4` top 4 models for every cluster

<br/>

#### 1.1.4. **Analysis scripts for Each Protocol**

Each complex directory includes an `ana_scripts` directory (see Section 1.1.). Here all scripts are made available to obtain the `DockQ.dat` and cluster files from the `output directory`. 

* `target.pdb` Reference complex structure with renumbered atoms and renamed chainID that matches HADDOCK output
* `cluster-fnat.csh` `fraction-native.csh` `i-rmsd_to_xray.csh` `l-rmsd_to_xray.csh` `run_all-no-it0.csh` `make-target-files.csh` `run_all.csh` `run_all-dockQ.csh` `run_dockQ.csh` All required scripts for the analysis
* `target.contacts10` `target.izoneA` `target.contacts5` `target.izoneB` `target.izone` `target.lzone` All required files for the analysis

## 2. Docking results 
the predicted 200 models for each protocol can be found on Zenodo:  *TBD

[1]: doi:10.1038/s41467-021-21636-z
[2]: https://wenmr.science.uu.nl/disvis/
