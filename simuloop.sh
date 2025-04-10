#!/bin/bash

for ((i = 1 ; i < 101 ; i++ ))

do

julia gtrees.jl

sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_dmxl.tre > dmxl.tre
sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_cmos.tre > cmos.tre
sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_mxra5.tre > mxra5.tre
sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_exph5.tre > exph5.tre
sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_pnn.tre > pnn.tre
sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_sncaip.tre > sncaip.tre
sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_a1d.tre > a1d.tre
sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_a4b.tre > a4b.tre
sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_a9c.tre > a9c.tre
sed -E 's/[a-zA-Z_]+/&_1/g' genetrees_a12d.tre > a12d.tre

./seq-gen -m HKY -a 0.305 -g 4 -or -l 344 -t 3.878 -s 0.5 a9c.tre > A9C.phy
./seq-gen -m HKY -a 0.498 -g 4 -or -l 411 -t 3.635 -s 0.5 a4b.tre > A4B.phy
./seq-gen -m HKY -a 0.85 -g 4 -or -l 757 -t 3.69 -s 0.6 a1d.tre > A1D.phy
./seq-gen -m HKY -or -l 417 -t 4.9 -i 0.78 -s 0.45 sncaip.tre > SNCAIP.phy
./seq-gen -m HKY -a 0.24 -g 4 -or -l 833 -t 5.85 -s 0.5 exph5.tre > EXPH5.phy
./seq-gen -m HKY -a 0.34 -g 4 -or -l 827 -t 4.44 -s 0.35 mxra5.tre > MXRA5.phy
./seq-gen -m HKY -a 0.2 -g 4 -or -l 479 -t 7 -s 0.4 cmos.tre > CMOS.phy
./seq-gen -m HKY -or -l 914 -i 0.88 -t 12.79 -s 0.25 dmxl.tre > DMXL.phy
./seq-gen -m GTR -or -l 699 -i 0.71 -s 0.1 genetrees_dnah3.tre > DNAH3.phy
./seq-gen -m HKY -or -a 0.31 -g 4 -l 516 -t 11.4 -s 0.5 genetrees_kif24.tre > KIF24.phy
./seq-gen -m HKY -or -l 455 -i 0.53 -t 8.47 -s 0.35 genetrees_prlr.tre > PRLR.phy
./seq-gen -m GTR -a 0.64 -g 4 -or -l 730 -s 0.7 a12d.tre > A12D.phy
./seq-gen -m HKY -a 0.1 -g 4 -or -l 886 -t 4.65 -i 0.7 pnn.tre > PNN.phy
./seq-gen -m GTR -a 0.92 -g 4 -or -l 2744 -i 0.48 genetrees_mtdna.tre > mtDNA.phy

R CMD BATCH genxml.r

cat genxml.r.Rout | tail -n +36 | sed -e :a -e '$d;N;2,4ba' -e 'P;D' > simseq

cat beast_top simseq beast_bottom > sim$i.xml

done