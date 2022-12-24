#!/usr/bin/perl
# https://adventofcode.com/2022/day/12
# --- Day 12: Hill Climbing Algorithm ---

package elves;
my ($r, $c, $sr, $sc, $er, $ec) = (0, 0, 0, 0, 0, 0);
our @grid = ();
our @starts = ();
while( <STDIN> ) {
    chomp();
    print "$r: $_\n";
    my $c = 0;
    while (/(.)/g) {
        $val = $1;
        ($sr, $sc, $val) = ($r, $c, 'a') if($1 eq 'S');
        ($er, $ec, $val) = ($r, $c, 'z') if($1 eq 'E'); 
        if($val eq 'a'){
            push @starts, ($c, $r);
        }
        # order in alphabet  
        $val = ord($val) & 31;
        $elves::grid[$c][$r] = $val;
        $c++
    }
    $r++;
} 
my $ncol = $#grid;
my $nrow = $#{$grid[0]};

# view grid
print "S: $sr $sc, E: $er $ec\n";
foreach $r (0..$nrow){
    #print @{$grid[$r]}, "\n";
    foreach $c (0..$ncol){
        print "$elves::grid[$c][$r] ";
    }
    print "\n";
}

# iterate over starts
my $min_start = 9999;
while (my($sc, $sr) = splice(@starts, 0, 2)) {
    print "STARTING: $sc, $sr\n";
    my @q = ();
    my %visited = {};
    push @q, (0,$sc,$sr);
    $visited{sprintf('%d_%d', $sc, $sr)}++;
    while (my($ct, $ic, $ir) = splice(@q, 0, 3)) {
        # print "\tExplore: $ic, $ir (", $elves::grid[$ic][$ir], ") - ct: $ct\n";
        if($ic == int($ec) & $ir == int($er)){
            print "\tFOUND END: $ct\n";
            $min_start = $ct if($ct < $min_start);
        }
        foreach $ref ([0,-1],[0,1],[-1,0],[1,0]){
            my($y, $x) = @$ref;
            next unless($ic + $x <= $ncol & $ic + $x >= 0 & $ir + $y <= $nrow & $ir + $y >= 0);
            next if($visited{sprintf('%d_%d', $ic+$x, $ir+$y)} > 0);
            next if($elves::grid[$ic+$x][$ir+$y] > $elves::grid[$ic][$ir] + 1);
            $visited{sprintf('%d_%d', $ic+$x, $ir+$y)}++;
            push @q, ($ct+1, $ic+$x, $ir+$y);
        }
    }
}
print "MIN STEPS: $min_start\n";


