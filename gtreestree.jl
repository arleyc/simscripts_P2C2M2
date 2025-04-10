using PhyloNetworks;
using PhyloCoalSimulations;
using Distributions;
using StatsPlots;

nutree = readnewick("(Lpetrophilus:1.0,((((((Lfamatinae:1.0,Landinus:1.0):0.8462937009991452,((Lvallecurensis:1.0,Leleodori:1.0):1.244272857525418,Lruibali:1.0):0.0011774181844964955):1.3613523225811879,(Ldorbignyi:1.0,Lmulticolor:1.0):1.3509280847242164):1.8541019662496847,((Luspallatensis:1.0,(Llavillai:1.0,Lornatus:1.0):5.912099565919211):1.6247738673877081,((Lcuyanus:1.0,(((Lcanqueli:1.0,Lfitzingerii:1.0):0.8032607623656967,Lmartorii:1.0):0.3446748081451,Ldonosobarrosi:1.0):0.08289133987782378):0.7743833685984653,((Lrothi:1.0,Linacayali:1.0):0.6517757523112646,Lhermannunezi:1.0):0.552572153910962):0.8762082642873996):0.4323171602384371):0.838952320870162,(((Loccipitalis:1.0,(Llutzae:1.0,Larambarensis:1.0):2.4031164744025):0.7426130229933011,((Lsalinicola:1.0,(Lcuyumhue:1.0,(Lrabinoi:1.0,(Lriojanus:1.0,Lmultimaculatus:1.0):0.23237883700550555):0.552682425656914):5.912187575908608):0.9182923936547062,((((Lwiegmannii_Uy:1.0,Lwiegmannii:1.0):5.910350889623473,(Lwiegmannii_Ca:1.0,Lgardeli:1.0):1.1992975606690472):0.8479265257175703,(Lazarae:1.0,((Lwiegmannii_Juj:1.0,Lwiegmannii_Tucu:1.0):0.45286607751563035,Lwiegmannii_Sal:1.0):1.3717281465499416):0.5059124065979814):5.9315277393903765,Lscapularis:1.0):1.8862814565458161):0.594452410521692):1.1835779752698437,(Lpseudoanomalus:1.0,(Llentus:1.0,(Lacostai:1.0,Lanomalus:1.0):0.0011774181844964955):0.35721134511409275):4.821845025487777):0.7001218931743756):5.910239430170324,(Lzullyae:1.0,Lmagellanicus:1.0):5.909137783213031):5.9091225878699305);")

prlr = simulatecoalescent(nutree, 1, 2; nodemapping=true);
kif24 = simulatecoalescent(nutree, 1, 2; nodemapping=true);
dnah3 = simulatecoalescent(nutree, 1, 2; nodemapping=true);
dmxl = simulatecoalescent(nutree, 1, 1; nodemapping=true);
cmos = simulatecoalescent(nutree, 1, 1; nodemapping=true);
mxra5 = simulatecoalescent(nutree, 1, 1; nodemapping=true);
exph5 = simulatecoalescent(nutree, 1, 1; nodemapping=true);
pnn = simulatecoalescent(nutree, 1, 1; nodemapping=true);
sncaip = simulatecoalescent(nutree, 1, 1; nodemapping=true);
a1d = simulatecoalescent(nutree, 1, 1; nodemapping=true);
a4b = simulatecoalescent(nutree, 1, 1; nodemapping=true);
a9c = simulatecoalescent(nutree, 1, 1; nodemapping=true);
a12d = simulatecoalescent(nutree, 1, 1; nodemapping=true);

mttree = nutree;

for e in mttree.edge
	e.length *= 4
end;

mtdna = simulatecoalescent(mttree, 1, 3; nodemapping=true);

myrates = LogNormal(-5.87, 0.5);
StatsPlots.plot(myrates)

treeedge_rate = Dict(e.number => rand(myrates) for e in nutree.edge);
rootedgenumber = PhyloCoalSimulations.get_rootedgenumber(nutree);
push!(treeedge_rate, rootedgenumber => rand(myrates));
    
for genetree in prlr
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(prlr, true);
writemultinewick(prlr, "./genetrees_prlr.tre");

for genetree in kif24
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(kif24, true);
writemultinewick(kif24, "./genetrees_kif24.tre");

for genetree in dnah3
     for e in genetree.edge
       e.length*= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(dnah3, true);
writemultinewick(dnah3, "./genetrees_dnah3.tre");

for genetree in dmxl
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(dmxl, true);
writemultinewick(dmxl, "./genetrees_dmxl.tre");

for genetree in cmos
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(cmos, true);
writemultinewick(cmos, "./genetrees_cmos.tre");

for genetree in mxra5
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(mxra5, true);
writemultinewick(mxra5, "./genetrees_mxra5.tre");

for genetree in exph5
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(exph5, true);
writemultinewick(exph5, "./genetrees_exph5.tre");

for genetree in pnn
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(pnn, true);
writemultinewick(pnn, "./genetrees_pnn.tre");

for genetree in sncaip
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(sncaip, true);
writemultinewick(sncaip, "./genetrees_sncaip.tre");

for genetree in a1d
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(a1d, true);
writemultinewick(a1d, "./genetrees_a1d.tre");

for genetree in a4b
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(a4b, true);
writemultinewick(a4b, "./genetrees_a4b.tre");

for genetree in a9c
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(a9c, true);
writemultinewick(a9c, "./genetrees_a9c.tre");

for genetree in a12d
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(a12d, true);
writemultinewick(a12d, "./genetrees_a12d.tre");

for genetree in mtdna
     for e in genetree.edge
       e.length *= treeedge_rate[population_mappedto(e)] / 2
     end
end;
removedegree2nodes!.(mtdna, true);
writemultinewick(mtdna, "./genetrees_mtdna.tre");
