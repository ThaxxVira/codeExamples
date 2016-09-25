%  Function Name:        y_at_x
%  File Name:            y_at_x.m
%  Functions Required:   MATLAB functions, find_which_x
%-----------------------------------------------------------------------------------------
%  Function Description:
%
%   This function accepts arrays of data and calls the find_which_x function 
%   and then calculates a linear interpolation at a given x
%   
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    04 Mar 2010  
%  Revised: 24 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function [y]= y_at_x(X_s,Y_s,x);
  % Calls the function find_which_x to find the nearest, lowest observation point (n)
  n = find_which_x(X_s,x);
  y = ((Y_s(n+1)-Y_s(n))/(X_s(n+1)-X_s(n)))*(x-X_s(n)) + Y_s(n);
end
