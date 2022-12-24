#!/usr/bin/perl

my $top_n = 3;
while( <STDIN> ) {
    ($cals) = $_ =~ /(\d+)/;
    $elf_cals += $cals;
    if(!/\d/ | eof){
        push @top, $elf_cals;
        if($i++ >= $top_n){
            @top = sort { $a <=> $b } @top;
            shift @top;
        }
        $elf_cals = 0; 
    }
}
foreach $j (@top) {
    $sum += $j;
    print "Elf: $j\n"
}
print "Total Sum = $sum\n";