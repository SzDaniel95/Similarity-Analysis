%Datastore beolvasás
ds = datastore('D:/yelp_review_reduced.csv');
%Beolvasás a memóriába
T = readall(ds);
%Elérés
T.business_id(3)
%Friend ellenõrzése:
string(T.friends(5))=='None'
 C = strsplit(string(T.friends(1)),{', '});

%Gráf:
G=graph();
G = addnode(G,'uUzsFQn_6cXDh6rPNGbIFA');
G = addnode(G,'JJ-aSuM4pCFPdkfoZ34q0Q');
G=addedge(G,'uUzsFQn_6cXDh6rPNGbIFA','JJ-aSuM4pCFPdkfoZ34q0Q',3);

%Ritkamátrix:
S = sparse(A)
b = full(S) 
%Üres ritka mátrix definiálás
S = sparse(1000,5000)
S(1,2)=45;%elérés