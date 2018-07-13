function [ result, n_names, m_names ] = YelpReviewGraph()

    %YelpReviewGraph
    %Datastore beolvasás
    ds = datastore('D:/yelp_review_reduced_stuttgart.csv');
    T = readall(ds);
    T_size=height(T);
    % Users
    n_names=unique(T.user_id);
    %Business
    m_names=unique(T.business_id);
    n_size=length(n_names);
    m_size=length(m_names);

        
    %S = sparse(n_size,m_size);
    S = zeros(n_size,m_size);
    for i=1:T_size
        for j=1:m_size
            if(string(m_names(j))==string(T.business_id(i)))
                column=j;
                break;
            end
        end
        for j=1:n_size
            if(string(n_names(j))==string(T.user_id(i)))
                row=j;
                break;
            end
        end
        S(row,column)=T.stars(i);
        
    end
    result = sparse(S);
%     Help: how to get nodenames in Graph object:
%     graph.NodeLabel=[n_names,m_names];
end