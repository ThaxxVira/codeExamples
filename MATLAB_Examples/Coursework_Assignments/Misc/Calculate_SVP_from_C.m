%  Program Name:         Calculate_SVP_from_C
%  File Name:            Calculate_SVP_from_C.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Program Description:
%
%   This program will use the Clausius-Clapeyron equation to 
%   compute saturation vapor pressure (SVP) as a function of 
%   temperature for T = -20C to 45C.
%-----------------------------------------------------------------------------------------
%  Author:  Matthew Little
%  Date:    21 Feb 2011     
%  Revised: 7 Sep 2016 
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
% Reset any leftover graphics and variables
clf('reset');
clear;
% Initializing Temperature variable
  t = [-20:1:45];
  % Converting C to Kelvin
  t_k = t+273.15;

% Implementation of Clausius-Clapeyron equation for each value in array t
for i = 1:66
    if (t(i) < 0)
        e_s(i) = 6.11*exp((2.83*10^6/461.5)*((1/273.16)-(1/(t_k(i)))));
    elseif (t(i) >= 0) 
        e_s(i) = 6.11*exp((2.5*10^6/461.5)*((1/273.16)-(1/(t_k(i)))));
    end
end
% Create table of values for additional analysis
for j = 1:66
    table(j,1) = t(j);
    table(j,2) = e_s(j);
end
% Show table
table
% Show figure of calculated values
  plot(t,e_s)
  title('Saturation Vapor Pressure (hPa) vs. Temperature (C)');
  ylabel('Saturation Vapor Pressure (hPa)');
  xlabel('Temperature(C)');
% Show Legend
  legend('Saturation Vapor Pressure','Location','NorthWest');
  legend('boxoff');
