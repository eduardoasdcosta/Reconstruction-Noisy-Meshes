function plotMeshes(F, NorUnifV, NorGausV, CoMUnifV, CoMGausV)
    %function used to plot 4 different meshes in the same figure
    
    figure('units', 'normalized', 'outerposition', [0 0 1 1]);
    subplot(2, 2, 1);
    trimesh(F, NorUnifV(:,1), NorUnifV(:,2), NorUnifV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    title("Uniform Noise, Normal direction");
    subplot(2, 2, 2);
    trimesh(F, NorGausV(:,1), NorGausV(:,2), NorGausV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    title("Uniform Noise, Normal direction");
    subplot(2, 2, 3);
    trimesh(F, CoMUnifV(:,1), CoMUnifV(:,2), CoMUnifV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    title("Uniform Noise, Normal direction");
    subplot(2, 2, 4);
    trimesh(F, CoMGausV(:,1), CoMGausV(:,2), CoMGausV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    title("Uniform Noise, Normal direction"); 
end

