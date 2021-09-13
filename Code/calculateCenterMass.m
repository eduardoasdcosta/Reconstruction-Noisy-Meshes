function [CoM] = calculateCenterMass(Vertices)
    %calculates center of mass of the mesh
    CoM = 0;
    N = size(Vertices, 1);
    for i=1:N
        CoM = CoM + Vertices(i,:)/N;
    end

end

