function [ ret ] = ttest_sajat( matrix1, matrix2 )

    result = ttest2(matrix1,matrix2);
    
    for i=1:length(result)
       if(isnan(result(i)))
           result(i)=1;
       end
    end
    ret = mean(result);

end

