#!/bin/bash

for ((i = 1 ; i < 101 ; i++ ))

do

cat sim$i.xml | head -n +827 > sim
cat sim beast_bottom > ../sim$i.xml

done