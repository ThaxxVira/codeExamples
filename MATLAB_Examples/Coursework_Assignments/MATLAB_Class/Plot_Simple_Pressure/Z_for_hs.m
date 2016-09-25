%  Function Name:        Z_for_hs
%  File Name:            Z_for_hs.m
%  Functions Required:   MATLAB functions, Z_finite_diff
%-----------------------------------------------------------------------------------------
%  Program Description:  Calculates the altitude of pressure surfaces using the
%   barometric equation.
%   This calculation improves upon the altitude approximation from the function Zc
%   by using the barometric equation in the Z_finite_diff function.
%   
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    22 Apr 2010  
%  Revised: 13 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function [ alt_of_p_surface ] = Z_for_hs(central_pressure, ground_pressure_matrix)
    % Loop is set up according to array size
    [how_many_rows how_many_cols] = size(ground_pressure_matrix);
    for which_row = 1:how_many_rows
        for which_col = 1:how_many_cols
            % Calls Z_finite_diff function to ???
            alt_of_p_surface(which_row,which_col) = ...
            Z_finite_diff(central_pressure,ground_pressure_matrix(which_row,which_col));
        end % for
    end % for   
end
