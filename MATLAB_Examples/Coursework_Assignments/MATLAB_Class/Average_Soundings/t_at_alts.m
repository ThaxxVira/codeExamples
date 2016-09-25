%  Function Name:        t_at_alts
%  File Name:            t_at_alts.m
%  Functions Required:   MATLAB functions, y_at_x, find_which_x
%-----------------------------------------------------------------------------------------
%  Function Description:
%
%   This function accepts a generated array of altitudes used for interpolation, 
%   an altitude data array, and a temperature data array.  It calls the function 
%   y_at_x to help calculate the interpolated temperature.
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    25 Feb 2010  
%  Revised: 24 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function [ t_s ] = t_at_alts(std_alts,alts,temps);
  for i=1:length(std_alts);
    t_s(i) = y_at_x(alts,temps,std_alts(i));
  end %for
end
