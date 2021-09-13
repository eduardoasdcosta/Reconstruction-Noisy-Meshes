function [newV, SNRs] = heatDifFilter(V, noisyV, D, A, dt)
    %applies the heat diffusion filter to the noisy mesh

    n = size(noisyV, 1);
    newV = noisyV;
    invD = sparse(n, n);
    SNRs = [];

    %calculate normalized laplacian matrix
    for i=1:n
        invD(i,i) = 1/D(i,i);
    end
    W = invD*(D - A);
    
    counter = 1;

    %applies the filter to the mesh iteratively until max SNR is reached
    while(1 && counter < 1000)
        oldV = newV;
        newV = newV - dt*W*newV;
        SNRs(counter) = getSNR(V, newV);
        if(counter > 1 && SNRs(counter) < SNRs(counter-1))
            newV = oldV;
            break;
        end
        counter = counter + 1;
    end
end

