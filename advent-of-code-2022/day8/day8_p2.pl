#!/usr/bin/perl
# https://adventofcode.com/2022/day/8
# cat dinput.txt | ./day8.pl  
# cat input.txt | ./day8.pl  
use strict;
use warnings;

my @forest = ();
while( <STDIN> ) {
    chomp();
    push @forest, [ split '',$_ ];
}
my $nrow = $#forest;
my $ncol = $#{$forest[0]};
my $maxscore = 0;
for my $r (1..$nrow - 1){
    SEEN: for my $c (1..$ncol - 1) {
        # print "$forest[$r][$c]\t";
        my $dist = 0;
        my $score = 1;
        # LEFT
        for(my $c2 = $c - 1; $c2 >= 0; $c2--){
            $dist++;
            last if($forest[$r][$c2] >= $forest[$r][$c]);
        }
        $score *= $dist;
        $dist = 0;
        # RIGHT
        for my $c2 ($c+1..$ncol){
            $dist++;
            last if($forest[$r][$c2] >= $forest[$r][$c]);
        }
        $score *= $dist;
        $dist = 0;
        # TOP
        for(my $r2 = $r - 1; $r2 >= 0; $r2--){
            $dist++;
            last if($forest[$r2][$c] >= $forest[$r][$c]);
        }
        $score *= $dist;
        $dist = 0;
        # BOTTOM
        for my $r2 ($r+1..$nrow){
            $dist++;
            last if($forest[$r2][$c] >= $forest[$r][$c]);
        }
        $score *= $dist;
        $maxscore = $score if($score > $maxscore);
    }
    # print "\n";
}
print "MAX SCORE: $maxscore\n";