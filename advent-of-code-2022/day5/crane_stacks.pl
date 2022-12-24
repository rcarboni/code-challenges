#!/usr/bin/perl
# https://adventofcode.com/2022/day/5

# top items at beginning of array (pick up with shift)
# dummy_input
my %stacks = ( 
    1 => ["N", "Z"], 
    2 => [ "D", "C", "M" ], 
    3 => [ "P" ]);
# problem input
%stacks = (
    1 => ["W", "B", "G", "Z", "R", "D", "C", "V"],
    2 => ["V", "T", "S", "B", "C", "F", "W", "G"],   
    3 => ["W", "N", "S", "B", "C"], 
    4 => ["P", "C", "V", "J", "N", "M", "G", "Q"], 
    5 => ["B", "H", "D", "F", "L", "S", "T"],   
    6 => ["N", "M", "W", "T", "V", "J"], 
    7 => ["G", "T", "S", "C", "L", "F", "P"],          
    8 => ["Z", "D", "B"],             
    9 => ["W", "Z", "N", "M"]);  

while( <STDIN> ) {
    chomp();
    next unless(/^move/);
    ($num, $f, $t) = /(\d+)/g;
    @crane = ();
    for (1..$num){
        # unshift @crane, shift @{$stacks{$f}}; # crane picks up one at a time (Part 1)
        push @crane, shift @{$stacks{$f}}; # crane picks up multiple at once (Part 2)
    }
    unshift @{$stacks{$t}}, @crane;
}

for $i (1..(keys %stacks)){
    $v .= shift @{$stacks{$i}};
}
print "$v\n"


