%%
%% compute_cost.m
%%
%% Computational Photography Assignment 1
%%
%% John Novatnack
%% jmn27@cs.drexel.edu
%%
%% Adapted from previous skeleton code by:
%%
%% 	Konstantinos Bitsakos
%% 	Department of Computer Science 
%% 	University of Maryland, College Park
%% 	kbits@cs.umd.edu
%%
%% Further reference on Intelligent Scissors:
%%	"Intelligent Scissors for Image Composition", E. Mortensen and W. Barret
%%	SIGGRAPH 1995.
%%
%%
%% Given a NxM image computes a NxMx8 matrix containing the cost of each of the
%% 8 links at each pixel.
%%
%% INPUT
%%	1) img		- N x M x 3 image
%% 
%% OUTPUT
%%	1) cost_matrix	- N x M x 8 cost matrix
%%
function [cost_matrix] = compute_cost(img)

  img = double(img);

  %%
  %% Create the kernels 
  %% 

  ker(:,:,1)= 0.25.*[0 1 1; 0 0 0; 0 -1 -1];
    
  ker(:,:,2)= 0.50.*[0 1 0; 0 0 -1; 0 0 0];

  ker(:,:,3)= 0.25.*[1 0 -1; 1 0 -1; 0 0 0];
    
  ker(:,:,4)= 0.50.*[0 1 0; -1 0 0; 0 0 0];
   
  ker(:,:,5)= 0.25.*[1 1 0; 0 0 0; -1 -1 0];
   
  ker(:,:,6)= 0.50.*[0 0 0; 1 0 0; 0 -1 0];
    
  ker(:,:,7)= 0.25.*[0 0 0; 1 0 -1; 1 0 -1];
    
  ker(:,:,8)= 0.50.*[0 0 0; 0 0 1; 0 -1 0];
    
  %%
  %% Compute the cost for the RGB bands
  %%
  %%

  filteredR1 = imfilter(img(:,:,1),ker(:,:,1));
  filteredR2 = imfilter(img(:,:,1),ker(:,:,2));
  filteredR3 = imfilter(img(:,:,1),ker(:,:,3));
  filteredR4 = imfilter(img(:,:,1),ker(:,:,4));
  filteredR5 = imfilter(img(:,:,1),ker(:,:,5));
  filteredR6 = imfilter(img(:,:,1),ker(:,:,6));
  filteredR7 = imfilter(img(:,:,1),ker(:,:,7));
  filteredR8 = imfilter(img(:,:,1),ker(:,:,8));
  
  filteredG1 = imfilter(img(:,:,2),ker(:,:,1));
  filteredG2 = imfilter(img(:,:,2),ker(:,:,2));
  filteredG3 = imfilter(img(:,:,2),ker(:,:,3));
  filteredG4 = imfilter(img(:,:,2),ker(:,:,4));
  filteredG5 = imfilter(img(:,:,2),ker(:,:,5));
  filteredG6 = imfilter(img(:,:,2),ker(:,:,6));
  filteredG7 = imfilter(img(:,:,2),ker(:,:,7));
  filteredG8 = imfilter(img(:,:,2),ker(:,:,8));
  
  filteredB1 = imfilter(img(:,:,3),ker(:,:,1));
  filteredB2 = imfilter(img(:,:,3),ker(:,:,2));
  filteredB3 = imfilter(img(:,:,3),ker(:,:,3));
  filteredB4 = imfilter(img(:,:,3),ker(:,:,4));
  filteredB5 = imfilter(img(:,:,3),ker(:,:,5));
  filteredB6 = imfilter(img(:,:,3),ker(:,:,6));
  filteredB7 = imfilter(img(:,:,3),ker(:,:,7));
  filteredB8 = imfilter(img(:,:,3),ker(:,:,8));

  %%
  %% cost_matrix is defined as the magnitude of the cost over the RGB bands
	%% and has negated and normalized with respect the maximum value
  %%

  cost_matrix(:,:,1) = 255-(sqrt(((filteredR1.*filteredR1)+(filteredG1.*filteredG1)+(filteredB1.*filteredB1))./3));
  cost_matrix(:,:,2) = 255-(sqrt(((filteredR2.*filteredR2)+(filteredG2.*filteredG2)+(filteredB2.*filteredB2))./3)).*sqrt(2);
  cost_matrix(:,:,3) = 255-(sqrt(((filteredR3.*filteredR3)+(filteredG3.*filteredG3)+(filteredB3.*filteredB3))./3));
  cost_matrix(:,:,4) = 255-(sqrt(((filteredR4.*filteredR4)+(filteredG4.*filteredG4)+(filteredB4.*filteredB4))./3)).*sqrt(2);
  cost_matrix(:,:,5) = 255-(sqrt(((filteredR5.*filteredR5)+(filteredG5.*filteredG5)+(filteredB5.*filteredB5))./3));
  cost_matrix(:,:,6) = 255-(sqrt(((filteredR6.*filteredR6)+(filteredG6.*filteredG6)+(filteredB6.*filteredB6))./3)).*sqrt(2);
  cost_matrix(:,:,7) = 255-(sqrt(((filteredR7.*filteredR7)+(filteredG7.*filteredG7)+(filteredB7.*filteredB7))./3));
  cost_matrix(:,:,8) = 255-(sqrt(((filteredR8.*filteredR8)+(filteredG8.*filteredG8)+(filteredB8.*filteredB8))./3)).*sqrt(2);
 