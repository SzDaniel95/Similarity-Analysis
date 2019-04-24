function [ result, name_pairs ] = KozossegOsszehasonlit()
    
    ds = datastore('C:/Users/User/Documents/Similarity-Analysis/kozossegek.csv');
    T = readall(ds);
    meret=size(T);
    name_pairs=cell(53130,2);
    result=zeros(53130,1);
    z=1;
    for i=1:meret(1)
        for j=1:(meret(1))
            if(i~=j)
                name_pairs(z,1)=cellstr(T.ID(i));
                name_pairs(z,2)=cellstr(T.ID(j));
                if(T.Social(i)==T.Social(j) && T.Gmdw(i)==T.Gmdw(j) || ~(T.Social(i)==T.Social(j)) && ~(T.Gmdw(i)==T.Gmdw(j)))
                    result(z)=1;
                end
                z=z+1; 
            end
            
        end
    end

end

