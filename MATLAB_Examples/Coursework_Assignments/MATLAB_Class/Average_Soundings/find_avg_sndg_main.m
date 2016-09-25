%  Program Name:         find_avg_sndg_main
%  File Name:            find_avg_sndg_main.m
%  Functions Required:   MATLAB functions, read_a_sounding, t_at_alts, y_at_x,
%                        find_which_x
%-----------------------------------------------------------------------------------------
%  Program Description:
%
%   This program averages data from three soundings, interpolates temperature data,
%   and gives plots of the temperature data, interpolated temperature data, and 
%   averaged interpolated data (so altitudes may be common from all soundings and
%   such averages may be calculated).
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    11 Mar 2010  
%  Revised: 24 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

% Reset any leftover graphics and variables
  clf(1,'reset'); 
  clf(2,'reset'); 
  clf(3,'reset'); 
  clf(4,'reset'); 
  clf(5,'reset'); 
  clf(6,'reset'); 
  clf(7,'reset'); 
  clear;
% Calls function read_a_sounding to read 3 soundings
% Default station is KOAK on dates: 9 Mar 2010, 10 Mar 2010, and 11 Mar 2010
  sndg09 = read_a_sounding('koak_09_03_10_12z.htm');
  sndg10 = read_a_sounding('koak_10_03_10_12z.htm');
  sndg11 = read_a_sounding('koak_11_03_10_12z.htm');
% Creates variables containing altitude and temperature data read from files
  alts09 = sndg09(:,2)';
  alts10 = sndg10(:,2)';
  alts11 = sndg11(:,2)';
  temps09 = sndg09(:,3)';
  temps10 = sndg10(:,3)';
  temps11 = sndg11(:,3)';
% Plot the raw temperature vs altitude data from the files
  figure(1)
  plot(temps09,alts09)
  title({'Station: KOAK', 'Date: 9 Mar 2010, 12z Observation','Raw Data'},'FontSize',24)
  xlabel('Temperature (C)','FontSize',20)
  ylabel('Altitude (m)','FontSize',20)
  legend('Altitude (m)');
  hold on;
  grid on;
  figure(2)
  plot(temps10,alts10)
  title({'Station: KOAK', 'Date: 10 Mar 2010, 12z Observation','Raw Data'},'FontSize',24)
  xlabel('Temperature (C)','FontSize',20)
  ylabel('Altitude (m)','FontSize',20)
  legend('Altitude (m)');
  hold on;
  grid on;
  figure(3)
  plot(temps11,alts11)
  title({'Station: KOAK', 'Date: 11 Mar 2010, 12z Observation','Raw Data'},'FontSize',24)
  xlabel('Temperature (C)','FontSize',20)
  ylabel('Altitude (m)','FontSize',20)
  legend('Altitude (m)');
  hold on;
  grid on;
% Creates altitude values at which to perform interpolation
% These values may be changed as desired
  std_alts = 10:10:35000;
% calls the t_at_alts function to interpolate temperature between data points
t_s09 = t_at_alts(std_alts,alts09,temps09);
t_s10 = t_at_alts(std_alts,alts10,temps10);
t_s11 = t_at_alts(std_alts,alts11,temps11);
% Plot the raw temperature vs altitude data from the files
  figure(4)
  plot(t_s09,std_alts)
  title({'Station: KOAK', 'Date: 9 Mar 2010, 12z Observation','Interpolated Data'}, ...
  'FontSize',24)
  xlabel('Temperature (C)','FontSize',20)
  ylabel('Altitude (m)','FontSize',20)
  legend('Altitude (m)');
  hold on;
  grid on;
  figure(5)
  plot(t_s10,std_alts)
  title({'Station: KOAK', 'Date: 10 Mar 2010, 12z  Observation','Interpolated Data'}, ...
  'FontSize',24)
  xlabel('Temperature (C)','FontSize',20)
  ylabel('Altitude (m)','FontSize',20)
  legend('Altitude (m)');
  hold on;
  grid on;
  figure(6)
  plot(t_s11,std_alts)
  title({'Station: KOAK', 'Date: 11 Mar 2010, 12z  Observation','Interpolated Data'}, ...
  'FontSize',24)
  xlabel('Temperature (C)','FontSize',20)
  ylabel('Altitude (m)','FontSize',20)
  legend('Altitude (m)');
  hold on;
  grid on;
% Calculate the average of the 3 temperature interpolations
  avg_t = (t_s09 + t_s10 + t_s11)/3;
% Plot the averaged temperatures vs altitude
  figure(7)
  plot(avg_t,std_alts)
  title({'Station: KOAK', 'Date: 11 Mar 2010 - 13 Mar 2010, 12z Observations', ...
  'Interpolated Data Averaged'},'FontSize',24)
  xlabel('Temperature (C)','FontSize',20)
  ylabel('Altitude (m)','FontSize',20)
  legend('Altitude (m)');
  hold on;
  grid on;