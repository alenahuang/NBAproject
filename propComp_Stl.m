% probComp_Stl
% Functions similar to probComp_TOV. See comments in that file.

function player = propComp_Stl(p1,p2,p3,p4,p5)
    PROB_SUM = (playerStl(p1) + playerStl(p2) + playerStl(p3) + playerStl(p4) + playerStl(p5));
    
    p1_prob = playerStl(p1) / PROB_SUM;
    p2_prob = playerStl(p2) / PROB_SUM;
    p3_prob = playerStl(p3) / PROB_SUM;
    p4_prob = playerStl(p4) / PROB_SUM;
    p5_prob = playerStl(p5) / PROB_SUM;
    
    diceroll = rand;
  
    p2_prob = p2_prob + p1_prob;
    p3_prob = p3_prob + p2_prob;
    p4_prob = p4_prob + p3_prob;
    p5_prob = p5_prob + p4_prob; 
    
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
    
end