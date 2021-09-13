function [normVertices] = normalizeMesh(Vertices)
    %The mesh is normalized to a 1-by-1-by-1 space

    n = size(Vertices, 1);
    m = size(Vertices, 2);
    normVertices = zeros(n,m);

    %Finds the maximum distance between any two vertices on all coordinates
    sX = max(Vertices(:,1)) - min(Vertices(:,1));
    sY = max(Vertices(:,2)) - min(Vertices(:,2));
    sZ = max(Vertices(:,3)) - min(Vertices(:,3));
    
    s = max([sX sY sZ]);
    
    %Normalizes the mesh
    normVertices = Vertices./s;
end

