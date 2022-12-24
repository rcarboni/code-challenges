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
my $unseen = 0;
for my $r (1..$nrow - 1){
    SEEN: for my $c (1..$ncol - 1) {
        # print "$forest[$r][$c]\t";
        # LEFT
        for my $c2 (0..$c - 1){
            last if($forest[$r][$c2] >= $forest[$r][$c]);
            next SEEN if($c2 == $c - 1);
        }
        # RIGHT
        for my $c2 ($c+1..$ncol){
            last if($forest[$r][$c2] >= $forest[$r][$c]);
            next SEEN if($c2 == $ncol);
        }
        # TOP
        for my $r2 (0..$r - 1){
            last if($forest[$r2][$c] >= $forest[$r][$c]);
            next SEEN if($r2 == $r - 1);
        }
        # BOTTOM
        for my $r2 ($r+1..$nrow){
            last if($forest[$r2][$c] >= $forest[$r][$c]);
            next SEEN if($r2 == $nrow);
        }
        $unseen++;
    }
    # print "\n";
}
print "UNSEEN: $unseen\n";
print "SEEN: ", ($ncol+1) * ($nrow+1) - $unseen, "\n";