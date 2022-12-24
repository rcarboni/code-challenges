#!/usr/bin/perl
# https://adventofcode.com/2022/day/11
use POSIX qw/floor/;

my (%items, %op, %modtest, %tt, %ff, %processed);
while( <STDIN> ) {
    next unless(($monkey) = $_ =~ /^Monkey (\d+)/);
    $monkey = int($monkey);
    (@{$items{$monkey}}) = <STDIN> =~ /(\d+)/g;
    ($op{$monkey}) = <STDIN> =~ /Operation: (.+)/;
    $op{$monkey} =~ s/(old|new)/\$$1/g;
    ($modtest{$monkey}) = <STDIN> =~ /(\d+)/;
    ($tt{$monkey}) = <STDIN> =~ /If true.*?(\d+)/;
    ($ff{$monkey}) = <STDIN> =~ /If false.*?(\d+)/;
}
# PROCESS MONKEYS OVER 20 ROUNDS
foreach $n (1..20){
    foreach $m (0..$monkey){
        while($old = shift @{$items{$m}}){
            $processed{$m}++;
            eval $op{$m};
            $new = floor($new / 3);
            # throw to next monkey
            $pass_to = $new % $modtest{$m} == 0 ? $tt{$m} : $ff{$m};
            push @{$items{$pass_to}}, $new;
        }
    }
}
foreach $m (sort {$a <=> $b} keys %processed){
    print "MONKEY $m: $processed{$m}\n";
}
@mb = sort {$b <=> $a} values %processed;
print "Monkey Business: ", $mb[0] * $mb[1], "\n";
