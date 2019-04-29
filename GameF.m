% convert to function GameF(p1Index,p2Index,...)
function [team1Stats, team2Stats] = GameF(p1Index, p2Index, p3Index, p4Index, p5Index, p6Index, p7Index, p8Index, p9Index, p10Index,...
                                          p1Strat, p2Strat, p3Strat, p4Strat, p5Strat, p6Strat, p7Strat, p8Strat, p9Strat, p10Strat)

% convert to function GameF(p1Index,p2Index,...)


%{
Game.m
Describes how a game is simulated, putting together multiple functions and
introducing variation and shot percentage

Author: Ryan Farrow
Date: 4 Apr 2019
%}

% Format for creating player objects in the NBAGUI.m
% finalizeButton_Callback function:
% p1 = draft(handles.playersList1.Value);
% p2 = draft(handles.playersList2.Value);
% handles.playersList1.Value


p1 = draft(p1Index,p1Strat);
p2 = draft(p2Index,p2Strat);
p3 = draft(p3Index,p3Strat);
p4 = draft(p4Index,p4Strat);
p5 = draft(p5Index,p5Strat);

p6 = draft(p6Index,p6Strat);
p7 = draft(p7Index,p7Strat);
p8 = draft(p8Index,p8Strat);
p9 = draft(p9Index,p9Strat);
p10 = draft(p10Index,p10Strat);


%% import player objects and set teams as arrays
% it is imperative that the team players make it to their respective team
% array or everything will go poorly

% somewhere in NBAGUI.m, most likely under each "playersList_Callback"
% function or maybe the finalize callback, the draft.m function will be
% used to create the objects and they will then be saved in the same block
% of code to be loaded here and then put into the team arrays

team1 = [p1,p2,p3,p4,p5];
team2 = [p6,p7,p8,p9,p10];

%% constants to be used when placing numbers in each player's stat line
% for example, if player 1 is determined by the program to have committed
% a turnover, the syntax will be:
% p1Stats(TOV) = p1Stats(TOV)+1;
% this way, we don't have to guess what the index is every time and risk
% messing it up

TWO_MADE = 1;       % two-point shots made
TWO_ATT = 2;        % two-point shots attempted
THREE_MADE = 3;     % three-point shots made
THREE_ATT = 4;      % three-point shots attempted
FT_MADE = 5;        % free throws made
FT_ATT = 6;         % free throws attempted
OREB = 7;           % offensive rebounds
DREB = 8;           % defensive rebounds
AST = 9;            % assists
STL = 10;           % steals
BLK = 11;           % blocks
TOV = 12;           % turnovers
FLS = 13;           % fouls
PTS = 14;           % points

%% a giant stat line for each player
% these correspond to each player's number
% p1's stats go into p1Stats, etc

p1Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
p2Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
p3Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
p4Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
p5Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
p6Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
p7Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
p8Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
p9Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];
p10Stats = [0 0 0 0 0 0 0 0 0 0 0 0 0 0];

%% determine how many possessions will occur
% assume an average of 104 possessions occur across all NBA regular season games
% standard deviation is approx 2; therefore, generate random int between 1
% and 5 and add to 101 to get something within an area of feasability
% source: teamrankings.com, accessed 4 Apr 2019

possVar = randi(5);
% multiply by 2 to account for both teams
POSS = (101 + possVar)*2;

% teamNum = number (1 or 2) of team playing the given possession
% corresponds to one five-man group or the other
teamNum = 1;

% there is an average of about 14 turnovers per game varying by about 1
% therefore, add toVar (variation value) to 12 to get expected amount
% of turnovers per team per game
% then divide by POSS to get a probability of turnover per play
% source: teamrankings.com, accessed 4 Apr 2019

toVar = randi(3);
TO_PROB = (12 + toVar)/POSS;

%% run game simulation
% conducted within a for loop

% this loop is meant to represent one play and therefore accounts for
% anything that could happen in an NBA play

