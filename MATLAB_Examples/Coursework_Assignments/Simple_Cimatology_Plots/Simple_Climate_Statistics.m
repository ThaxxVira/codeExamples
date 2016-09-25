%  Program Name:         Simple_Climate_Statistics
%  File Name:            Simple_Climate_Statistics.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Program Description:
%
%   Reads in simple climate data (climo_data.txt), plots the data, 
%   and does basic statistical analysis
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    25 Aug 2010
%  Revised: 7 Sep 2016     
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
% Reset any leftover graphics and variables
  clf('reset');
  clear;
% Read in data from file
data = csvread('climo_data.txt',1,0);
% Plot the data from the file
  figure(1)
  plot(data(:,1),data(:,2))
  title('Max Precip vs. Year, Plot 1')
  xlabel('Year')
  ylabel('Max Precip')
  legend('Maximum Precipitation');
  figure(2)
  plot(data(:,1),data(:,3))
  title('Max Temp vs. Year, Plot 2')
  xlabel('Year')
  ylabel('Max Temp')
  legend('Maximum Temperature');
  figure(3)
  plot(data(:,1),data(:,4))
  title('Min Temp vs. Year, Plot 3')
  xlabel('Year')
  ylabel('Min Temp')
  legend('Minimum Temperature');
% Initialize variables from data for statistical analysis - Mean
  precip_number = length(data(:,2));
  max_temp_number = length(data(:,3));
  min_temp_number = length(data(:,4));
% Initialize sum variables
  sum_precip = 0;
  sum_max_temp = 0;
  sum_min_temp = 0;
% Calculates the mean of the data
for n = 1:precip_number
    sum_precip = sum_precip + data(n,2);
end %for 'n'
mean_precip = sum_precip/precip_number
for n = 1:max_temp_number
    sum_max_temp = sum_max_temp + data(n,3);
end %for 'n'
mean_max_temp = sum_max_temp/max_temp_number
for n = 1:min_temp_number
    sum_min_temp = sum_min_temp + data(n,4);
end %for 'n'
mean_min_temp = sum_min_temp/min_temp_number
% Initialize variables from data for statistical analysis - Median
  precip_array = data(:,2);
  max_temp_array = data(:,3);
  min_temp_array = data(:,4);
  ordered_precip = sort(precip_array);
  ordered_max_temp = sort(max_temp_array);
  ordered_min_temp = sort(min_temp_array);
% Calculates median of the data
  if (rem(precip_number,2) == 0);
      precip_is_odd = 0;
  else;
      precip_is_odd = 1;
  end; %if
  if (precip_is_odd == 1);
      precip_median = precip_array(precip_number/2);
  else;
      precip_median = (ordered_precip(floor(precip_number/2)) + ordered_precip(floor(precip_number/2) + 1))/2;
  end; %if
  if (rem(max_temp_number,2) == 0);
      max_temp_is_odd = 0;
  else;
      min_temp_is_odd = 1;
  end; %if
  if (max_temp_is_odd == 1);
      max_temp_median = max_temp_array(max_temp_number/2);
  else;
      max_temp_median = (ordered_max_temp(floor(max_temp_number/2)) + ordered_max_temp(floor(max_temp_number/2) + 1))/2;
  end; %if
  if (rem(min_temp_number,2) == 0);
      min_temp_is_odd = 0;
  else; 
      min_temp_is_odd = 1;
  end; %if
  if (min_temp_is_odd == 1);
      min_temp_median = min_temp_array(min_temp_number/2);
  else;
      min_temp_median = (ordered_min_temp(floor(min_temp_number/2)) + ordered_min_temp(floor(min_temp_number/2) + 1))/2;
  end %if
% Initialize variables for statistical analysis - Standard Deviation and Z-Score
  precip_step_for_z = 0;
  max_temp_step_for_z = 0;
  min_temp_step_for_z = 0;
% Calculates the standard deviation and Z-score of data
  for n = 1:precip_number;
      precip_step_for_z = precip_step_for_z + (data(n,2) - mean_precip)^2;
  end; % for
  sd_precip = ((1/(precip_number - 1))*precip_step_for_z)^0.5;
  for n = 1:precip_number;
      precip_z_score = ((data(:,2) - mean_precip)/sd_precip);
  end; %for
  for n = 1:max_temp_number;
      max_temp_step_for_z = max_temp_step_for_z + (data(n,3) - mean_max_temp)^2;
  end; % for
  sd_max_temp = ((1/(max_temp_number - 1))*max_temp_step_for_z)^0.5;
  for n = 1:max_temp_number;
      max_temp_z_score = ((data(:,3) - mean_max_temp)/sd_max_temp);
  end; %for
  for n = 1:min_temp_number;
      min_temp_step_for_z = min_temp_step_for_z + (data(n,4) - mean_min_temp)^2;
  end; % for
  sd_min_temp = ((1/(min_temp_number - 1))*min_temp_step_for_z)^0.5;
  for n = 1:min_temp_number;
      min_temp_z_score = ((data(:,4) - mean_min_temp)/sd_min_temp);
  end; %for
% Print results of statistical analysis
  precip_median
  sd_precip
  precip_z_score
  max_temp_median
  sd_max_temp
  max_temp_z_score
  min_temp_median
  sd_min_temp
  min_temp_z_score
  
  
