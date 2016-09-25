%  Function Name:        low_pressure_area
%  File Name:            low_pressure_area.m
%  Functions Required:   MATLAB functions, p_at_d
%-----------------------------------------------------------------------------------------
%  Function Description:
%
%   This function sets up an array simulating a low pressure area (LPA).
%   It calculates the distance between points in the matrix simulating the LPA 
%   in units:  km.
%   It passes these calculated parameters to the function:  p_at_d.
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    22 Apr 2010  
%  Revised: 7 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function [ low_pressure_area_out ] = low_pressure_area(size,radius,center_p,outer_p)
   % Defines how to find the center of a matrix
   center = (size+1)./2;
   % Creates a matrix of distances from the center of an array
   for AR=1:size
       for AC=1:size
           % Simple distance formula for finding the distance from the center 
            unit_distance(AR,AC) = (((AR-center)^2) + ((AC-center)^2))^(1./2);
       end %for
   end %for
   % Defines the scale (km/matrix unit)
   scale = radius./(size-center);
   % Calculates the distance of all points in matrix from the center.  Units:  km
   distance_from_center = scale.*unit_distance;
   % Calls p_at_d function to calculate pressure of all points at a given 
   % distance in the matrix using a simple linear formula
   low_pressure_area_out = p_at_d(distance_from_center,center_p,outer_p,radius);
end
