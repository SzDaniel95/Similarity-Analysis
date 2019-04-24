# ez a végleges verzió az ECMI2018 előadáshoz:
#
library(igraph)
#
ui<-read.csv('UIbipartite.csv', sep = " ", head = TRUE, nrows=5261669)
UI<-graph_from_data_frame(ui, directed = TRUE)
rm(list='ui')
V(UI)[degree(UI, mode = "in")==0]$type<-TRUE
V(UI)[degree(UI, mode = "out")==0]$type<-FALSE
UI<-delete.vertices(UI, V(UI)[is.na(V(UI)$type)])
V(UI)$degree<-degree(UI)
UI<-delete.vertices(UI, V(UI)$degree==0)
is.bipartite(UI)

# ---------------------------------------------------------------
users_UI<-V(UI)[V(UI)$type==TRUE]
paste('UI csúcsok száma:', vcount(UI))
paste('UI élek száma:', ecount(UI))
paste('UI userek száma: ', length(users_UI))
# ---------------------------------------------------------------
# nagyon sok olyan user van, aki legfeljebb 5 értékelést csinál, kitöröljük őket.
tiz<-V(UI)[name %in% as_ids(users_UI)][degree<=5]
UI<-delete.vertices(UI, v=as_ids(tiz))
# azokat is töröljük ki, akik nagyon aktívak, tehát 500 fölötti a fokszámuk
users_UI<-V(UI)[V(UI)$type==TRUE]
otszaz<-V(UI)[name %in% as_ids(users_UI)][degree<=5]
UI<-delete.vertices(UI, v=as_ids(tiz))
#
V(UI)$degree<-degree(UI)
nulla<-V(UI)[degree==0]
UI<-delete.vertices(UI, v=as_ids(nulla))
users_UI<-V(UI)[V(UI)$type==TRUE]
items_UI<-V(UI)[V(UI)$type==FALSE]
V(UI)$degree<-degree(UI)
#
paste('UI userek száma: ', length(users_UI))
paste('UI itemek száma:', length(items_UI))
paste('UI élek száma:', ecount(UI))


#====================================================================
uu<-read.csv('Usimple.csv', sep = " ", header = FALSE, nrows=44295467)
U<-graph_from_data_frame(uu, directed = FALSE)
rm(list='uu')
#-----------------------------------------------
# statisztika
paste('U csúcsok száma:', vcount(U))
paste('U élek száma:', ecount(U))

#-----------------------------------------------
# csak azokat a csúcsokat tartsuk meg, akik az UI-ben benne vannak
Ur<-V(U)[name %in% as_ids(users_UI)]
Urest<-induced_subgraph(U, Ur)
# viszont így lesznek 0 fokszámú csúcsok, azokat ki kell törölni.
V(Urest)$degree<-degree(Urest)
nulla<-V(Urest)[degree==0]
Urest<-delete.vertices(Urest, v=as_ids(nulla))
users_Urest<-V(Urest)
paste('Urest csúcsok száma:', vcount(Urest))
paste('Urest élek száma:', ecount(Urest))
#-------------------------------------------------
#
items<-V(UI)[V(UI)$type==FALSE]
uir<-V(UI)[name %in% as_ids(users_Urest) | name %in% as_ids(items)]
UIrest<-induced_subgraph(UI, uir)

users_UIrest<-V(UIrest)[V(UIrest)$type==TRUE]
items_UIrest<-V(UIrest)[V(UIrest)$type==FALSE]

# ilyenkor még vannak az UIrest-ben olyan item-ek, amikre nincs hivatkozás...
# illetve olyan is, amire csak 1 hivatkozás van, ennek úgysincs szerepe a projekcióban
# töröljük:
V(UIrest)$degree<-degree(UIrest)
zero_one_in_item<-V(UIrest)[name %in% as_ids(items_UIrest)][degree<=1]
UIrest<-delete.vertices(UIrest, v=as_ids(zero_one_in_item))

users_UIrest<-V(UIrest)[V(UIrest)$type==TRUE]
items_UIrest<-V(UIrest)[V(UIrest)$type==FALSE]

paste('UIrest userek száma: ', length(users_UIrest))
paste('UIrest itemek száma:', length(items_UIrest))
paste('UIrest élek száma:', ecount(UIrest))

#------------------------------------------------------
# kitöröljük a gráfokat, amik már nem kellenek:
rm(list='U')
rm(list='UI')

#------------------------------------------------------
# és kiírjuk fálba az Urest gráfot
write.graph(Urest, "Urest.csv", format="ncol")
write.graph(UIrest, "UIrest.csv", format="ncol")

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# projekció
start_time <- Sys.time()
#P<-bipartite.projection(UIrest, which=TRUE, multiplicity = FALSE)
P<-bipartite.projection(UIrest, which=TRUE, multiplicity = TRUE)
end_time <- Sys.time()
print(end_time-start_time)

#-----------------------------------------------
# közösségek keresése:
clUrest<-cluster_label_prop(Urest)
clP<-cluster_label_prop(P)

clovainUrest<-cluster_louvain(Urest)
clovainP<-cluster_louvain(P)
#
V(P)$cl<-membership(clovainP)
V(Urest)$cl<-membership(clovainUrest)

userlist<-V(P)
kpairs<-data.frame(user=as_ids(userlist), clP=V(P)[as_ids(userlist)]$cl, clUrest=V(Urest)[as_ids(userlist)]$cl)
#order them according the the clP
kpo<-kpairs[order(kpairs$clP),]
k1000P<-sizes(clovainP)[sizes(clovainP)>1000]
k1000U<-sizes(clovainUrest)[sizes(clovainUrest)>1000]
#
kpof<-kpo[kpo$clP %in% names(k1000P),]
kpof<-kpof[kpof$clUrest %in% names(k1000U),]
K<-graph_from_data_frame(kpof[,2:3])
E(K)$weight<-1
Ks<-simplify(K, edge.attr.comb="sum")
summary(Ks)
#
as_adjacency_matrix(Ks, attr="weight")[1:6,7:13]




