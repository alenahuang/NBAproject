%{
Player.m
Creates the Player object and defines its functions to yield
values that will help fill up the box score

Author: Ryan Farrow
Date: 18 Feb 2019
%}

% the league-wide max values for each stat are used in the computation of propensity
% values for each player action
% I wrote them in by hand--they are not harvested from the data file by
% this program so if we use an updated stat sheet, we will have to go in,
% find the max values for each stat, and replace


%% create class
classdef Player
    %{
    NOTE:
    All mentions of "avg time on court" refer to the total minutes played
    (MP) divided by total games played (G)
    Maybe factor games started in there as well although I don't think that
    will be necessary
    %}
    
    
    properties
        Name          % 1.  name
        Position      % 2.  position
        TwoP          % 3.  percent 2-point field goals made assuming 2PA > 30
        TwoA          % 4.  number of 2-points attempted compared to avg time on court
        ThreeP        % 5.  percent threes made assuming 3PA > 30
        ThreeA        % 6.  number of threes attempted compared to avg time on court
        FTP           % 7.  percent free throws made assuming FTA > 30
        OReb          % 8.  number of offensive rebounds compared to avg time on court
        DReb          % 9.  number of defensive rebounds compared to avg time on court
        Ast           % 10. number of assists compared to avg time on court
        Stl           % 11. number of steals compared to avg time on court
        Blk           % 12. number of blocks compared to avg time on court
        TOV           % 13. number of turnovers compared to avg time on court
        Fls           % 14. number of fouls compared to avg time on court
        GP            % 15. number of games played by this player all season
        MP            % 16. number of minutes played by this player all season
        GS            % 17. number of games started
        Strat         % 18. strategy (1=aggressive, 2=neutral, 3=defensive)
        % save space for potentially more properties

    end
    
    methods     
        function obj = Player(name,position,twopct,twoa,threep,threea,ftp,oreb,...
                              dreb,ast,stl,blk,tov,fls,gp,mp,gs,strat)
                obj.Name = name;
            obj.Position = position;
                obj.TwoP = twopct;
                obj.TwoA = twoa;
              obj.ThreeP = threep;
              obj.ThreeA = threea;
                 obj.FTP = ftp;
                obj.OReb = oreb;
                obj.DReb = dreb;
                 obj.Ast = ast;
                 obj.Stl = stl;
                 obj.Blk = blk;
                 obj.TOV = tov;
                 obj.Fls = fls;
                  obj.GP = gp;
                  obj.MP = mp;
                  obj.GS = gs;
               obj.Strat = strat;
        end
        
        % as of 4 Apr, there are nine propensity functions:
        % two-point shot
        % three-point shot
        % offensive rebound
        % defensive rebound
        % assist
        % steal
        % block
        % turnover
        % foul
        
        %% shot propensity functions
        function r = playerTwosAtt(obj)
            
            % Returns a single number that is meant to describe how many
            %   two-point shots this player is expected to attempt
            % That number will be compared with the rest in the current
            %   lineup to decide how many twos will go to this player
            % There should be a max value held by one player
            
            % 925 was the maximum amount of two-point shots attempted by 
            %   any player (DeMar DeRozan)
            
            % multipliers at the end of the unit being squared indicate
            %   weights relative to the rest of the factors in the
            %   equation
            
            switch obj.Strat
                case 1
                    mult = 1.05;
                case 3
                    mult = 1;
                case 2
                    mult = 0.95;
            end
            
            r = sqrt((obj.TwoA / 925 * 100)^2 ... % twos attempted, weight 100
                   + (obj.MP / (obj.GP * 48) * 15)^2 ...
                   + (obj.GS / obj.GP * 10)^2) * mult;
        end
        
        function r = playerThreesAtt(Player)
            
            % Returns a single number similar to the one above, but
            %   specifically for three-point shots
            
            % 733 was the maximum amount of three-point shots attempted
            %   by any player (James Harden)
            
            switch Player.Strat
                case 1
                    mult = 1.05;
                case 3
                    mult = 1;
                case 2
                    mult = 0.95;
            end
            
            r = sqrt((Player.ThreeA / 733 * 100)^2 ...
                    + (Player.MP / (Player.GP * 48) * 15)^2 ...
                    + (Player.GS / Player.GP * 10)^2) * mult;
        end
        
        % the numbers that these functions yield for each player will
        % be compared to each player on a team to determine how much
        % each player will shoot
        
        % the numbers will be compiled and compared to average team shots
        % taken to determine who takes how many
        
        % total shots taken by team will change depending on total
        % weight score
        
        %% rebound propensity functions
        function r = playerOReb(Player)
            % max offensive rebounds was 271 by Andre Drummond
            switch Player.Strat
                case 1
                    mult = 1.05;
                case 2
                    mult = 0.95;
                case 3
                    mult = 1;
            end
            
            r = sqrt((Player.OReb / 271 * 100)^2 ...
                    + (Player.MP / (Player.GP * 48) * 15)^2 ...
                    + (Player.GS / Player.GP)^2) * mult;
        end
        
        function r = playerDReb(Player)
            % max defensive rebounds was 594 by Joel Embiid
            
            switch Player.Strat
                case 1
                    mult = 0.95;
                case 2
                    mult = 1.05;
                case 3
                    mult = 1;
            end
            
            r = sqrt((Player.DReb / 594 * 100)^2 ...
                    + (Player.MP / (Player.GP * 48) * 15)^2 ...
                    + (Player.GS / Player.GP)^2) * mult;
        end
        
        %% assist propensity function
        function r = playerAst(Player)
            % max assists was 548 by Russell Westbrook
            switch Player.Strat
                case 1
                    mult = 1.05;
                case 2
                    mult = 0.95;
                case 3
                    mult = 1;
            end
            
            r = sqrt((Player.Ast / 548 * 100)^2 ...
                    + (Player.MP / (Player.GP * 48) * 15)^2 ...
                    + (Player.GS / Player.GP)^2) * mult;
        end
        
        %% steal propensity function
        function r = playerStl(Player)
            % max steals was 128 by Paul George
            switch Player.Strat
                case 1
                    mult = 0.95;
                case 2
                    mult = 1.05;
                case 3
                    mult = 1;
            end
            
            r = sqrt((Player.Stl / 128 * 100)^2 ...
                + (Player.MP / (Player.GP * 48) * 15)^2 ...
                + (Player.GS / Player.GP)^2) * mult;
            
        end
        
        %% block propensity function
        function r = playerBlk(Player)
            % max blocks was 145 by Myles Turner
            switch Player.Strat
                case 1
                    mult = 0.95;
                case 2
                    mult = 1.05;
                case 3
                    mult = 1;
            end
            
            r = sqrt((Player.Blk / 145 * 100)^2 ...
                + (Player.MP / (Player.GP * 48) * 15)^2 ...
                + (Player.GS / Player.GP)^2) * mult;
            
        end
        
        %% turnover propensity function
        function r = playerTOV(Player)
            % max turnovers was 290 by James Harden
            switch Player.Strat
                case 1
                    mult = 1.05;
                case 2
                    mult = 0.95;
                case 3
                    mult = 1;
            end
            
            r = sqrt((Player.TOV / 290 * 100)^2 ...
                + (Player.MP / (Player.GP * 48) * 15)^2 ...
                + (Player.GS / Player.GP)^2) * mult;
            
        end
        %% foul propensity function
        function r = playerFls(Player)
            % max fouls was 220 by Jaren Jackson
           
            r = sqrt((Player.Fls / 220 * 100)^2 ...
                + (Player.MP / (Player.GP * 48) * 15)^2 ...
                + (Player.GS / Player.GP)^2);
            
        end
        %% get function
        function r = get(Player,property)
            switch property
                case "ThreeP"
                    r = Player.ThreeP;
                case "TwoP"
                    r = Player.TwoP;
                case "FTP"
                    r = Player.FTP;
            end
        end
    end
end