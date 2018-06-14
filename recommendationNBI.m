function [ result ] = recommendationNBI( NxM_matrix )
% In the NBI recommendation method, the recommendation value foi,A 
    SoNBI=Projection(NxM_matrix,'NBI');
    meret= size(NxM_matrix);
    result = zeros(meret);
   
    %sor - i
    for i=1:meret(1)
       
        %oszlop - Alpha
        for j=1:meret(2)
           
            
            result(i,j) = SumBeta(NxM_matrix,SoNBI,i,j);
            
       end
        
    end
    
    
end

function [result] = SumBeta(NxM_matrix,SoNBI,i,Alp)
    meret=size(NxM_matrix);
    result=0;
    for B=1:meret(2)
        result = result + (SoNBI(Alp,B) * NxM_matrix(i,B) );
    end
    
end

