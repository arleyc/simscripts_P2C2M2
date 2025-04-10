using PhyloNetworks;
using PhyloCoalSimulations;
using Distributions;

nunet = readnewick("(((((((((Lhermannunezi:1.0,#H2:5.911605572983438::0.4709983664242478):1.7321101397135488,Linacayali:1.0):0.0011774181844964955,Lrothi:1.0):1.3924055942150178,((Lmartorii:1.0,(Lfitzingerii:1.0,Lcanqueli:1.0):0.800001233753171):0.3974214020860517,(Ldonosobarrosi:1.0,Lcuyanus:1.0):0.10979629909401686):0.6827956084104072):1.907051583688801,((((Leleodori:1.0,Lvallecurensis:1.0):1.2454204888556912,(Lruibali:1.0,(Lfamatinae:1.0,Landinus:1.0):0.8263227861315035):0.02514594222257442):0.2833743624216374,#H1:5.913620643865907::0.06267850704390932):1.1458980337503157,(Lmulticolor:1.0,Ldorbignyi:1.0):1.320065515576864):1.9946938972498458):0.3141585725033938,(((Llavillai:1.0,Lornatus:1.0):5.9121985385199185,Luspallatensis:1.0):1.7975722801843355)#H2:0.0011774181844964955::0.5290016335757521):0.5742038718987742,(((((((Lwiegmannii_Sal:1.0,(Lwiegmannii_Juj:1.0,Lwiegmannii_Tucu:1.0):0.45292805174677486):1.372046454669853,Lazarae:1.0):0.5055004810750344,((Lwiegmannii_Uy:1.0,Lwiegmannii:1.0):5.90990391274282,(Lwiegmannii_Ca:1.0,Lgardeli:1.0):1.1992872349195718):0.8479602386746954):5.930007853535595,Lscapularis:1.0):1.627162769210072,((Lsalinicola:1.0,(Lrabinoi:1.0,(Lriojanus:1.0,(Lmultimaculatus:1.0,Lcuyumhue:1.0):0.10765707304065883):0.008307749512510306):5.91253788652631):1.0824243127062265)#H1:0.0011774181844964955::0.9373214929560907):1.0240307492561949,((Llutzae:1.0,Larambarensis:1.0):2.3908678103004894,Loccipitalis:1.0):0.6837915904498082):1.5470626352264811,((Llentus:1.0,Lacostai:1.0):0.12880419078763278,(Lpseudoanomalus:1.0,Lanomalus:1.0):0.06666800580801262):5.0551327960036225):0.7423751625433161):5.9096324182416735,(Lmagellanicus:1.0,Lzullyae:1.0):5.909069645139399):5.911072471884774,Lpetrophilus:1.0);");

prlr = simulatecoalescent(nunet, 1, 2; nodemapping=true);
kif24 = simulatecoalescent(nunet, 1, 2; nodemapping=true);
dnah3 = simulatecoalescent(nunet, 1, 2; nodemapping=true);
dmxl = simulatecoalescent(nunet, 1, 1; nodemapping=true);
cmos = simulatecoalescent(nunet, 1, 1; nodemapping=true);
mxra5 = simulatecoalescent(nunet, 1, 1; nodemapping=true);
exph5 = simulatecoalescent(nunet, 1, 1; nodemapping=true);
pnn = simulatecoalescent(nunet, 1, 1; nodemapping=true);
sncaip = simulatecoalescent(nunet, 1, 1; nodemapping=true);
a1d = simulatecoalescent(nunet, 1, 1; nodemapping=true);
a4b = simulatecoalescent(nunet, 1, 1; nodemapping=true);
a9c = simulatecoalescent(nunet, 1, 1; nodemapping=true);
a12d = simulatecoalescent(nunet, 1, 1; nodemapping=true);

mtnet = nunet;

for e in mtnet.edge
	e.length *= 4
end;

mtdna = simulatecoalescent(mtnet, 1, 3; nodemapping=true);

myrates = LogNormal(-5.87, 0.5);
StatsPlots.plot(myrates)

networkedge_rate = Dict(e.number => rand(myrates) for e in nunet.edge);
rootedgenumber = PhyloCoalSimulations.get_rootedgenumber(nunet);
push!(networkedge_rate, rootedgenumber => rand(myrates));

for genetree in prlr
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(prlr, true);
writemultinewick(prlr, "./genetrees_prlr.tre");

for genetree in kif24
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(kif24, true);
writemultinewick(kif24, "./genetrees_kif24.tre");

for genetree in dnah3
     for e in genetree.edge
       e.length*= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(dnah3, true);
writemultinewick(dnah3, "./genetrees_dnah3.tre");

for genetree in dmxl
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(dmxl, true);
writemultinewick(dmxl, "./genetrees_dmxl.tre");

for genetree in cmos
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(cmos, true);
writemultinewick(cmos, "./genetrees_cmos.tre");

for genetree in mxra5
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(mxra5, true);
writemultinewick(mxra5, "./genetrees_mxra5.tre");

for genetree in exph5
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(exph5, true);
writemultinewick(exph5, "./genetrees_exph5.tre");

for genetree in pnn
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(pnn, true);
writemultinewick(pnn, "./genetrees_pnn.tre");

for genetree in sncaip
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(sncaip, true);
writemultinewick(sncaip, "./genetrees_sncaip.tre");

for genetree in a1d
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(a1d, true);
writemultinewick(a1d, "./genetrees_a1d.tre");

for genetree in a4b
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(a4b, true);
writemultinewick(a4b, "./genetrees_a4b.tre");

for genetree in a9c
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(a9c, true);
writemultinewick(a9c, "./genetrees_a9c.tre");

for genetree in a12d
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(a12d, true);
writemultinewick(a12d, "./genetrees_a12d.tre");

for genetree in mtdna
     for e in genetree.edge
       e.length *= networkedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(mtdna, true);
writemultinewick(mtdna, "./genetrees_mtdna.tre");
