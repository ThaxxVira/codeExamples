%  Function Name:        is_digit
%  File Name:            is_digit.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Function Description:
%
%   This function determines if a character is a digit.
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew Little
%  Date:    15 Apr 2010  
%  Revised: 18 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function [ isd ] = is_digit( a_char )
    isd = 0;
    if (a_char >= '0');
        if(a_char <= '9');
            isd = 1;
        end % if
    end %if
end
