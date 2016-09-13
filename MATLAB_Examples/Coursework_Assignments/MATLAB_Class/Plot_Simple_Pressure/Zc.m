%  Function Name:        Zc
%  File Name:            Zc.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Program Description:
%   Calculates the altitude of desired pressure level surface in a given 
%   low pressure area (LPA).  Outputs the altitude of pressure surfaces: 
%   altitude_of_p_surface, Units:  m.
%   
%-----------------------------------------------------------------------------------------
%  Author:  Matthew Little
%  Date:    22 Apr 2010  
%  Revised: 8 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function [ altitude_of_p_surface ] = Zc(desired_pressure_surface, ground_pressure_matrix)
    % Calculates the altitude of the pressure level surfaces.
    % The factor:  (300 m)/(35 hPa) is the approximate conversion 
    % from pressure to altitude on small scales.
    altitude_of_p_surface = (300/35)*(ground_pressure_matrix - desired_pressure_surface);
end