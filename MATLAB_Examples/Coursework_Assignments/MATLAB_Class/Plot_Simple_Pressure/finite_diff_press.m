%  Function Name:        finite_diff_press
%  File Name:            finite_diff_press.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Program Description:
%   Calculates pressure at an altitude using the barometric formula
%   assuming hydrostatic atmosphere and idael gas law holds.
%   This improves upon the pressure approximation from the function p_at_d.
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew Little
%  Date:    22 Apr 2010  
%  Revised: 13 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function P_fd=finite_diff_press(P0,alt0,alt1,T0,T1)
    %  Hydrostatic pressure at small change in Z
    % Molar mass of Earth's air (kg/mol)
    M = 28.9644/1000.0; 
    % Acceleration due to gravity (m/(s^2))
    g = 9.80665;  
    % Universal gas constant (J/(K*mol))
    R = 8.31432;
    % Convert C to Kelvin
    TK0 = T0 + 273.15; 
    % Convert C to Kelvin
    TK1 = T1 + 273.15;
    % Calculate change in pressure per step.  Units:  hPa
    P_fd = P0 - P0*M*g*(alt1-alt0)/(R*((TK0+TK1)/2));
end