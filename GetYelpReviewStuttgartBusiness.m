function [ result_table ] = GetYelpReviewStuttgartBusiness()

    ds = datastore('D:/yelp_business_stuttgart.csv');
    stuttgart = readall(ds);
    stuttgart_meret = size(stuttgart);
    %stuttgart.business_id(2);
    ds = datastore('D:/yelp_review_reduced.csv');
    %1 sort olvasunk be egyszerre
    ds.ReadSize=1;
    result_table = table();
    z=0;
    while hasdata(ds)
        z=z+1
        T = read(ds);
        for i=1:stuttgart_meret(1)
            if string(T.business_id)==string(stuttgart.business_id(i))
                result_table = [result_table; T];
            end
        end
        
    end
    writetable(result_table,'yelp_review_reduced_stuttgart.csv','WriteVariableNames',1,'Delimiter',';')
end

