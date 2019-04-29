%{
Scanner.m
Scans given file and corrects the contents to be useful to the
rest of the program

Author: Ryan Farrow
Date: 15 Feb 19
%}

clear;
clc;

% opts = detectImportOptions('NBA Player Statistics.txt');

%{
"dataTable" needs to be saved as a .mat file to make access of player
attributes easier
%}

dataTable = readtable("NBA Player Statistics.txt");

%% TODO
% figure out how to get rid of rows in the table
    
%% changes improperly formatted parts of the data file

for i = 1:size(dataTable,1)
    temp = dataTable.Player{i};
    for j = 1:length(temp)
        if temp(j) == '\'
            temp = temp(1:j-1);
            break
        end
    end
    % temp = char(temp);
    dataTable.Player(i) = cellstr(temp);
end

index = size(dataTable,1);
i=1;
while i < index-1
    disp(dataTable.Player{i});
    disp(dataTable.Player{i+1});
    disp(num2str(i));
    disp(num2str(index));
    disp(' ');
    if strcmp(dataTable.Player{i},dataTable.Player{i+1})
%         if i == index-2
%             dataTable(i+1,:) = [];
%             dataTable(i+2,:) = [];
%             break
%         end
        dataTable(i+1,:) = [];
        i=i-1; %#ok<*FXSET>
        index = index-1;
        %disp(num2str(i));
    end
    i=i+1;
end

% disp(data(1,2));

index = 0;
    
% for i = 1:size(data,1)
%     if data.FGA(i) - data.x3PA(i) > max
%         max = data.FGA(i) - data.x3PA(i);
%         index = i;
%     end
% end
% 
% disp(['Top FGA: ',max,' by ',data.Player(index)]);

% disp(max(dataTable.MP));

%% saves table as .mat file
save('PlayerStats.mat','dataTable');

% TODO:
%{

- create ability in GUI to search table for players
- create Player object for a particular player once that player is selected
  in the draft
  > assignments of variables must be done with games played and minutes
    played in mind
- create methods that will summon player's stats for a given game
  > must compare certain aspects of a player's game to those of other
    players on the same team as well as defense strats to determine
    who will end up doing well and who won't
- create algorithm for coaches who will help draft, come up with game plans
  > At least three - maybe Gregg Popovich, Mike Brey, and John Wooden
  > Amount of shots taken, player minutes, etc. will be partly determined
  > by coach
- decide: round robin or brackets to decide champion?
- provide ability to choose a game plan either at the start of every game
  or the start of every half
- weight shots taken and fouls committed by average minutes played per game
- run play-by-play, compile results at the end

>>Add as things come to mind

%}