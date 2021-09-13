function [newV, SNRs] = linearFilter(V, noisyV, D, A)
    %applies the linear filter to the noisy mesh

    n = size(noisyV, 1);
    newV = noisyV;
    invD = sparse(n, n);
    SNRs = [];

    %calculate normalized adjacency matrix
    for i=1:n
        invD(i,i) = 1/D(i,i);
    end
    linF = invD*A;
    
    counter = 1;
    
    %applies the filter to the mesh iteratively until max SNR is reached
    while(1 && counter < 1000)
        oldV = newV;
        newV = linF*newV;
        SNRs(counter) = getSNR(V, newV);
        if(counter > 1 && SNRs(counter) < SNRs(counter-1))
            newV = oldV;
            break;
        end
        counter = counter + 1;
    end

end