#!/usr/bin/perl
# https://adventofcode.com/2022/day/15
# use warnings;
# use strict;

# my $target_row = 10; # example
my $target_row = 2000000; # part 1

my (%seen, %beacons_in_row);
while( <STDIN> ) {
    ($sx, $sy, $bx, $by) = $_ =~ /Sensor at x=([-\d]+), y=([-\d]+).*beacon is at x=([-\d]+), y=([-\d]+)/;
    # manhattan distance for radius
    my $dist = abs(int($sx) - int($bx)) + abs(int($sy) - int($by));
    # how much left after reaching target row
    my $left = $dist - abs(int($sy) - $target_row);
    # track any beacons on target row
    $beacons_in_row{int($bx)}++ if(int($by == $target_row));
    if($left >= 0){
        # all the cells in target row you can traverse
        foreach $i (int($sx)-$left..int($sx)+$left){
            $seen{$i}++;
        }
    }
}
print "SEEN: ",  (scalar keys %seen), "\n";
print "BEACONS: ", (scalar keys %beacons_in_row), "\n";
print "SEEN - BEACONS: ",  (scalar keys %seen) - (scalar keys %beacons_in_row), "\n";



