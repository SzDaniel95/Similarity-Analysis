function [ G ] = YelpUserGraph2()

    %YelpUserGraph
    %Datastore beolvas�s
    ds = datastore('D:/yelp_userfriendWaibSzurt.csv');
    A = ['%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q';'%q'];
    str = string(A);
    str=str';
    C = cellstr(str);
    ds.TextscanFormats=C;
    %1 sort olvasunk be egyszerre
    ds.ReadSize=1;
    G=digraph();
    %Add nodes and edges
    %Az adatsor None friends es cell�val kell hogy hezd�dj�n
    %T = read(ds);
    %G = addnode(G,T.user_id);
    while hasdata(ds)
        T = read(ds);
        if string(T.Var5)=='None'
           %Ha nincsennek baratai csak l�trehozzuk a cs�csot
           %if findnode(G,T.user_id)==0
            %G = addnode(G,T.user_id);
           %end
           G = addnode(G,T.Var2);
        else
           %Ha vannak baratai akkor l�thezunk �leket
           for i=5:45
               currentVar = sprintf('Var%d',i);
               temp = T.(currentVar);
               if(~ismissing(temp))
                G=addedge(G,T.Var2,temp);
               end
           end
        end
    end
    %save('yelp_user_graph.mat','G')
end