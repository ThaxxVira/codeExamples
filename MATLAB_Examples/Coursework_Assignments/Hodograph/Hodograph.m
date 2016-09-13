%  Program Name:         Hodograph
%  File Name:            Hodograph.m
%  Functions Required:   MATLAB functions
%-----------------------------------------------------------------------------------------
%  Program Description:
%
%   This program will plot the winds as vactors in a polar orientation
%   Read in wind data from Lamont, OK on 26 may 2008 at 0800Z.
%   The figure generated is best viewed fullscreen.
%-----------------------------------------------------------------------------------------
%  Author:  Matthew Little
%  Date:    11 Apr 2011
%  Revised: 7 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
% Reset any leftover graphics and variables
clf('reset');
clear;
% Read in Hodograph data
data = dlmread('Hodo_data.txt');
% Define variables from data
  height = data(:,1);
  wdir = data(:,2);
  wspd = data(:,3);
  % Converting wind observations to vector format
    wdir = wdir + 90;
    wdir = -wdir;
    wdir_rad = wdir*(pi/180);
  % Conversion from knots to meters per second
    wspd_ms = wspd*0.514444444;
% Define [x,y] as if the winds were displayed on a Cartesian plane from the
% wind direction and magnitude
[x,y] = pol2cart(wdir_rad,wspd_ms);
x_wind_mean = mean(x) 
y_wind_mean = mean(y)
% Allows plot to be a reasonable scale, but make the data invisible,
% may be modified as needed if wind vectors are desired on figure
P = compass(x,y);
set(P,'Visible', 'off');
hold on;
u = x(30) - x(1);
v = y(30) - y(1);
% Plots estimated storm path using 0 - 6 km wind shear
path = quiver(x(1), y(1), u, v, 'r','MaxHeadSize',0.15,'LineWidth',3);
% Plots first entry in Hodo_data.txt file (about 0 km winds)
a = quiver(0,0, x(1), y(1),'b');
% Plots last entry in Hodo_data.txt file (about 6 km winds)
z = quiver(0,0, x(30), y(30),'b');
hodoMean = quiver(0,0,x_wind_mean, y_wind_mean,'--g','LineWidth',3);
% Creates the hodograph line from 0 km - 6 km
for i = 1:29
  hodoLine = quiver(x(i),y(i),x(i+1)-x(i),y(i+1)-y(i),'MaxHeadSize',0.1,'k','LineWidth',2);
end
% Figure annotations and styling
  text(-6.8,1.1, 'Sfc wind','Color','blue','FontSize',12,'FontWeight','bold');
  text(-1,-1, '6 km wind','Color','blue','FontSize',12,'FontWeight','bold');
  text(-2,22, '0 - 6 km Hodograph','Color','black','FontSize',12,'FontWeight','bold');
  annotation('line',[0.545,0.747],[0.558,0.666],'Color','red','LineWidth',2);
    text(33,12,'Red Arrow: 0 - 6 km Estimated Storm Path','Color','black','FontSize',14);
  annotation('line',[0.580,0.747],[0.610,0.700],'Color','green','LineWidth',2);
    text(33,15,'Green Dotted Arrow: 0 - 6 km Mean Wind','Color','black','FontSize',14);
hold off;
title({'Lamont, OK, 0800Z 26 May 2008','0 - 6 km Hodograph (m/s)'},'FontSize',20);