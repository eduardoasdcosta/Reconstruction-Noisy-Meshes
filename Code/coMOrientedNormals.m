function [CoMNormals] = coMOrientedNormals(Vertices,CenterOfMass)
    %compute the normals based on the position of the center of mass
    %this causes the normals to point away from the center of mass
    n = size(Vertices, 1);
    m = size(Vertices, 2);
    CoMNormals = zeros(n, m);

    for i=1:n
        vec = Vertices(i, :) - CenterOfMass;
        vec_norm = norm(vec);
        CoMNormals(i, :) = vec./vec_norm;
    end
end

