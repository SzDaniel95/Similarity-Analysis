a=[0 1 1; 0 1 0; 1 0 1; 0 0 1];
% S=sparse(a)
% Projection(S,'CF')
aG=ConvertToGraph(a);
M=Projection(a,'NBI');
G=digraph(M);
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
figure;
h=plot(G,'EdgeLabel',G.Edges.Weight,'LineWidth',LWidths);