clear;
clc;
close all;

addpath('./geom_toolbox');
[V, F, ~, ~, N] = readOFF('../proj_data/cat.off');

V = normalizeMesh(V);

%plots original mesh
figure('units', 'normalized', 'outerposition', [0 0 1 1]);
trimesh(F, V(:,1), V(:,2), V(:,3), 'FaceColor', [101 147 245]./255, 'FaceAlpha', 1, 'EdgeColor', [17 30 108]./255);
view(-60,10)
axis off;
title("Original Mesh");

%generates noisy meshes
[NorUnifV, NorGausV, CoMUnifV, CoMGausV] = generateNoise(F, V, N);

%applies linear filter to the meshes
runLinearFilter(V, F, NorUnifV, NorGausV, CoMUnifV, CoMGausV);

%applies heat difusion filter to the meshes
runHeatDifFilter(V, F, NorUnifV, NorGausV, CoMUnifV, CoMGausV, 0.2);