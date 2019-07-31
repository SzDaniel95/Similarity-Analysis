function [ output_args ] = optimalCommunityStructure( varargin )
    figure;
    hold on;
    bp = [268   266   249   219   212   181   115    95    89    70    66    37    15    12    12    11    10];
    cf = [557   349   193   183   171   148   120   105    26    15    13    13    12    11    11];
    jaccard = [246 234   193   188   171   158   152   123   119   102    74    74    43    18    15    11     6];
    MDW = [307   185   175   172   162   131   129   108    73    70    64    63    62    47    45    40    40    29    25];
    user = [233   191   188   165   154   153   143   132   106   104   103   103   102    50];
    plot(bp,'-o');
    plot(cf,'-o');
    plot(jaccard,'-o');
    plot(MDW,'-o');
    plot(user,'-o');
    title('Optimal Community Structure')
    ylabel('Number of nodes in community')
    xlabel('Communities')
    legend('BP', 'CF', 'Jaccard', 'MDW', 'Social')

end

