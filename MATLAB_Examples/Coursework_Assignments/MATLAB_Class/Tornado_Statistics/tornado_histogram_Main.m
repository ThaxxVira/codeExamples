%  Program Name:         tornado_histogram_Main
%  File Name:            tornado_histogram_Main.m
%  Functions Required:   MATLAB functions, is_digit
%-----------------------------------------------------------------------------------------
%  Program Description:
%
%   This program reads in tornado data from a file, extracts necessary data,
%   and plots a histogram of frequency vs. hour of day.
%
%-----------------------------------------------------------------------------------------
%  Author:  Matthew B. Little
%  Date:    15 Apr 2010  
%  Revised: 18 Sep 2016       
%-----------------------------------------------------------------------------------------
%        1         2         3         4         5         6         7         8         9
%23456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

% Reset any leftover graphics and variables
  clf('reset');
  clear;
% Opens the file; Default is 2008_tornadoes.txt, included in directory
fin = fopen('2008_tornadoes.txt','r');
% Initialize tornadoes array
tornadoes = [];
% Defined a_line so that the while loop will fun at least once
a_line = 0;
% Loops through the lines in the file until end-of-file marker encountered
while ~feof(fin);
    % Get the line to analyze
    a_line = fgetl(fin);
    % Cycle loop iteration if the line contains no characters
    if(isempty(a_line)); 
        continue; 
    end; 
    % Find if special characters exist
    blanks = find(a_line==' ');
    stars = find(a_line=='*');
    slashes = find(a_line=='/');
    % Lines with stars contain state information, extract state only
    if (isempty(stars) == 0);
        state = a_line((stars(1)+1):(stars(2)-1));
        a_t.state = state;
    end; %if
    % Lines with numbers and no slashes contain town information, 
    % extract town only with help from is_digit function
    if((is_digit(a_line(1))) && (isempty(slashes)));
        a_t.town = char(sscanf(a_line,'%*d %50c',[1 50]));
        a_t.town = a_line((blanks(1)+1):length(a_line));
    end; %if
    % Lines with slashes contain date information, extract date only
    if (isempty(slashes) == 0);
        a_t.no=sscanf(a_line, '%d');
        details = sscanf(a_line,'%d/%d/%d %d:%d %*2s Tornado F%d',[1 6]); % where is this used?
        a_t.month = details(1);
        a_t.year = details(3);
        a_t.year = details(2);
        a_t.hour = details(4);
        tornadoes = [tornadoes a_t];
    end; %if
end; %while
% Creates historgram from data
hist([tornadoes(:).hour],0:24);
    title({'Tornado Frequency in Contiguous USA','by Hour of Day, 2008'},'FontSize',24);
    ylabel('Number of Tornadoes','FontSize',20);
    xlabel('Hour of Day (Local Time Zone)','FontSize',20);
    set(gca,'YTick',[0:5:100],'XTick',[0:23]);
    ylim([0 85]);
    xlim([-0.5 23.5]);
    grid on;
fclose(fin);
