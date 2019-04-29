% probComp_Blk
% Functions similar to probComp_TOV. See comments in that file.

function player = propComp_Blk(p1,p2,p3,p4,p5)
    PROB_SUM = (playerBlk(p1) + playerBlk(p2) + playerBlk(p3) + playerBlk(p4) + playerBlk(p5));
    
    p1_prob = playerBlk(p1) / PROB_SUM;
    p2_prob = playerBlk(p2) / PROB_SUM;
    p3_prob = playerBlk(p3) / PROB_SUM;
    p4_prob = playerBlk(p4) / PROB_SUM;
    p5_prob = playerBlk(p5) / PROB_SUM;
    
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