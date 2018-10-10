function [ result ] = GetSymmetric( matrix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    for i=1:length(matrix)
        for j=1:length(matrix)
            if(matrix(i,j)~=matrix(j,i))
                if(matrix(i,j)>matrix(j,i))
                    matrix(j,i)=matrix(i,j);
                else
                    matrix(i,j)=matrix(j,i);
                end
            end
        end
    end
    result = matrix;
end

