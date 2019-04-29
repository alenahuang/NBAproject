%{
propComp_TOV
Compares the propensity rates of each player and selects a player based on
who is most likely among the five to have committed the turnover
Propensity stat merely makes it more likely for a player to do something;
does not guarantee it

INPUTS:
p1 = player 1, irrelevant who these players actually are
p2 = player 2
p3 = player 3
p4 = player 4
p5 = player 5

OUTPUT:
player = player selected of the five to commit the turnover

Author: Ryan Farrow
Date: 7 Apr 2019
%}

function player = propComp_TOV(p1,p2,p3,p4,p5)
    % here, we get the sum of all the propensity values
    PROB_SUM = (playerTOV(p1) + playerTOV(p2) + playerTOV(p3) + playerTOV(p4) + playerTOV(p5));
    
    % these values (most of which will be modified) show a single player's
    % proportion of PROB_SUM, thus giving them an appropriate likelihood of
    % receiving the diceroll
    p1_prob = playerTOV(p1) / PROB_SUM;
    p2_prob = playerTOV(p2) / PROB_SUM;
    p3_prob = playerTOV(p3) / PROB_SUM;
    p4_prob = playerTOV(p4) / PROB_SUM;
    p5_prob = playerTOV(p5) / PROB_SUM;
    
    % random number between 0 and 1 that will determine which player
    % will commit the action
    diceroll = rand;
    
    % here, we set up the probabilities so they stack on top of one another
    % diceroll will land on one of them and the corresponding player will
    % be selected as the output
    p2_prob = p2_prob + p1_prob;
    p3_prob = p3_prob + p2_prob;
    p4_prob = p4_prob + p3_prob;
    p5_prob = p5_prob + p4_prob; % see bottom for more info on this
    
    % this is the aforementioned selection process
    if diceroll <= p1_prob
        player = 1;
        
    elseif diceroll <= p2_prob
        player = 2;
        
    elseif diceroll <= p3_prob
        player = 3;
        
    elseif diceroll <= p4_prob
        player = 4;
        
    else
        player = 5;
    end
    
    % side note: I didn't end up using p5_prob here because it is almost
    % equal to the else statement and not using it accounts for any
    % floating point addition errors that might occur
    % I am still leaving it in the code in case we copy this into other
    % applications and it becomes useful there
end