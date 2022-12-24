#!/usr/bin/perl
# https://adventofcode.com/2022/day/3

use String::LCSS_XS 'lcss';

while( <STDIN> ) {
  $a = substr($_, 0, length()/2);
  $b = substr($_, length()/2, length()/2);
  # repeated value in two halfs
  $rep = lcss ($a, $b);
  # position in alphabet
  $val = ord($rep) & 31;
  # if uppercase
  $val += 26 if($rep =~ /[A-Z]/);
  $total += $val;
}
print "Total: $total";