for play = 1:POSS
    %% 1. determine which team's play this is
    if mod(play,2) == 0
        teamNum = 2;
    else
        teamNum = 1;
    end
    
    %% 2. check if this play is a turnover
    % get help on this, it looks pretty atrocious
    PLAY_IS_TOV = false;
    PLAY_IS_STL = false;
    PLAY_IS_FL  = false;
    
    randDec = rand;
    if randDec <= TO_PROB
        % 2a. determine who committed the turnover
        % (team_TO = team_TO+1;)
        PLAY_IS_TOV = true;
        if teamNum == 1
            switch propComp_TOV(p1,p2,p3,p4,p5)
                case 1
                    p1Stats(TOV) = p1Stats(TOV)+1;
                case 2
                    p2Stats(TOV) = p2Stats(TOV)+1;
                case 3
                    p3Stats(TOV) = p3Stats(TOV)+1;
                case 4
                    p4Stats(TOV) = p4Stats(TOV)+1;
                case 5
                    p5Stats(TOV) = p5Stats(TOV)+1;
            end
        elseif teamNum == 2
            switch propComp_TOV(p6,p7,p8,p9,p10)
                case 1
                    p6Stats(TOV) = p6Stats(TOV)+1;
                case 2
                    p7Stats(TOV) = p7Stats(TOV)+1;
                case 3
                    p8Stats(TOV) = p8Stats(TOV)+1;
                case 4
                    p9Stats(TOV) = p9Stats(TOV)+1;
                case 5
                    p10Stats(TOV) = p10Stats(TOV)+1;
            end
        end
    end
    
    % 2b. determine if this turnover is a steal by the other team
    % to do this, we will compare one team's assist propensity with the
    % other's steal propensity
    %   divide stealing team's steal prop sum by opposing team's assist
    %   prop sum and multiply result into probability calculation
    
    randDec = rand;
    if PLAY_IS_TOV
        if teamNum == 1
            team1TOV = playerTOV(p1) + playerTOV(p2) + playerTOV(p3) + playerTOV(p4) + playerTOV(p5);
            team2Stl = playerStl(p6) + playerStl(p7) + playerStl(p8) + playerStl(p9) + playerStl(p10);
            
            % on average, 7.62 steals occur per game
            if randDec*(team1TOV/team2Stl) <= (7.62/POSS)
                PLAY_IS_STL = true;
                
                % 2b-1. if so, determine which player makes the steal
                switch propComp_Stl(p6,p7,p8,p9,p10)
                    case 1
                        p6Stats(STL) = p6Stats(STL)+1;
                    case 2
                        p7Stats(STL) = p7Stats(STL)+1;
                    case 3
                        p8Stats(STL) = p8Stats(STL)+1;
                    case 4
                        p9Stats(STL) = p9Stats(STL)+1;
                    case 5
                        p10Stats(STL) = p10Stats(STL)+1;
                end
            end
        elseif teamNum == 2
            team1Stl = playerStl(p1) + playerStl(p2) + playerStl(p3) + playerStl(p4) + playerStl(p5);
            team2TOV = playerTOV(p6) + playerTOV(p7) + playerTOV(p8) + playerTOV(p9) + playerTOV(p10);
            
            if randDec*(team2TOV/team1Stl) <= (7.62/POSS)
                PLAY_IS_STL = true;
                
                % 2b-1. if so, determine which player makes the steal
                switch propComp_Stl(p1,p2,p3,p4,p5)
                    case 1
                        p1Stats(STL) = p1Stats(STL)+1;
                    case 2
                        p2Stats(STL) = p2Stats(STL)+1;
                    case 3
                        p3Stats(STL) = p3Stats(STL)+1;
                    case 4
                        p4Stats(STL) = p4Stats(STL)+1;
                    case 5
                        p5Stats(STL) = p5Stats(STL)+1;
                end
            end
        end
    end
    
    % 2c. determine if this turnover is an offensive foul
    % check average offensive fouls committed per game
    % offensive fouls occur on approx. 1.83% of plays
    
    randDec = rand;
    if PLAY_IS_TOV && PLAY_IS_STL == false
        if teamNum == 1
            team1Fls = playerFls(p1) + playerFls(p2) + playerFls(p3) + playerFls(p4) + playerFls(p5);
            % dividing by 250 because a team with completely average foul
            % propensity values, as judged by the set of players in this
            % simulation, would have a sum of 250 and thus even out to a 1x
            % multiplier
            if randDec*250/team1Fls <= .0183
                PLAY_IS_FL = true;
                
                % 2c-1. if so, determine which player commits it
                switch propComp_Fls(p1,p2,p3,p4,p5)
                    case 1
                        p1Stats(FLS) = p1Stats(FLS)+1;
                    case 2
                        p2Stats(FLS) = p2Stats(FLS)+1;
                    case 3
                        p3Stats(FLS) = p3Stats(FLS)+1;
                    case 4
                        p4Stats(FLS) = p4Stats(FLS)+1;
                    case 5
                        p5Stats(FLS) = p5Stats(FLS)+1;
                end
            end
            
        elseif teamNum == 2
            team2Fls = playerFls(p6) + playerFls(p7) + playerFls(p8) + playerFls(p9) + playerFls(p10);
            
            if randDec*250/team2Fls <= .0183
                PLAY_IS_FL = true;
                
                % 2c-1. if so, determine which player commits it
                switch propComp_Fls(p6,p7,p8,p9,p10)
                    case 1
                        p6Stats(FLS) = p6Stats(FLS)+1;
                    case 2
                        p7Stats(FLS) = p7Stats(FLS)+1;
                    case 3
                        p8Stats(FLS) = p8Stats(FLS)+1;
                    case 4
                        p9Stats(FLS) = p9Stats(FLS)+1;
                    case 5
                        p10Stats(FLS) = p10Stats(FLS)+1;
                end
            end
        end
    end
    
    
    % if the play is a turnover, the possession ends and "play" increments
    if PLAY_IS_TOV
        PLAY_IS_TOV = false;
        PLAY_IS_STL = false;
        PLAY_IS_FL  = false;
