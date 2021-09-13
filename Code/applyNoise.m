function [noisyV] = applyNoise(Vertices, Normals, type, dist_params)
    %applies noise to a given mesh mesh
    n = size(Vertices, 1);
    m = size(Vertices, 2);
    noisyV = zeros(n, m);

    %finds which type of noise is to be applied
    if type == "Uniform" || type == "Unif" || type == "U"
        flag = 1;
    elseif type == "Gaussian" || type == "Gauss" || type == "G"
        flag = 0;
    else
        exit(1);
    end

    %computes the new vertices with noise
    for i=1:n
        if flag
            rng = dist_params*(2*rand(1,1) - 1); 
        else
            rng = normrnd(dist_params(1), dist_params(2), 1); 
        end
        noisyV(i, :) = Vertices(i, :) + Normals(i, :).*rng;
    end
end

