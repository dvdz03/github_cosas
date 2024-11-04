#Ejercicios 04/NOV/24
cosasdehoy

library(Biostrings)
readAAStringSet("las_globinas.fasta")->globinas
globinas
library(BiocManager)
BiocManager::install("msa")
msa(globinas, method = "ClustalW")->alin
alin
msa(globinas, method="Muscle",type="protein")->mus
mus
#AQUÍ PARA ARRIBA ES EL ALINEAMIENTO

#DE AQUÍ PARA ABAJO INTENTÉ USAR EL GGMSA PEOR NO ME SALIÓ
library(ggmsa)
print(mus)
ggmsa(alin, 57,135, color="Chemistry_AA")
ggmsa::available_msa()

ggmsa(mus)
class(mus)
nj(mus)
install.packages("ape")
library(ape)

#ESTO ES PARA LA MATRIZ DE DISTANCIAS
print(mus,show="complete")
install.packages("seqinr")
library(seqinr)
musa<-msaConvert(mus, type="seqinr::alignment")
musa
str(musa)

di<-dist.alignment(musa,"identity")
di

musa
ggmsa(musa)
ggmsa::available_msa()
class(musa)
class(mus)

as.matrix(musa)->muso
muso
library(ape)
arbolito<-upgma(muso)

