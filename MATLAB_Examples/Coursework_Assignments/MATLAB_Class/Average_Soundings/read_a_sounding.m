%  Function Name:        read_a_sounding
%  File Name:            read_a_sounding.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Function Description:
%
%   This function will read a sounding, skipping lines with missing data in the file.
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    25 Feb 2010  
%  Revised: 24 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function [ a_sounding ] = read_a_sounding(sounding_fname);
  % Initialize variables
  good_cols = 0;
  good_lines = 0;
  bad_lines = 0;
  % Opens the file called in the argument of the function
  fin = fopen(sounding_fname,'r');
    % Loops through the lines in the file until end-of-file marker encountered
    while ~feof(fin);
      % Get the line to analyze
      a_line = fgetl(fin);
      % Read in 11 floats maximum to variable a_row from a_line
      % n counts the number of floats read correctly
      % a_row is output from successfully read values
      [a_row,n] = sscanf(a_line,'%f %f %f %f %f %f %f %f %f %f %f', [1,11]);
      % Check to see if all values are present in a_row using n
      if (n == 11);
        good_lines = good_lines + 1;
        % Add the row of good data to the array
        a_sounding(good_lines,:) = a_row;
      % If not all values are present in a_row, the row is not added
      else;
        bad_lines = bad_lines + 1;
      end; %if 
      % bad_lines counter used to detect about when end of radiosonde data occurs in file
      if  (bad_lines >= 20); 
        break; 
      end; %if
    end; %while
    altitude = a_sounding(:,2);
    temperature = a_sounding(:,3);
end
