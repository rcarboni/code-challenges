#!/usr/bin/perl

while( <STDIN> ) {
    ($cals) = $_ =~ /(\d+)/;
    $elf_cals += $cals;
    if(!/\d/ | eof){
        ++$elf;
        if($elf_cals > $max_elf_cals){
            ($max_elf, $max_elf_cals) = ($elf, $elf_cals) 
        }
        $elf_cals = 0; 
    }
}
print "Elf $max_elf has max $max_elf_cals\n";