% probComp_Ast
% Functions similar to probComp_TOV. See comments in that file.

function player = propComp_Ast(p1,p2,p3,p4,p5)
    PROB_SUM = (playerAst(p1) + playerAst(p2) + playerAst(p3) + playerAst(p4) + playerAst(p5));
    
    p1_prob = playerAst(p1) / PROB_SUM;
    p2_prob = playerAst(p2) / PROB_SUM;
    p3_prob = playerAst(p3) / PROB_SUM;
    p4_prob = playerAst(p4) / PROB_SUM;
    p5_prob = playerAst(p5) / PROB_SUM;
    
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