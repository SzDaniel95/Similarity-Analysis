function [ result ] = EstimationOfInterest( NxM_matrix )
% vU_i,A Estimation (10)
% vu i, that is an estimation of how much user ui might be interested on object o

    sU=Projection(NxM_matrix,'CF');
    meret= size(NxM_matrix);
    result = zeros(meret);
   
    %sor - i
    for i=1:meret(1)
       
        %oszlop - Alpha
        for j=1:meret(2)
           
            Up=dividend(NxM_matrix,sU,i,j);
            Down=divisor(NxM_matrix,sU,i);
            result(i,j) = Up/Down;
            
       end
        
    end

   
end

function [result] = dividend(NxM_matrix,sUi_j,i,Alpha)
    result=0;
    for l=1:length(NxM_matrix)
        if(l~=i)
            result = result + ( sUi_j(i,l) * NxM_matrix(l,Alpha) ); 
        end
    end
end

 
 
 
function [result] = divisor(NxM_matrix,sUi_j,i)
    result=0;
    for l=1:length(NxM_matrix)
        if(l~=i)
            result = result + abs(sUi_j(i,l)); 
        end
    end
end
 