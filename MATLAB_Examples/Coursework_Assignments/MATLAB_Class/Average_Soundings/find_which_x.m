%  Function Name:        y_at_x
%  File Name:            y_at_x.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Function Description:
%   
%   This function returns which observation point (n) the X_s (observed altitudes) value 
%   is less than or equal to, but closest to the x (interpolated altitude) value selected 
%   in the loop in the t_at_alts function.
%   
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    04 Mar 2010  
%  Revised: 24 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890


function [n] = find_which_x(X_s,x);
  for which_n = 1:length(X_s);
    if (x < X_s(which_n));
      break;
    end % if
  end % for
  % Return the observation point that X_s is less than or equal to, but closest to, x
  n = which_n - 1;
end