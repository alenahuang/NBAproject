%{
draft.m
Function used to draft a player

INPUT:
i = Index of player as given from the GUI

OUTPUT:
obj = Object of Player class that the rest of the program can use

Author: Ryan Farrow
Date: 2 Apr 2019
%}

function obj = draft(i,strat)
    dataTable = load("PlayerStats.mat");
    % NOTE: 'i' is the player's index in the table
    % 'data' is a currently unknown piece of data passed to the function

    obj = Player(dataTable.dataTable{i,1},dataTable.dataTable{i,3},dataTable.dataTable{i,17},dataTable.dataTable{i,16}, ...
                 dataTable.dataTable{i,14},dataTable.dataTable{i,13},dataTable.dataTable{i,21},dataTable.dataTable{i,22}, ...
                 dataTable.dataTable{i,23},dataTable.dataTable{i,25},dataTable.dataTable{i,26},dataTable.dataTable{i,27}, ...
                 dataTable.dataTable{i,28},dataTable.dataTable{i,29},dataTable.dataTable{i,6},dataTable.dataTable{i,8}, ...
                 dataTable.dataTable{i,7},strat);
end