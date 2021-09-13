function [D, A] = uweights(V,F)
    %computes the discrete laplacian matrix using uniform weights

    nSamples = size(V, 1);
    
    %create sparse adjacency matrix
    A = sparse(nSamples, nSamples);
    D = sparse(nSamples, nSamples);
    
    %populate the adjacency matrix
    for i=1:size(F, 1)
        A(F(i,1), F(i,2)) = 1;
        A(F(i,1), F(i,3)) = 1;
        A(F(i,2), F(i,3)) = 1;
        A(F(i,3), F(i,2)) = 1;
        A(F(i,3), F(i,1)) = 1;
        A(F(i,2), F(i,1)) = 1;
    end
    
    %get degree of each vertex
    for i=1:nSamples
        D(i,i) = sum(A(i,:));
    end
end