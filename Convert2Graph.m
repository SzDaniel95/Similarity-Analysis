function [ result ] = Convert2Graph( NxM_matrix)
    sizeMatrix=size(NxM_matrix);
    
    adjMatrix = [zeros(sizeMatrix(1),sizeMatrix(1)), NxM_matrix;
         NxM_matrix', zeros(sizeMatrix(2),sizeMatrix(2))];
     result=graph(adjMatrix);
end