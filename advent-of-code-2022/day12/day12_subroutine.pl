#!/usr/bin/perl
# https://adventofcode.com/2022/day/12
# --- Day 12: Hill Climbing Algorithm ---

package elves;
my ($r, $c, $sr, $sc, $er, $ec) = (0, 0, 0, 0, 0, 0);
our @grid = ();
while( <STDIN> ) {
    print "$r: $_\n";
    my $c = 0;
    while (/(.)/g) {
        $val = $1;
        ($sr, $sc, $val) = ($r, $c, 'a') if($1 eq 'S');
        ($er, $ec, $val) = ($r, $c, 'z') if($1 eq 'E'); 
        # order in alphabet  
        $val = ord($val) & 31;
        $elves::grid[$c][$r] = $val;
        $c++
    }
    $r++;
} 
my $ncol = $#grid;
my $nrow = $#{$grid[0]};

print "S: $sr $sc, E: $er $ec\n";
# view grid
foreach $r (0..$nrow){
    #print @{$grid[$r]}, "\n";
    foreach $c (0..$ncol){
        print "$elves::grid[$c][$r] ";
    }
    print "\n";
}

sub find_shortest{
    my ($ct, $ic, $ir) = (int($_[0]), int($_[1]), int($_[2]));
    # print "CALL: ct: $ct, col: $ic, row: $ir \n";
    if($ic == int($ec) & $ir == int($er)){
        print "FOUND END: $ct\n";
        return $ct;
    }
    print "ON $ic $ir: ", $elves::grid[$ic][$ir] ,"\n";
    foreach $ref ([0,-1],[0,1],[-1,0],[1,0]){
        my($y, $x) = @$ref;
        next unless($ic + $x <= $ncol & $ic + $x >= 0 & $ir + $y <= $nrow & $ir + $y >= 0);
        # print "\tEval: ", $ic+$x, ", ",  $ir+$y, ": ", $elves::grid[$ic+$x][$ir+$y], " \n";
        next if($visited{sprintf('%d_%d', $ic+$x, $ir+$y)} > 0);
        next if($elves::grid[$ic+$x][$ir+$y] > $elves::grid[$ic][$ir] + 1);
        $visited{sprintf('%d_%d', $ic+$x, $ir+$y)}++;
        print "\tExplore: ", $ic+$x, ", ",  $ir+$y, ": ", $elves::grid[$ic+$x][$ir+$y], " \n";
        $ret = find_shortest($ct + 1, $ic + $x, $ir + $y);
        if($ret < $min_path){
            # print "Update min from $min_path to $ret\n";
            $min_path =  $ret;
        }
    }
    # print "CALL: ct: $ct, col: $ic, row: $ir RETURN: $min_path\n";
    return $min_path;
}

$visited{sprintf('%d_%d', $sc, $sr)}++;
$ans = find_shortest(0, $sc, $sr);
print "ANS: $ans\n";

