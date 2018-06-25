function [ G ] = YelpAnalysis()

    %yelp_review
    %Datastore beolvasás
    ds = datastore('D:/yelp_review_reduced.csv');
    %1 sort olvasunk be egyszerre
    ds.ReadSize=1;
    G=graph();
    %Init node - otherwise: Error Graph does not contain node names.
    T=read(ds);
    G = addnode(G,T.business_id);
    G = addnode(G,T.user_id);
    %Add nodes and edges
    while hasdata(ds)
        T = read(ds);
        G = addedge(G,T.user_id,T.business_id,T.stars);
    end


end

