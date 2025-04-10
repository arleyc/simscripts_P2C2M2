#!/bin/bash


for ((i = 1 ; i < 101 ; i++ ))

do

mkdir newsim$i

/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/A1D.trees -o ./newsim$i/A1D.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/A4B.trees -o ./newsim$i/A4B.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/A9C.trees -o ./newsim$i/A9C.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/A12D.trees -o ./newsim$i/A12D.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/CMOS.trees -o ./newsim$i/CMOS.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/DMXL.trees -o ./newsim$i/DMXL.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/DNAH3.trees -o ./newsim$i/DNAH3.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/EXPH5.trees -o ./newsim$i/EXPH5.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/KIF24.trees -o ./newsim$i/KIF24.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/mtDNA.trees -o ./newsim$i/mtDNA.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/MXRA5.trees -o ./newsim$i/MXRA5.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/PNN.trees -o ./newsim$i/PNN.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/PRLR.trees -o ./newsim$i/PRLR.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/SNCAIP.trees -o ./newsim$i/SNCAIP.trees -b 10 -resample 5000000
/Applications/GeneticApps/BEAST\ 2.7.7/bin/logcombiner -log ./sim$i/species.trees -o ./newsim$i/species.trees -b 10 -resample 5000000

cp ./sim$i/sim$i.xml ./newsim$i/sim$i.xml

done