%Datastore beolvas�s
ds = datastore('D:/yelp_review_reduced.csv');
%Beolvas�s a mem�ri�ba
T = readall(ds);
%El�r�s
T.business_id(3)
%Friend ellen�rz�se:
string(T.friends(5))=='None'
 C = strsplit(string(T.friends(1)),{', '});

%Gr�f:
G=graph();
G = addnode(G,'uUzsFQn_6cXDh6rPNGbIFA');
G = addnode(G,'JJ-aSuM4pCFPdkfoZ34q0Q');
G=addedge(G,'uUzsFQn_6cXDh6rPNGbIFA','JJ-aSuM4pCFPdkfoZ34q0Q',3);

%Ritkam�trix:
S = sparse(A)
b = full(S) 
%�res ritka m�trix defini�l�s
S = sparse(1000,5000)
S(1,2)=45;%el�r�s