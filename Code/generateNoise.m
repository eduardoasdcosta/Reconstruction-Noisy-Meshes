function [NorUnifV, NorGausV, CoMUnifV, CoMGausV] = generateNoise(F, V, N)
    %generates 4 noisy meshes
    %uses 2 different normal vectors, and 2 different error functions
    %the vertices are translated in the same direction as its correspondent normals
    err = 0.05;
    mu = 0;
    sigma = 0.025;
    
    %compute normals based on the center of mass
    CoM = calculateCenterMass(V);
    CoMNorms = coMOrientedNormals(V, CoM);  
    
    %plots the point cloud and both normals  
    figure('units', 'normalized', 'outerposition', [0 0 1 1]);
    subplot(1, 2, 1);
    hold on;
    scatter3(V(:,1), V(:,2), V(:,3), '.', 'MarkerEdgeColor', 'k');
    quiver3(V(:,1), V(:,2), V(:,3), N(:,1), N(:,2), N(:,3), 'Color', [0 128 255]./255);
    view(-90,10)
    axis off
    title("Normals of the original mesh");
    subplot(1, 2, 2);
    hold on;
    scatter3(V(:,1), V(:,2), V(:,3), '.', 'MarkerEdgeColor', 'k');
    scatter3(CoM(1), CoM(2), CoM(3), 'o', 'LineWidth', 3.5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
    quiver3(V(:,1), V(:,2), V(:,3), CoMNorms(:,1), CoMNorms(:,2), CoMNorms(:,3), 'Color', [0 128 255]./255);
    view(-90,10)
    axis off
    title("Normals computed by center of mass");
    
    %applies the different noises to the mesh
    NorUnifV = applyNoise(V, N, 'U', err);
    NorGausV = applyNoise(V, N, 'G', [mu, sigma]);
    CoMUnifV = applyNoise(V, CoMNorms, 'U', err);
    CoMGausV = applyNoise(V, CoMNorms, 'G', [mu, sigma]);
    
    %plots the obtained noisy meshes
    figure('units', 'normalized', 'outerposition', [0 0 1 1]);
    suptitle({"Noisy";"Meshes"});
    subplot(1, 4, 1);
    trimesh(F, NorUnifV(:,1), NorUnifV(:,2), NorUnifV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    view(-60,10)
    axis off
    title("Uniform Noise, Normal direction");
    subplot(1, 4, 2);
    trimesh(F, NorGausV(:,1), NorGausV(:,2), NorGausV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    view(-60,10)
    axis off
    title("Gaussian Noise, Normal direction");
    subplot(1, 4, 3);
    trimesh(F, CoMUnifV(:,1), CoMUnifV(:,2), CoMUnifV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    view(-60,10)
    axis off
    title("Uniform Noise, CoM direction");
    subplot(1, 4, 4);
    trimesh(F, CoMGausV(:,1), CoMGausV(:,2), CoMGausV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    view(-60,10)
    axis off
    title("Gaussian Noise, CoM direction");    
end