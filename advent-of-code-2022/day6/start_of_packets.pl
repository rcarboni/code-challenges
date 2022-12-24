#!/usr/bin/perl
# https://adventofcode.com/2022/day/6

# my $seq_len = 4; # Part 1
my $seq_len = 14; # Part 2

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

while( <STDIN> ) {
    $i = 0;
    @seq = ();
    print "$_\n";
    while (/(.)/g) {
        push @seq, $1;
        if(++$i >= $seq_len){
            last if(scalar uniq(@seq) == $seq_len);
            shift @seq;
        }
    }
    print "$i\n";
}   