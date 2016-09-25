%  Function Name:        p_at_d
%  File Name:            p_at_d.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Program Description:
%   Calculates the pressure at ground level of all points in matrix in a simulated 
%   low pressure area (LPA) using a simple linear formula.  Units:  hPa.
%   
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    22 Apr 2010  
%  Revised: 7 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function p = p_at_d(d,center_p,outer_p,radius)
    % Calculates the pressure change per unit distance.  Units:  hPa/km
    p_change = (outer_p - center_p)./(radius);
    % Calculates pressure of all points at a given distance in the matrix.  Units:  hPa
    p = (p_change).*(d) + center_p;

end
