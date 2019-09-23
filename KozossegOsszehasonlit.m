function [ result ] = KozossegOsszehasonlit(vector1,vector2)
    truePositive = 0;
    falseNegative = 0;
    trueNegative = 0;
    falsePositive = 0;
    for i=1:length(vector1)
        for j=1:length(vector1)
            bool1 = (vector1(i)==vector1(j));
            bool2 = (vector2(i)==vector2(j));
            if (bool1==bool2)
                truePositive = truePositive + 1;
            end
            if (bool1 == 1 && bool2 == 0)
                falseNegative = falseNegative + 1;
            end
            if (bool1 == 0 && bool2 == 1)
                trueNegative = trueNegative + 1;
            end
            if (bool1 == 0 && bool2 == 1)
                falsePositive = falsePositive + 1;
            end
            
        end
    end
    result.truePositive = truePositive;
    result.falseNegative = falseNegative;
    result.trueNegative = trueNegative;
    result.falsePositive = falsePositive;
end

