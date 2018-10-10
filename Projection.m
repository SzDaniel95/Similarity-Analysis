function [ result ] = Projection( NxM_matrix, type )
    %Method for similarity

    type = validatestring(type, {'Jaccard', 'CF', 'NBI', 'HeatS', 'MDW', 'BP', 'Counting'});

    switch type
        case 'Jaccard'
            %tesztelve
            result = Jaccard(NxM_matrix);
            if(issymmetric(result)==0)
                result=round(result);
            end
        case 'CF'
            %tesztelve
            result = CollaborativeFiltering(NxM_matrix);
            if(issymmetric(result)==0)
                result=round(result);
            end
        case 'NBI'
            %NBI - Objektumra
            %Tesztelve
            meret=size(NxM_matrix);
            result = zeros(meret(2));
            for i=1:meret(2)
                %oszlop
                for j=1:meret(2)
                    result(i,j)=NBI(NxM_matrix,i,j);
                    if(i==j)
                        result(i,j)=0;
                    end
                end
            end
        case 'HeatS'
            %Tesztelve - Objektumra
            meret=size(NxM_matrix);
            result = zeros(meret(2));
            for i=1:meret(2)
                %oszlop
                for j=1:meret(2)
                    result(i,j)=HeatS(NxM_matrix,i,j);
                    if(i==j)
                        result(i,j)=0;
                    end
                end
            end
        case 'MDW'
            %Tesztelve
            result = MDW(NxM_matrix);
            if(issymmetric(result)==0)
                result=round(result);
            end
        case 'BP'
            %Tesztelve
            %Nullával való osztás lép fel és ezért NaN kerül be
            result = BinaryPearson(NxM_matrix);
            if(issymmetric(result)==0)
                result=round(result);
            end
        case 'Counting'
            %Similarity
            %Counting the number of objects n_i,j
            %Tesztelve
            result = zeros(length(NxM_matrix));
            for i=1:length(NxM_matrix)
                %oszlop
                for j=1:length(NxM_matrix)
                    if(i~=j)
                        result(i,j)=Similarity(NxM_matrix,i,j);
                    end
                end
            end
            if(issymmetric(result)==0)
                result=round(result);
            end

    end

end



%% Jaccard:
function [ result ] = Jaccard( input )

    result = zeros(length(input));
    %Konvetálás graph objektummá
    g=Convert2Graph(input);
    %sor
    for i=1:length(input)
        Ki=degree(g,i);
        %oszlop
        for j=1:length(input)
            if(i~=j)
                Kj=degree(g,j);
                result(i,j)=Similarity(input,i,j)/(Ki+Kj);
            end
       end
        
    end
    

end

%% MDW:
function [ result ] = MDW( input )
    % Maximum Degree Weighted (MDW) similarity
    
    result = zeros(size(input));
    %Konvetálás graph objektummá
    g=Convert2Graph(input);
    %sor
    for i=1:length(input)
        Ki=degree(g,i);
        %oszlop
        for j=1:length(input)
            if(i~=j)
                Kj=degree(g,j);
                result(i,j)=MDW_SUM(input,i,j)/max([Ki Kj]);
            end
       end
        
    end


end

function [result] = MDW_SUM(NxM_matrix,i,j)
     meret=size(NxM_matrix);
     result=0;
     for A=1:meret(2)
         A_degree=ObjDegree(NxM_matrix,A);
         if(A_degree>1)
             result = result + ((NxM_matrix(i,A)*NxM_matrix(j,A))/(A_degree-1));
         end
     end
        
end

function[A_degree] = ObjDegree(NxM_matrix,A)
    meret=size(NxM_matrix);
    A_degree=0;
    for i=1:meret(1)
        if(NxM_matrix(i,A)>0)
            A_degree=A_degree+1;
        end
    end
end

%% CF:
function [ result ] = CollaborativeFiltering( input )
    
    result = zeros(length(input));
    %Konvetálás graph objektummá
    g=Convert2Graph(input);
    %sor
    for i=1:length(input)
        Ki=degree(g,i);
        %oszlop
        for j=1:length(input)
            if(i~=j)
                Kj=degree(g,j);
                result(i,j)=Similarity(input,i,j)/min([Ki Kj]);
            end
       end
        
    end

end
%% NBI:
function [ s_NBI ] = NBI( NxM_matrix, A , B )
   % Network-Based Inference (NBI)
    meret=size(NxM_matrix);
    B_degree=0;
    for i=1:meret(1)
        if(NxM_matrix(i,B)>0)
            B_degree=B_degree+1;
        end
    end
    
    s_NBI=0;
    for i=1:meret(1)
        s_NBI = s_NBI + NxM_matrix(i,A)*NxM_matrix(i,B)/DegreeUser(NxM_matrix,i);
    end
    
    s_NBI = s_NBI / B_degree;

end

%% HeatS
function [ s_HeatS ] = HeatS( NxM_matrix, A , B )
    meret=size(NxM_matrix);
    A_degree=0;
    for i=1:meret(1)
        if(NxM_matrix(i,A)>0)
            A_degree=A_degree+1;
        end
    end
    
    s_HeatS=0;
    for i=1:meret(1)
        s_HeatS = s_HeatS + NxM_matrix(i,A)*NxM_matrix(i,B)/DegreeUser(NxM_matrix,i);
    end
    
    s_HeatS = s_HeatS / A_degree;

end

function [l_degree] = DegreeUser(NxM_matrix,l)
    meret=size(NxM_matrix);
    l_degree=0;
    for i=1:meret(2)
        if(NxM_matrix(l,i)>0)
            l_degree=l_degree+1;
        end
    end
end

%% Similarity:
function [ result ] = Similarity( input, i, j )
%     Similarity measures
%     C - input matrix
%     n_i,j=SUM(C_i,A * C_j,A) where sum from A=1 to M

    result=0;
    meret=size(input);
    for A=1:meret(2)
         result = result + input(i,A) * input(j, A);
    end

end

%% BP
function [ result ] = BinaryPearson( input )
    %Binary Pearson (BP) similarity
    %NaN-ok jelennek meg nulla osztásnál, milyen lekezelés legyen?
    result = zeros(length(input));
    M=size(input);
    M=M(2);
    %Konvetálás graph objektummá
    g=Convert2Graph(input);
    %sor
    for i=1:length(input)
        Ki=degree(g,i);
        %oszlop
        for j=1:length(input)
            Kj=degree(g,j);
            if(i~=j && M~=0 && (sqrt(Ki*(1-Ki/M)*Kj*(1-Kj/M)))~=0)
                result(i,j)=(Similarity(input,i,j)-Ki*Kj/M);
                result(i,j)= result(i,j) / (sqrt(Ki*(1-Ki/M)*Kj*(1-Kj/M)));
            end
       end
        
    end
    

end








