function [ G ] = YelpAnalysis()

    %yelp_review
    %Datastore beolvas�s
    ds = datastore('D:/yelp_review_reduced.csv');
    %TODO lass�, k�l�n kell szedni a cs�csokat
    %Beolvas�s a mem�ri�ba
    T = readall(ds);
    tablesize = size(T);
    G=graph();
    %Init node - otherwise: Error Graph does not contain node names.
    G = addnode(G,T.business_id(1));
    G = addnode(G,T.user_id(1));
    %Add nodes
    while hasdata(ds)
        if(findnode(G,T.business_id(i))==0)
            G = addnode(G,T.business_id(i));
        end
        
        if(findnode(G,T.user_id(i))==0)
            G = addnode(G,T.user_id(i));
        end
    end


end

