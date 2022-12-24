#!/usr/bin/perl
# https://adventofcode.com/2022/day/8


my @rope;
my $knots = 9;
my $track = $knots;

for my $k (0..$knots-1){
    push @rope, [0,0];
}

for my $k (0..$knots-1){
    print $rope[$k][0],"\n" ;
}

while( <STDIN> ) {
    chomp();
    ($d, $s) = $_ =~ /([UDLR])\s(\d+)/;
    $idx = $d =~ /[LR]/ ? 0 : 1;
    $mdir = $d =~ /[RU]/ ? 1 : -1;
    # STEP
    print "$d\t$s\n";
    for my $i (1..int($s)){
        # Move Head
        $rope[0][$idx] += $mdir;
        print "\tH: ", @{$rope[0]}, " ";
        # each knot
        for my $k (1..$knots-1){
            # if now drifted 2 spaces away
            if(abs($rope[$k-1][$idx] - $rope[$k][$idx]) == 2){
                # tail needs to follow along axis of last head step
                $rope[$k][$idx] += $mdir;
                # the other axis is always equal after moving
                $rope[$k][($idx + 1) % 2] = $rope[$k-1][($idx + 1) % 2];
            }
            # record tail position
            if($k == $track - 1){
                print "\tT: ", @{$rope[$k]}, "\n";
                $visited{sprintf('%d_%d', $rope[$k][0], $rope[$k][1])}++ ;
            }
        }
    }    
}
print "TAIL VISITED: ", scalar (keys %visited), "\n";
