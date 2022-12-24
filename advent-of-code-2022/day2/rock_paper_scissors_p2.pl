#!/usr/bin/perl

# points for match results
my %scores = (
    AX => "Z",
    BX => "X",
    CX => "Y",
    AY => "X",
    BY => "Y",
    CY => "Z",
    AZ => "Y",
    BZ => "Z",
    CZ => "X");
# XYZ now means lose, draw, win

while( <STDIN> ) {
    ($opp, $you) = /([A-C]) ([X-Z])/;
    $score += (ord($you) - ord('X'))*3 + (ord($scores{$opp . $you}) - ord('X') + 1); 
}
print "$score\n";