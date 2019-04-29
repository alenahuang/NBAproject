% probComp_TwosAtt
% Functions similar to probComp_TOV. See comments in that file.

function player = propComp_TwosAtt(p1,p2,p3,p4,p5)
    PROB_SUM = (playerTwosAtt(p1) + playerTwosAtt(p2) + playerTwosAtt(p3) + playerTwosAtt(p4) + playerTwosAtt(p5));
    
    p1_prob = playerTwosAtt(p1) / PROB_SUM;
    p2_prob = playerTwosAtt(p2) / PROB_SUM;
    p3_prob = playerTwosAtt(p3) / PROB_SUM;
    p4_prob = playerTwosAtt(p4) / PROB_SUM;
    p5_prob = playerTwosAtt(p5) / PROB_SUM;
    
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