function [hpdLower, hpdUpper] = HPD(mcmcSamples, probability)
    sortedSamples = sort(mcmcSamples);
    nSamples = length(sortedSamples);
    nIntervalSamples = floor(nSamples * probability);

    minRange = Inf;
    hpdIndices = [1, nIntervalSamples];

    for i = 1:(nSamples - nIntervalSamples + 1)
        currentWindowRange = sortedSamples(i + nIntervalSamples - 1) - sortedSamples(i);
        if currentWindowRange < minRange
            minRange = currentWindowRange;
            hpdIndices = [i, i + nIntervalSamples - 1];
        end
    end
    hpdLower = sortedSamples(hpdIndices(1));
    hpdUpper = sortedSamples(hpdIndices(2));
end
