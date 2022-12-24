#!/usr/bin/perl
# https://adventofcode.com/2022/day/20
# cpanm Tie::IxHash
# use warnings;
# use strict;

use Tie::IxHash;
tie %ins, "Tie::IxHash";

while( <STDIN> ) {
    /([-\d]+)/;
    $ins{int($1)} = $i++;
}

foreach $k (keys %ins){
    print "$k: ", $ins{$k},"\n";
}

# moves
$sz = scalar keys %ins;
print "Size: $sz\n";
foreach $k (keys %ins ) {
    $v = $ins{$k};
    my @imp = ();
    next if($k == 0);
    $dir = $k > 0 ? 1 : -1;
    $of = ($v + $k) <= 0 | ($v + $k) >= $sz;
    # increase by 1 if overflows
    $steps = $of ? $k + $dir : $k;
    $old_pos = $v;
    $new_pos = ($v + $steps) % $sz;
    $impact = $of & $dir == 1? 1 : -1;
    push @imp, $old_pos, $new_pos;
    @imp = sort {$a <=> $b} @imp;
    print "Key: $k, Idx: $old_pos, New Pos: $new_pos, Imp: ", @imp, "\n";
    $ins{$k} = $new_pos;
    # adjust indexes in impacted range
    # SLOW have to search for impacted
    $num_impacted = $imp[1] - $imp[0] + 1;
    $ct_impacted = 0;
    foreach $i (keys %ins){
        if($ins{$i} >= $imp[0] & $ins{$i} <= $imp[1] & $i != $k){
            print "\tImp: $i from $ins{$i}, to: ";
            $ins{$i} += $impact;
            last if(++$ct_impacted == $num_impacted);
            print "$ins{$i}\n";
        }
    }
}
print "0 VALUE INDEX: $ins{0}\n";
for $j (1000, 2000, 3000){
    foreach $i (keys %ins){
        if($ins{$i} == ($ins{0} + $j) % $sz){
            print "${j}th: $i\n";
            $answer += $i;
            last;
        }
    }
}
print "Answer: $answer\n";



