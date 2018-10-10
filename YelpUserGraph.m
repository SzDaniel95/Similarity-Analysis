function [ G ] = YelpUserGraph()

    %YelpUserGraph
    %Datastore beolvas�s
    ds = datastore('D:/yelp_user_reduced_stuttgart.csv');
    %ds = datastore('C:/Users/User/Desktop/userStutgart.csv');
    %1 sort olvasunk be egyszerre
    ds.ReadSize=1;
    G=digraph(); 
    %Add nodes and edges
    %Az adatsor None friends es cell�val kell hogy hezd�dj�n
    %T = read(ds);
    %G = addnode(G,T.user_id);
    while hasdata(ds)
        T = read(ds);
        if string(T.friends)=='None'
           %Ha nincsennek baratai csak l�trehozzuk a cs�csot
           %if findnode(G,T.user_id)==0
            %G = addnode(G,T.user_id);
           %end
        else
           %Ha vannak baratai akkor l�thezunk �leket
           C = strsplit(string(T.friends),{', '});
           
           for i=1:length(C)
               G=addedge(G,T.user_id,cellstr(C(i)));
           end
        end
    end
    %save('yelp_user_graph.mat','G')
end

