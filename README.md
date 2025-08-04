# simscripts_P2C2M2
Scripts used for simulating sequence data from species trees and networks to evaluate P2C2M2 (https://github.com/arleyc/P2C2M2) performance (see Villamil et al. 2025, doi:10.1093/sysbio/syaf048)

<br>**gtreestree.jl**: Julia script to simulate gene trees from an input species tree with branch lengths in coalescent units using the PhyloCoalSimulations package.

<br>**gtreesnet.jl**: Julia script to simulate gene trees from an input species network with branch lengths in coalescent units using the PhyloCoalSimulations package.

<br>**genxml.r**: R script to generate a data block in XML format from a sequence alignment in Phylip format.

<br>**simuloop.sh**: Bash script to generate sequence data with SeqGen using the gene trees simulated with gtreestree.jl or gtreesnet.jl. Phylip alignments are processed with genxml.r to generate data blocks in XML format, which are pasted to beast_top and beast_bottom blocks to create an input XML file for species tree inference with StarBeast2 in BEAST 2.
<br>