#!/usr/bin/perl
# https://adventofcode.com/2022/day/8

my @h = (0,0);
my @t = (0,0);

while( <STDIN> ) {
    chomp();
    ($d, $s) = $_ =~ /([UDLR])\s(\d+)/;
    $idx = $d =~ /[LR]/ ? 0 : 1;
    $mdir = $d =~ /[RU]/ ? 1 : -1;
    # STEP
    print "$d\t$s\n";
    for my $i (1..int($s)){
        $h[$idx] += $mdir;
        print "\tH: ", @h, " ";
        # if now drifted 2 spaces away
        if(abs($h[$idx] - $t[$idx]) == 2){
            # tail needs to follow along axis of last head step
            $t[$idx] += $mdir;
            # the other axis is always equal after moving
            $t[($idx + 1) % 2] = $h[($idx + 1) % 2];
        }
        print "\tT: ", @t, "\n";
        # record tail position
        $visited{sprintf('%d_%d', $t[0], $t[1])}++;
    }    
}
print "TAIL VISITED: ", scalar (keys %visited), "\n";
