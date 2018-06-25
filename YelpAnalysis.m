function [ G ] = YelpAnalysis()

    %yelp_review
    %Datastore beolvasás
    ds = datastore('D:/yelp_review_reduced.csv');
    %TODO lassú, külön kell szedni a csúcsokat
    %Beolvasás a memóriába
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

