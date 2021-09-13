function runHeatDifFilter(V, F, NorUnifV, NorGausV, CoMUnifV, CoMGausV, dt)
    %applies a heat diffusion filter to the meshes, in order to try and recover them

    %computes the discrete laplacian matrix
    [NorUnifD, NorUnifA] = uweights(NorUnifV, F);
    [NorGausD, NorGausA] = uweights(NorGausV, F);
    [CoMUnifD, CoMUnifA] = uweights(CoMUnifV, F);
    [CoMGausD, CoMGausA] = uweights(CoMGausV, F);
    
    %applies the heat diffusion filter to the mesh
    [NorUnifV, NorUnifSNRs] = heatDifFilter(V, NorUnifV, NorUnifD, NorUnifA, dt);
    [NorGausV, NorGausSNRs] = heatDifFilter(V, NorGausV, NorGausD, NorGausA, dt);
    [CoMUnifV, CoMUnifSNRs] = heatDifFilter(V, CoMUnifV, CoMUnifD, CoMUnifA, dt);
    [CoMGausV, CoMGausSNRs] = heatDifFilter(V, CoMGausV, CoMGausD, CoMGausA, dt);
    
    %plots the reconstructed meshes
    figure('units', 'normalized', 'outerposition', [0 0 1 1]);
    suptitle({"Heat";"Equation";"Filtering";"dt = " + num2str(dt)});
    subplot(1, 4, 1);
    trimesh(F, NorUnifV(:,1), NorUnifV(:,2), NorUnifV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    view(-60,10)
    axis off
    title({"Uniform Noise, Normal direction";"SNR = " + num2str(NorUnifSNRs(size(NorUnifSNRs,2) - 1))});
    subplot(1, 4, 2);
    trimesh(F, NorGausV(:,1), NorGausV(:,2), NorGausV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    view(-60,10)
    axis off
    title({"Gaussian Noise, Normal direction";"SNR = " + num2str(NorGausSNRs(size(NorGausSNRs,2) - 1))});
    subplot(1, 4, 3);
    trimesh(F, CoMUnifV(:,1), CoMUnifV(:,2), CoMUnifV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    view(-60,10)
    axis off
    title({"Uniform Noise, CoM direction";"SNR = " + num2str(CoMUnifSNRs(size(CoMUnifSNRs,2) - 1))});
    subplot(1, 4, 4);
    trimesh(F, CoMGausV(:,1), CoMGausV(:,2), CoMGausV(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
    view(-60,10)
    axis off
    title({"Gaussian Noise, CoM direction";"SNR = " + num2str(CoMGausSNRs(size(CoMGausSNRs,2) - 1))});
end