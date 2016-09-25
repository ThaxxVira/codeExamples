%  Function Name:        Z_for_finite_diff
%  File Name:            Z_for_finite_diff.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Program Description:
%   Uses the isobaric surface at pressure (p_c) and surface pressure matrix (p_g) of the 
%   low pressure area (LPA), and altitude parameters defined in function, 
%   to calculate the pressure in the LPA using the more accurate barometric formula
%   by utilizing finite differencing.
%   This improves upon the linear pressure approximation used in the function p_at_d.
%   
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    22 Apr 2010  
%  Revised: 13 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

function Z_fd = Z_finite_diff(p_c, p_g)
    % Initialize variables  
      % Steps used to approzimate integration process. Unitless
      steps = 100;
      % Set altitude to start process.  Units:  m
      alt_start = 0;
      % Sets starting altitude used in integration process to value.  Units:  m
      alt0 = alt_start;
      % Maximum altitude.  Units:  m
      max_alt = 3000;
      % Finds the change in altitude per step.  Units:  m/step
      delta_z = (max_alt-alt0)/steps;
      % Starting temperature (taken at surface).  Units:  deg C
      t0 = 15;
      % Starting pressure value matrix.  Units: hPa
      p0 = p_g;
      % Lapse rate.  Units:  (dec C)/km
      P_lapse = 6.49;

    for i = 1:steps
      % Calculates temperature change per step.  Units:  (deg C)/step
      t1 = t0 - P_lapse * delta_z / 1000.0;
      % Calculates the change in the altitude for the step. Units:  m
      alt1 = alt0+delta_z;
      % Calls finite_diff_press function using defined parameters 
      % to calculate the pressure at the altitude using the barometric formula
      press = finite_diff_press(p0, alt0, alt1, t0, t1);
      % Check to see if pressure returned by  finite_diff_press function 
      % is less than central pressure of the LPA
      if(press < p_c), 
        break; 
      end; % if
      % New values for loop:
        % Sets new temperature to previous temperature
        t0 = t1 ;
        % Sets new pressure to previous pressure
        p0 = press;
        % Sets new altitude to previous altitude
        alt0 = alt1;
    end;
    Z_fd = alt_start+(i-1)*delta_z-delta_z*(p_c-press)/press;
end
