%{
getIndexF.m
Function that returns the index of a player given that player's exact name

Author: Ryan Farrow
Date: 24 Apr 2019
%}

%{
Note on how to implement this function:

There should be variables for each player in the simulation storing their
player index. For example, there may be variables p1Index for player 1,
p2Index for player 2, and so on. The name of the player selected will be
passed as the input for this function, outputting the player's index to be
used in the GameF(p1Index, p2Index, ...) function call.
So, if player 1 is Stephen Curry and his name is accessible through
handles.playersList1.String, the command under finalizeButon_Callback will
be:

p1Index = getIndexF(handles.playersList1.String);

and the GameF() function will be called under the final button press as

GameF(p1Index, p2Index, ...);

%}

function index = getIndexF(pName)

switch pName
    
    case 'Lebron James'
        index = 246;
    case 'Stephen Curry'
        index = 119;
    case 'Kevin Durant'
        index = 144;
    case 'James Harden'
        index = 197;
    case 'Russell Westbrook'
        index = 479;
    case 'Anthony Davis'
        index = 121;
    case 'Kyrie Irving'
        index = 237;
    case 'Kawhi Leonard'
        index = 285;
    case 'Giannis Antetokounmpo'
        index = 18;
    case 'Paul George'
        index = 175;
    case 'Damian Lillard'
        index = 289;
    case 'Chris Paul'
        index = 376;
    case 'Klay Thompson'
        index = 449;
    case 'DeMar DeRozan'
        index = 129;
    case 'Jimmy Butler'
        index = 81;
    case 'DeMarcus Cousins'
        index = 110;
    case 'John Wall'
        index = 472;
    case 'Joel Embiid'
        index = 149;
    case 'Blake Griffin'
        index = 194;
    case 'Dwyane Wade'
        index = 466;
    case 'Victor Oladipo'
        index = 367;
    case 'Kyle Lowry'
        index = 297;
    case 'Karl-Anthony Towns'
        index = 453;
    case 'Kemba Walker'
        index = 469;
    case 'Draymond Green'
        index = 190;
    case 'Nikola Jokic'
        index = 256;
    case 'Kevin Love'
        index = 296;
    case 'Ben Simmons'
        index = 422;
    case 'Donovan Mitchell'
        index = 333;
    case 'Devin Booker'
        index = 58;
    case 'Andre Drummond'
        index = 141;
    case 'Bradley Beal'
        index = 39;
    case 'Jayson Tatum'
        index = 439;
    case 'Rudy Gobert'
        index = 179;
    case 'Carmelo Anthony'
        index = 19;
    case 'Gordon Hayward'
        index = 209;
    case 'CJ McCollum'
        index = 315;
    case 'Al Horford'
        index = 227;
    case 'Isaiah Thomas'
        index = 446;
    case 'Andrew Wiggins'
        index = 483;
    case 'Derrick Rose'
        index = 405;
    case 'DeAndre Jordan'
        index = 261;
    case 'Marc Gasol'
        index = 172;
    case 'Clint Capela'
        index = 86;
    case 'Dwight Howard'
        index = 229;
    case 'Hassan Whiteside'
        index = 482;
    case 'Jaylen Brown'
        index = 71;
    case 'Steven Adams'
        index = 4;
    case 'D''Angelo Russell'
        index = 409;
    case 'Mike Conley'
        index = 107;
    case 'Paul Millsap'
        index = 330;
    case 'Kyle Kuzma'
        index = 276;
    case 'Andre Iguodala'
        index = 233;
    case 'Jrue Holiday'
        index = 221;
    case 'Brandon Ingram'
        index = 236;
    case 'De''Aaron Fox'
        index = 165;
    case 'Rajon Rondo'
        index = 404;
    case 'Goran Dragic'
        index = 140;
    case 'Khris Middleton'
        index = 326;
    case 'Vince Carter'
        index = 89;
    case 'Aaron Gordon'
        index = 181;
    case 'Eric Bledsoe'
        index = 52;
    case 'Zach LaVine'
        index = 279;
    case 'Eric Gordon'
        index = 182;
    case 'Lou Williams'
        index = 488;
    case 'Tony Parker'
        index = 373;
    case 'Myles Turner'
        index = 458;
    case 'Pau Gasol'
        index = 173;
    case 'Serge Ibaka'
        index = 232;
    case 'J.J. Redick'
        index = 394;
    case 'Lauri Markkanen'
        index = 309;
    case 'Marcus Smart'
        index = 426;
    case 'Tobias Harris'
        index = 203;
    case 'Julius Randle'
        index = 393;
    case 'Jabari Parker'
        index = 372;
    case 'Rudy Gay'
        index = 174;
    case 'Ricky Rubio'
        index = 408;
    case 'Harrison Barnes'
        index = 32;
    case 'Kyle Korver'
        index = 273;
    case 'Jamal Crawford'
        index = 114;
    otherwise
        index = 246;
end

end