%  Program Name:         C_to_F_Main
%  File Name:            C_to_F_Main.m
%  Functions Required:   MATLAB functions, C_to_F
%-----------------------------------------------------------------------------------------
%  Program Description:
%
%   This program computes the trivial conversion of temperatures in Celsius to 
%   temperatures in Farenheight.  The conversion between specified temperature bounds is
%   then plotted.  The endpoints of the line in the plot are circled for clarity
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    11 Mar 2010  
%  Revised: 26 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

% Reset any leftover graphics and variables
  clf('reset'); 
  clear;
% Specifies the temperatures in Celsius in an array
  t_start = 0;
  t_end = 20;
  incerment = 0.1
  C_temps = t_start:incerment:t_end;
% Calls the C_to_F function to perform the conversion between Celsius to Farenheight
F_temps = C_to_F(C_temps);
% Plot the converted temperatures
  plot(C_temps,F_temps,'b','LineWidth',2)
  title({'Conversion Between Temperature','Celsius to Farenheight'}, ...
  'FontSize',24)
  xlabel('Temperature (C)','FontSize',20)
  ylabel('Temperature (F)','FontSize',20)
  axis([t_start-2 t_end+2 min(F_temps)-2 max(F_temps)+2])
  legend('Temperature Conversion (C to F)', 'Location','northwest')
  hold on
  plot(t_start,min(F_temps),'or','MarkerSize',10)
  hold on
  plot(t_end,max(F_temps),'or','MarkerSize',10)
  grid on;
