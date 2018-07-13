function [ result ] = ConvertToGraph( NxM_matrix )
    sizeMatrix=size(NxM_matrix);
    
    adjMatrix = [zeros(sizeMatrix(1),sizeMatrix(1)), NxM_matrix;
         NxM_matrix', zeros(sizeMatrix(2),sizeMatrix(2))]; 
    result=graph(adjMatrix);
    
    % Plot
    %LWidths = 5*result.Edges.Weight/max(result.Edges.Weight);
    %h=plot(result,'EdgeLabel',result.Edges.Weight,'LineWidth',LWidths);
    
    h = plot(result);
    % Make it pretty
    h.XData(1:sizeMatrix(1)) = 1;
    h.XData((sizeMatrix(1)+1):end) = 2;
    h.YData(1:sizeMatrix(1)) = linspace(1,0,sizeMatrix(1));
    h.YData((sizeMatrix(1)+1):end) = linspace(1,0,sizeMatrix(2));
end