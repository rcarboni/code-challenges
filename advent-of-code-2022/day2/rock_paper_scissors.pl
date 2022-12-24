#!/usr/bin/perl

# points for match results
my %scores = (
    AY => 6,
    BZ => 6,
    CX => 6,
    AX => 3,
    BY => 3,
    CZ => 3,
    BX => 0,
    CY => 0,
    AZ => 0);
# XYZ are worth 1, 2, 3

while( <STDIN> ) {
    ($opp, $you) = /([A-C]) ([X-Z])/;
    $score += $scores{$opp . $you} + ord($you) - ord('X') + 1; 
}
print "$score\n";