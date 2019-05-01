function [ G ] = YelpUserGraph2()

    %YelpUserGraph
    %Datastore beolvasás
    ds = datastore('D:/yelp_user_BW.csv');
    %A bemeneten elõre legyenek kiszedve a NONE-ok !!!
    table = ds.readall;
    user=string(table.user_id);
    contains(user,'HVEkhgvEwFt5oDaW9Fm3qw');
    result={};
    ds2 = datastore('C:/Users/User/Desktop/n_names.csv');
    data=ds2.readall;
    data=data.n_names;
    
    G = digraph();
    G=addnode(G,data);
    for i=1:height(table)

        C = strsplit(string(table.friends(i)),{', '});

        for iz=1:length(C)
            %if (sum(contains(user,C(iz))) > 0)
                if (findnode(G,char(C(iz))) > 0)
                    %result=[result; cellstr(table.user_id(i)), cellstr(C(iz)) ];
                    G=addedge(G,cellstr(table.user_id(i)),cellstr(C(iz)));
                end
            %end

        end
    end
    %G = digraph();

    %for i=1:length(result)
       % G=addedge(G,cellstr(result(i,1)),cellstr(result(i,2)));
    %end
    plot(G)
    G=graph(GetSymmetric(full(G.adjacency)));
    %save('yelp_user_graph.mat','G')
    end

