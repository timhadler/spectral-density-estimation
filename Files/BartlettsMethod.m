function [psd] = BartlettsMethod(data)
%Returns PSD estimate found using Bartlett's method
n = length(data);
fs = 173.61;

nsegs = 128;
segLen = n / nsegs;

est = [];

% Calculate periodogram over nsegments
for i = 0:nsegs -1
    seg = data(1+i*segLen: i*segLen+segLen);
    [p, f] = periodogram(seg, [], [], fs);
    est(i+1, :) = p;
end

psd = 10*log10(mean(est));
end