%         if teamNum == 1
%             teamNum = 2;
%         elseif teamNum == 2
%             teamNum = 1;
%         end
        continue
    end
    % if the play is not a turnover, it will be a shot attempt, so the
    % program continues to section 3...
    
    %% 3. determine if a foul is committed
    % 3a. decide based on probability if the foul is a shooting foul
    % statistics are not directly tracked on this so section 3 will be
    % based on a loose approximation
    % leaguewide, the defending side commits fouls on 18.33% of plays
    
    randDec = rand;
    
    if randDec <= .1833
        
        % no data seems to exist on what proportion of defensive fouls are
        % shooting fouls, so for the sake of simulation, we will assume 40%
        randShooting = rand;
        
        if randShooting <= .4
            
            % determine using the 36% number if this was likely to be a
            % three-point shot
            
            randThree = rand;
            
            if randThree <= .36
                
                if teamNum==1
                    switch propComp_ThreesAtt(p1,p2,p3,p4,p5)
                        case 1
                            p1Stats(FT_ATT) = p1Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p1,"FTP")
                                    p1Stats(FT_MADE) = p1Stats(FT_MADE)+1;
                                end
                            end
                        case 2
                            p2Stats(FT_ATT) = p2Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p2,"FTP")
                                    p2Stats(FT_MADE) = p2Stats(FT_MADE)+1;
                                end
                            end
                        case 3
                            p3Stats(FT_ATT) = p3Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p3,"FTP")
                                    p3Stats(FT_MADE) = p3Stats(FT_MADE)+1;
                                end
                            end
                        case 4
                            p4Stats(FT_ATT) = p4Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p4,"FTP")
                                    p4Stats(FT_MADE) = p4Stats(FT_MADE)+1;
                                end
                            end
                        case 5
                            p5Stats(FT_ATT) = p5Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p5,"FTP")
                                    p5Stats(FT_MADE) = p5Stats(FT_MADE)+1;
                                end
                            end
                    end
                    
                elseif teamNum==2
                    switch propComp_ThreesAtt(p6,p7,p8,p9,p10)
                        case 1
                            p6Stats(FT_ATT) = p6Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p6,"FTP")
                                    p6Stats(FT_MADE) = p6Stats(FT_MADE)+1;
                                end
                            end
                        case 2
                            p7Stats(FT_ATT) = p7Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p7,"FTP")
                                    p7Stats(FT_MADE) = p7Stats(FT_MADE)+1;
                                end
                            end
                        case 3
                            p8Stats(FT_ATT) = p8Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p8,"FTP")
                                    p8Stats(FT_MADE) = p8Stats(FT_MADE)+1;
                                end
                            end
                        case 4
                            p9Stats(FT_ATT) = p9Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p9,"FTP")
                                    p9Stats(FT_MADE) = p9Stats(FT_MADE)+1;
                                end
                            end
                        case 5
                            p10Stats(FT_ATT) = p10Stats(FT_ATT)+3;
                            for i=1:3
                                randFT = rand;
                                if randFT <= get(p10,"FTP")
                                    p10Stats(FT_MADE) = p10Stats(FT_MADE)+1;
                                end
                            end
                    end
                end
                
            else
                
                if teamNum==1
                    switch propComp_TwosAtt(p1,p2,p3,p4,p5)
                        case 1
                            p1Stats(FT_ATT) = p1Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p1,"FTP")
                                    p1Stats(FT_MADE) = p1Stats(FT_MADE)+1;
                                end
                            end
                        case 2
                            p2Stats(FT_ATT) = p2Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p2,"FTP")
                                    p2Stats(FT_MADE) = p2Stats(FT_MADE)+1;
                                end
                            end
                        case 3
                            p3Stats(FT_ATT) = p3Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p3,"FTP")
                                    p3Stats(FT_MADE) = p3Stats(FT_MADE)+1;
                                end
                            end
                        case 4
                            p4Stats(FT_ATT) = p4Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p4,"FTP")
                                    p4Stats(FT_MADE) = p4Stats(FT_MADE)+1;
                                end
                            end
                        case 5
                            p5Stats(FT_ATT) = p5Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p5,"FTP")
                                    p5Stats(FT_MADE) = p5Stats(FT_MADE)+1;
                                end
                            end
                    end
                    
                elseif teamNum==2
                    switch propComp_ThreesAtt(p6,p7,p8,p9,p10)
                        case 1
                            p6Stats(FT_ATT) = p6Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p6,"FTP")
                                    p6Stats(FT_MADE) = p6Stats(FT_MADE)+1;
                                end
                            end
                        case 2
                            p7Stats(FT_ATT) = p7Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p7,"FTP")
                                    p7Stats(FT_MADE) = p7Stats(FT_MADE)+1;
                                end
                            end
                        case 3
                            p8Stats(FT_ATT) = p8Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p8,"FTP")
                                    p8Stats(FT_MADE) = p8Stats(FT_MADE)+1;
                                end
                            end
                        case 4
                            p9Stats(FT_ATT) = p9Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p9,"FTP")
                                    p9Stats(FT_MADE) = p9Stats(FT_MADE)+1;
                                end
                            end
                        case 5
                            p10Stats(FT_ATT) = p10Stats(FT_ATT)+2;
                            for i=1:2
                                randFT = rand;
                                if randFT <= get(p10,"FTP")
                                    p10Stats(FT_MADE) = p10Stats(FT_MADE)+1;
                                end
                            end
                    end
                end
                
            end
            
        end
        continue
        
    end
    
    % 3b. decide if shot was 2-pt or 3-pt
    
    %% 4. determine what kind of shot is attempted
    % on average, the rate of three-point shot is 36%
    % source: teamrankings.com, accessed 7 Apr 2019
    SHOT_MADE = false;
    
    randDec = rand;
    if teamNum == 1
        % note: these are NOT the values of how many shots each team has
        % attempted. They are the sums of the propensity values of each
        % player on the given team. All team stats can be summed at the end
        % of the simulation.
        team1ThreesAtt = playerThreesAtt(p1) + playerThreesAtt(p2) + playerThreesAtt(p3)...
            + playerThreesAtt(p4) + playerThreesAtt(p5);
        team1TwosAtt = playerTwosAtt(p1) + playerTwosAtt(p2) + playerTwosAtt(p3)...
            + playerTwosAtt(p4) + playerTwosAtt(p5);
        
        % blocks occur on 5.54% of all shot attempts
        
        team2Blks = playerBlk(p6) + playerBlk(p7) + playerBlk(p8) + playerBlk(p9) + playerBlk(p10);
        
        randBlk = rand;
        if randBlk * 250 / team2Blks <= .0554
            
            % defaulting to two-point prop comp because two-pointers are
            % more common than three-pointers
            
            switch propComp_TwosAtt(p1,p2,p3,p4,p5)
                case 1
                    p1Stats(TWO_ATT) = p1Stats(TWO_ATT)+1;
                case 2
                    p2Stats(TWO_ATT) = p2Stats(TWO_ATT)+1;
                case 3
                    p3Stats(TWO_ATT) = p3Stats(TWO_ATT)+1;
                case 4
                    p4Stats(TWO_ATT) = p4Stats(TWO_ATT)+1;
                case 5
                    p5Stats(TWO_ATT) = p5Stats(TWO_ATT)+1;
            end
            
            switch propComp_Blk(p6,p7,p8,p9,p10)
                case 1
                    p6Stats(BLK) = p6Stats(BLK)+1;
                case 2
                    p7Stats(BLK) = p7Stats(BLK)+1;
                case 3
                    p8Stats(BLK) = p8Stats(BLK)+1;
                case 4
                    p9Stats(BLK) = p9Stats(BLK)+1;
                case 5
                    p10Stats(BLK) = p10Stats(BLK)+1;
            end
            continue
        end
        
        % this one will compare threes attempted to twos attempted,
        % dividing twos att by threes att and then dividing that number by
        % (.64/.36), the expected ratio between twos and threes, and
        % finally multiplying that number into the randDec to weight the
        % likelihood of a three-pointer based on this team's lineup
        
        if randDec * ((team1ThreesAtt/team1TwosAtt) / (.36/.64)) <= .36 % indicates three-point shot
            % 3a-1. determine which player attempts the shot
            % (propComp_ThreesAtt(p1,p2,p3,p4,p5));
            randShot = rand;
            
            switch propComp_ThreesAtt(p1,p2,p3,p4,p5)
                case 1
                    p1Stats(THREE_ATT) = p1Stats(THREE_ATT)+1;
                    if randShot <= get(p1,'ThreeP')
                        SHOT_MADE = true;
                        p1Stats(THREE_MADE) = p1Stats(THREE_MADE)+1;
                    end
                    
                case 2
                    p2Stats(THREE_ATT) = p2Stats(THREE_ATT)+1;
                    if randShot <= get(p2,'ThreeP')
                        SHOT_MADE = true;
                        p2Stats(THREE_MADE) = p2Stats(THREE_MADE)+1;
                    end
                    
                case 3
                    p3Stats(THREE_ATT) = p3Stats(THREE_ATT)+1;
                    if randShot <= get(p3,'ThreeP')
                        SHOT_MADE = true;
                        p3Stats(THREE_MADE) = p3Stats(THREE_MADE)+1;
                    end
                    
                case 4
                    p4Stats(THREE_ATT) = p4Stats(THREE_ATT)+1;
                    if randShot <= get(p4,'ThreeP')
                        SHOT_MADE = true;
                        p4Stats(THREE_MADE) = p4Stats(THREE_MADE)+1;
                    end
                    
                case 5
                    p5Stats(THREE_ATT) = p5Stats(THREE_ATT)+1;
                    if randShot <= get(p5,'ThreeP')
                        SHOT_MADE = true;
                        p5Stats(THREE_MADE) = p5Stats(THREE_MADE)+1;
                    end
            end
            
        else % indicates two-point shot
            % 3a-2. determine which player attempts the two-point shot
            % (propComp_TwosAtt(p1,p2,p3,p4,p5));
            
            
            randShot = rand;
            
            switch propComp_TwosAtt(p1,p2,p3,p4,p5)
                case 1
                    p1Stats(TWO_ATT) = p1Stats(TWO_ATT)+1;
                    if randShot <= get(p1,'TwoP')
                        SHOT_MADE = true;
                        p1Stats(TWO_MADE) = p1Stats(TWO_MADE)+1;
                    end
                    
                case 2
                    p2Stats(TWO_ATT) = p2Stats(TWO_ATT)+1;
                    if randShot <= get(p2,'TwoP')
                        SHOT_MADE = true;
                        p2Stats(TWO_MADE) = p2Stats(TWO_MADE)+1;
                    end
                    
                case 3
                    p3Stats(TWO_ATT) = p3Stats(TWO_ATT)+1;
                    if randShot <= get(p3,'TwoP')
                        SHOT_MADE = true;
                        p3Stats(TWO_MADE) = p3Stats(TWO_MADE)+1;
                    end
                    
                case 4
                    p4Stats(TWO_ATT) = p4Stats(TWO_ATT)+1;
                    if randShot <= get(p4,'TwoP')
                        SHOT_MADE = true;
                        p4Stats(TWO_MADE) = p4Stats(TWO_MADE)+1;
                    end
                    
                case 5
                    p5Stats(TWO_ATT) = p5Stats(TWO_ATT)+1;
                    if randShot <= get(p5,'TwoP')
                        SHOT_MADE = true;
                        p5Stats(TWO_MADE) = p5Stats(TWO_MADE)+1;
                    end
            end
        end
        
        
    elseif teamNum == 2
        
        % note: these are NOT the values of how many shots each team has
        % attempted. They are the sums of the propensity values of each
        % player on the given team. All team stats can be summed at the end
        % of the simulation.
        team2ThreesAtt = playerThreesAtt(p6) + playerThreesAtt(p7) + playerThreesAtt(p8)...
            + playerThreesAtt(p9) + playerThreesAtt(p10);
        team2TwosAtt = playerTwosAtt(p6) + playerTwosAtt(p7) + playerTwosAtt(p8)...
            + playerTwosAtt(p9) + playerTwosAtt(p10);
        
        % blocks occur on approximately 5.54% of shot attempts
        team1Blks = playerBlk(p1) + playerBlk(p2) + playerBlk(p3) + playerBlk(p4) + playerBlk(p5);
        
        randBlk = rand;
        if randBlk * 250 / team1Blks <= .0554
            
            switch propComp_TwosAtt(p6,p7,p8,p9,p10)
                case 1
                    p6Stats(TWO_ATT) = p6Stats(TWO_ATT)+1;
                case 2
                    p7Stats(TWO_ATT) = p7Stats(TWO_ATT)+1;
                case 3
                    p8Stats(TWO_ATT) = p8Stats(TWO_ATT)+1;
                case 4
                    p9Stats(TWO_ATT) = p9Stats(TWO_ATT)+1;
                case 5
                    p10Stats(TWO_ATT) = p10Stats(TWO_ATT)+1;
            end
            
            switch propComp_Blk(p1,p2,p3,p4,p5)
                case 1
                    p1Stats(BLK) = p1Stats(BLK)+1;
                case 2
                    p2Stats(BLK) = p2Stats(BLK)+1;
                case 3
                    p3Stats(BLK) = p3Stats(BLK)+1;
                case 4
                    p4Stats(BLK) = p4Stats(BLK)+1;
                case 5
                    p5Stats(BLK) = p5Stats(BLK)+1;
            end
            
            % skips the rest of this play, giving possession to the
            % blocking team
            continue
        end
        
        % this one will compare threes attempted to twos attempted,
        % dividing twos att by threes att and then dividing that number by
        % (.64/.36), the expected ratio between twos and threes, and
        % finally multiplying that number into the randDec to weight the
        % likelihood of a three-pointer based on this team's lineup
        
        if randDec * ((team2ThreesAtt/team2TwosAtt) / (.36/.64)) <= .36 % indicates three-point shot
            % 3a-1. determine which player attempts the shot
            % (propComp_ThreesAtt(p1,p2,p3,p4,p5));
            randShot = rand;
            
            switch propComp_ThreesAtt(p6,p7,p8,p9,p10)
                case 1
                    p6Stats(THREE_ATT) = p6Stats(THREE_ATT)+1;
                    if randShot <= get(p6,'ThreeP')
                        SHOT_MADE = true;
                        p6Stats(THREE_MADE) = p6Stats(THREE_MADE)+1;
                    end
                    
                case 2
                    p7Stats(THREE_ATT) = p7Stats(THREE_ATT)+1;
                    if randShot <= get(p7,'ThreeP')
                        SHOT_MADE = true;
                        p7Stats(THREE_MADE) = p7Stats(THREE_MADE)+1;
                    end
                    
                case 3
                    p8Stats(THREE_ATT) = p8Stats(THREE_ATT)+1;
                    if randShot <= get(p8,'ThreeP')
                        SHOT_MADE = true;
                        p8Stats(THREE_MADE) = p8Stats(THREE_MADE)+1;
                    end
                    
                case 4
                    p9Stats(THREE_ATT) = p9Stats(THREE_ATT)+1;
                    if randShot <= get(p9,'ThreeP')
                        SHOT_MADE = true;
                        p9Stats(THREE_MADE) = p9Stats(THREE_MADE)+1;
                    end
                    
                case 5
                    p10Stats(THREE_ATT) = p10Stats(THREE_ATT)+1;
                    if randShot <= get(p10,'ThreeP')
                        SHOT_MADE = true;
                        p10Stats(THREE_MADE) = p10Stats(THREE_MADE)+1;
                    end
            end
            
        else % indicates two-point shot
            % 3a-2. determine which player attempts the two-point shot
            % (propComp_TwosAtt(p1,p2,p3,p4,p5));
            
            % CHANGE SO EVERYTHING IS 2PT
            
            randShot = rand;
            
            switch propComp_TwosAtt(p6,p7,p8,p9,p10)
                case 1
                    p6Stats(TWO_ATT) = p6Stats(TWO_ATT)+1;
                    if randShot <= get(p6,'TwoP')
                        SHOT_MADE = true;
                        p6Stats(TWO_MADE) = p6Stats(TWO_MADE)+1;
                    end
                    
                case 2
                    p7Stats(TWO_ATT) = p7Stats(TWO_ATT)+1;
                    if randShot <= get(p7,'TwoP')
                        SHOT_MADE = true;
                        p7Stats(TWO_MADE) = p7Stats(TWO_MADE)+1;
                    end
                    
                case 3
                    p8Stats(TWO_ATT) = p8Stats(TWO_ATT)+1;
                    if randShot <= get(p8,'TwoP')
                        SHOT_MADE = true;
                        p8Stats(TWO_MADE) = p8Stats(TWO_MADE)+1;
                    end
                    
                case 4
                    p9Stats(TWO_ATT) = p9Stats(TWO_ATT)+1;
                    if randShot <= get(p9,'TwoP')
                        SHOT_MADE = true;
                        p9Stats(TWO_MADE) = p9Stats(TWO_MADE)+1;
                    end
                    
                case 5
                    p10Stats(TWO_ATT) = p10Stats(TWO_ATT)+1;
                    if randShot <= get(p10,'TwoP')
                        SHOT_MADE = true;
                        p10Stats(TWO_MADE) = p10Stats(TWO_MADE)+1;
                    end
            end
        end
        
    end
    
    %% 5. assuming a shot make, determine if it was assisted
    
    % on average, an assist occurs on a made shot 59.75% of the time
    
    randAst = rand;
    if SHOT_MADE
        if teamNum == 1
            
            team1Ast = playerAst(p1) + playerAst(p2) + playerAst(p3) + playerAst(p4) + playerAst(p5);
            % dividing by 250 because a team with completely average foul
            % propensity values, as judged by the set of players in this
            % simulation, would have a sum of 250 and thus even out to a 1x
            % multiplier
            if randAst*(250/team1Ast) <= .5975
                
                switch propComp_Ast(p1,p2,p3,p4,p5)
                    case 1
                        p1Stats(AST) = p1Stats(AST)+1;
                    case 2
                        p2Stats(AST) = p2Stats(AST)+1;
                    case 3
                        p3Stats(AST) = p3Stats(AST)+1;
                    case 4
                        p4Stats(AST) = p4Stats(AST)+1;
                    case 5
                        p5Stats(AST) = p5Stats(AST)+1;
                end
            end
            
        elseif teamNum == 2
            team2Ast = playerAst(p6) + playerAst(p7) + playerAst(p8) + playerAst(p9) + playerAst(p10);
            
            if randAst*(250/team2Ast) <= .5975
                
                switch propComp_Ast(p6,p7,p8,p9,p10)
                    case 1
                        p6Stats(AST) = p6Stats(AST)+1;
                    case 2
                        p7Stats(AST) = p7Stats(AST)+1;
                    case 3
                        p8Stats(AST) = p8Stats(AST)+1;
                    case 4
                        p9Stats(AST) = p9Stats(AST)+1;
                    case 5
                        p10Stats(AST) = p10Stats(AST)+1;
                end
            end
            
        end
    end
    
    %% 6. assuming a shot miss, determine if it is an offensive or defensive rebound
    % on average, an offensive rebound occurs on 23% of rebound attempts
    % source: teamrankings.com, accessed 7 Apr 2019
    
    randDec = rand;
    if SHOT_MADE == false
        % here, we are going to compare the shooting team's offensive
        % rebound propensity with the opposing team's defensive rebound
        % propensity
        if teamNum == 1
            
            team2DReb = playerDReb(p6) + playerDReb(p7) + playerDReb(p8)...
                + playerDReb(p9) + playerDReb(p10);
            team1OReb = playerOReb(p1) + playerOReb(p2) + playerOReb(p3)...
                + playerOReb(p4) + playerOReb(p5);
            
            if randDec * (team2DReb/team1OReb) <= .23 % indicates an offensive rebound
                
                switch propComp_OReb(p1,p2,p3,p4,p5)
                    case 1
                        p1Stats(OREB) = p1Stats(OREB)+1;
                    case 2
                        p2Stats(OREB) = p2Stats(OREB)+1;
                    case 3
                        p3Stats(OREB) = p3Stats(OREB)+1;
                    case 4
                        p4Stats(OREB) = p4Stats(OREB)+1;
                    case 5
                        p5Stats(OREB) = p5Stats(OREB)+1;
                end
                continue
                
            else % indicates defensive rebound
                
                switch propComp_DReb(p6,p7,p8,p9,p10)
                    case 1
                        p6Stats(DREB) = p6Stats(DREB)+1;
                    case 2
                        p7Stats(DREB) = p7Stats(DREB)+1;
                    case 3
                        p8Stats(DREB) = p8Stats(DREB)+1;
                    case 4
                        p9Stats(DREB) = p9Stats(DREB)+1;
                    case 5
                        p10Stats(DREB) = p10Stats(DREB)+1;
                end
                
            end
            
            
        elseif teamNum == 2
            
            team1DReb = playerDReb(p1) + playerDReb(p2) + playerDReb(p3)...
                + playerDReb(p4) + playerDReb(p5);
            team2OReb = playerOReb(p6) + playerOReb(p7) + playerOReb(p8)...
                + playerOReb(p9) + playerOReb(p10);
            
            if randDec * (team1DReb/team2OReb) <= .23 % indicates an offensive rebound
                
                switch propComp_OReb(p6,p7,p8,p9,p10)
                    case 1
                        p6Stats(OREB) = p6Stats(OREB)+1;
                    case 2
                        p7Stats(OREB) = p7Stats(OREB)+1;
                    case 3
                        p8Stats(OREB) = p8Stats(OREB)+1;
                    case 4
                        p9Stats(OREB) = p9Stats(OREB)+1;
                    case 5
                        p10Stats(OREB) = p10Stats(OREB)+1;
                end
                continue
                
            else % indicates defensive rebound
                
                switch propComp_DReb(p1,p2,p3,p4,p5)
                    case 1
                        p1Stats(DREB) = p1Stats(DREB)+1;
                    case 2
                        p2Stats(DREB) = p2Stats(DREB)+1;
                    case 3
                        p3Stats(DREB) = p3Stats(DREB)+1;
                    case 4
                        p4Stats(DREB) = p4Stats(DREB)+1;
                    case 5
                        p5Stats(DREB) = p5Stats(DREB)+1;
                end
                
            end
            
        end
    end
    
    % on a defensive rebound, the possession ends and "play" naturally increments,
    % starting the process over again
    
    % these appear to be redundant given the top statement but they can be
    % uncommented if need be
    
