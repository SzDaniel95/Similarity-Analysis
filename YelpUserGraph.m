function [ G ] = YelpUserGraph()

    %YelpUserGraph
    %Datastore beolvasás
    ds = datastore('D:/yelp_user_reduced.csv');
    %1 sort olvasunk be egyszerre
    ds.ReadSize=1;
    G=graph();
    %Add nodes and edges, 154/min -> Nagy számítási igény!!!
    while hasdata(ds)
        T = read(ds);
        if string(T.friends)=='None'
           %Ha nincsennek baratai csak létrehozzuk a csúcsot
           if findnode(G,T.user_id)==0
            G = addnode(G,T.user_id);
           end
        else
           %Ha vannak baratai akkor léthezunk éleket
           C = strsplit(string(T.friends),{', '});
           for i=1:length(C)
               G=addedge(G,T.user_id,cellstr(C(i)));
           end
        end
    end
    save('yelp_user_graph.mat','G')
end

