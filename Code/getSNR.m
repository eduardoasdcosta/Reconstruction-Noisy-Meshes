function [SNR] = getSNR(V,noisyV)
	%calculate signal noise ratio between both meshes
    SNR = -20*log10(norm(V - noisyV)/norm(noisyV));
end

