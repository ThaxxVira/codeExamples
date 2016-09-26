%  Function Name:        C_to_F
%  File Name:            C_to_F.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Function Description:
%
%   This function accepts values for temperature in degrees Celsius, and converts them to
%   degrees Farenhight using a simple formula.
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    25 Feb 2010  
%  Revised: 26 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function T_f = C_to_F(T_c)
  T_f = (9./5.)*T_c + 32.;
end