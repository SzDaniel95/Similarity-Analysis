function [ G ] = YelpAnalysis()

    %YelpReviewGraph
    %Datastore beolvasás
    ds = datastore('D:/yelp_review_reduced.csv');
    %1 sort olvasunk be egyszerre
    ds.ReadSize=1;
    G=graph();
    %Add nodes and edges kb 100/sec sebesség kb 14 óra futtatás
    while hasdata(ds)
        T = read(ds);
        G = addedge(G,T.user_id,T.business_id,T.stars);
    end
    save('yelp_review_graph.mat','G')
end

