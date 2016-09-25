%  Program Name:         Low_Pressure_Area_Main
%  File Name:            Low_Pressure_Area_Main.m
%  Functions Required:   MATLAB functions, finite_diff_press, low_pressure_area,
%                        p_at_d, Z_finite_diff, Z_for_hs, Zc
%-----------------------------------------------------------------------------------------
%  Program Description:
%
%   This program utilized several functions to simulate a very simple 
%   low pressure area (LPA).
%   A finite differencing function is used for educational purposes. MATLAB includes 
%   more sophisticated techniques than the one employed in the Z_finite_diff function.
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    22 Apr 2010  
%  Revised: 7 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

% Reset any leftover graphics and variables
  clf('reset');
  clear;
% Set initial conditions for LPA simulation
    size = 300;        % Matrix size simulating LPA, unitless.  Default 300
    % Radius determined based on matrix size to be consistent with units
    radius = size/2;   % Units:  km
    % Specifies LPA center pressure and outer pressure.
    center_p = 972;    % Units:  hPa.  Default 972
    outer_p = 1012;    % Units:  hPa.  Default 1012
% Calls function to simulate the LPA surface pressure
  LPA_pressure_matrix = low_pressure_area(size,radius,center_p,outer_p);
% Plots the LPA surface pressure on a contour figure with a colorbar to denote pressure
  plevels = [800:5:1100];
  clabel(contour(LPA_pressure_matrix, plevels),'FontSize',15,'labelspacing',1000);
  a = colorbar;
  ylabel(a,'Pressure (hPa)','FontSize',20);
  xlabel('Distance, West to East (km)','FontSize',20);
  ylabel('Distance, South to North (km)','FontSize',20);
  title({'Simulated Areal Surface Pressure, Top-Down View', ...
    'As Calculated Using Simple Linear Interpolation'},'FontSize',20);
% Sets the pressure level of interest for use in the following function
  desired_p = 972; % Units:  hPa.  Default 972 (Same as center_p for comparison)
% Calls function to calculate altitudes of pressure level of interest across
% the entire LPA using simple linear interpolation
  Z_center_pressure = Zc(desired_p,LPA_pressure_matrix);
% Plots altitude of desired pressure level surface
  figure;
  Zlevels = [0:50:700];
  clabel(contour(Z_center_pressure, Zlevels),'FontSize',15,'labelspacing',1000);
  b = colorbar;
  ylabel(b,'Altitude (m)','FontSize',20);
  caxis([0,450]);
  xlabel('Distance, West to East (km)','FontSize',20);
  ylabel('Distance, South to North (km)','FontSize',20);
  pressure_str = sprintf('Altitudes of the %d hPa Pressure Level, Top-Down View',...
    desired_p);
  title({pressure_str,'As Calculated Using Simple Linear Interpolation'},'FontSize',20);
  
% Calls function to plot altitude of pressure surfaces, as calculated by the 
% barometric formula, an improvement in accuracy compared to the previous figure.
surface_hs = Z_for_hs(center_p, LPA_pressure_matrix);
% Plots altitude of desired pressure level surface using the barometric formula
  figure;
  clabel(contour(surface_hs, Zlevels),'FontSize',15,'labelspacing',1000);
  b = colorbar;
  ylabel(b,'Altitude (m)','FontSize',20);
  caxis([0,450]);
  xlabel('Distance, West to East (km)','FontSize',20);
  ylabel('Distance, South to North (km)','FontSize',20);
  Baro_str = sprintf ...
  ('Altitudes of the Central (%d hPa) Pressure Level, Top-Down View', ... 
    center_p);
  title({Baro_str,'As Calculated Using the Barometric Equation'},'FontSize',20);
