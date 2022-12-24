#!/usr/bin/perl
# https://adventofcode.com/2022/day/4


while( <STDIN> ) {
    chomp();
    ($x1,$x2,$y1,$y2) = /(\d+)/g;
    $fc++ if(($x1 >= $y1 & $x2 <= $y2) | ($y1 >= $x1 & $y2 <= $x2));
    $ov++ if(($x1 >= $y1 & $x1 <= $y2) | ($y1 >= $x1 & $y1 <= $x2));
}
print "Fully Contained: $fc\tOverlap: $ov\n";
