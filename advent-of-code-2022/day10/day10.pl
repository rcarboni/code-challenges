#!/usr/bin/perl
# https://adventofcode.com/2022/day/10

my $x = 1;
my $cyc = 0;

while( 1 ) {
    $cyc++;
    $ct += -1;
    # Read instruction
    if($ct < 0){
        $_ = <STDIN> ;
        chomp();
        if(/addx/){
            ($val) = $_ =~ /addx (\-?\d+)/;
            $ct = 1;
        }
    }
    # report part 1
    if($cyc == 20 | ($cyc-20) % 40 == 0){
        #print "Cyc: $cyc\tX: $x\tCt: $ct\n";
        $tot += $cyc * $x;
    }
    # draw CRT pixels part 2
    $pix = abs($x - (($cyc - 1) % 40)) <= 1 ? "#" : ".";
    print $pix;
    print "\n" if($cyc % 40 == 0);
    # update X
    $x += int($val) if($ct == 0);
    last unless($ct > 0 | defined $_);
}
print "TOTAL P1: $tot\n";