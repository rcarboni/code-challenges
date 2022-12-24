#!/usr/bin/perl
# https://adventofcode.com/2022/day/3

use String::LCSS_XS 'lcss';

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

while( <STDIN> ) {
  $i++;
  if($i % 3 == 1){
    (@a) = $_ =~/(.)/g;
  } else {
    (@b) = $_ =~/(.)/g;
    # find common letters between @a and @b
    %count = ();
    foreach $e (uniq(@a), uniq(@b)) {$count{$e}++}
    # replace @a with the common letters
    @a = ();
    foreach $e (keys %count) {
        push @a, $e if($count{$e} > 1);
    }
  }
  
  # Tally Group
  if($i % 3 == 0){
    # add value of mutual letter
    $val = ord($a[0]) & 31;
    $val += 26 if($a[0] =~ /[A-Z]/);
    $total += $val;
  }
}

print "Total: $total";