%     if teamNum == 1
%         teamNum = 2;
%     elseif teamNum == 2
%         teamNum = 1;
%     end
end

p1Stats(PTS) = p1Stats(TWO_MADE)*2 + p1Stats(THREE_MADE)*3 + p1Stats(FT_MADE);
p2Stats(PTS) = p2Stats(TWO_MADE)*2 + p2Stats(THREE_MADE)*3 + p2Stats(FT_MADE);
p3Stats(PTS) = p3Stats(TWO_MADE)*2 + p3Stats(THREE_MADE)*3 + p3Stats(FT_MADE);
p4Stats(PTS) = p4Stats(TWO_MADE)*2 + p4Stats(THREE_MADE)*3 + p4Stats(FT_MADE);
p5Stats(PTS) = p5Stats(TWO_MADE)*2 + p5Stats(THREE_MADE)*3 + p5Stats(FT_MADE);

p6Stats(PTS) = p6Stats(TWO_MADE)*2 + p6Stats(THREE_MADE)*3 + p6Stats(FT_MADE);
p7Stats(PTS) = p7Stats(TWO_MADE)*2 + p7Stats(THREE_MADE)*3 + p7Stats(FT_MADE);
p8Stats(PTS) = p8Stats(TWO_MADE)*2 + p8Stats(THREE_MADE)*3 + p8Stats(FT_MADE);
p9Stats(PTS) = p9Stats(TWO_MADE)*2 + p9Stats(THREE_MADE)*3 + p9Stats(FT_MADE);
p10Stats(PTS) = p10Stats(TWO_MADE)*2 + p10Stats(THREE_MADE)*3 + p10Stats(FT_MADE);

team1Stats = [p1Stats;p2Stats;p3Stats;p4Stats;p5Stats];
team2Stats = [p6Stats;p7Stats;p8Stats;p9Stats;p10Stats];

% disp(p1Stats);
% disp(p2Stats);
% disp(p3Stats);
% disp(p4Stats);
% disp(p5Stats);
% disp(p6Stats);
% disp(p7Stats);
% disp(p8Stats);
% disp(p9Stats);
% disp(p10Stats);