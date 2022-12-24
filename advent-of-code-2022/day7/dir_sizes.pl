#!/usr/bin/perl

my %file_sizes = ();
while( <STDIN> ) {
    # UPDATE CURRENT PATH
    if(/^\$\s+cd\s+/){
        ($cd) = /^\$\s+cd\s+(\S+)/;
        if($cd eq '/'){
            $cur_path = '';
        } elsif($cd eq '..'){
            $cur_path =~ s/\/[^\/]+$//;
        } else {
            $cur_path = $cur_path . "/" . $cd;
        }
    # STORE FILE SIZE
    } elsif(/^\d/){
        ($sz, $file) = /^(\d+)\s(\S+)/;
        $file_sizes{$cur_path . "/" . $file} = int($sz);
    }
}

# Tally Dir Sizes
my %dir_sizes = ();
foreach $i (keys %file_sizes){
    print "$i: $file_sizes{$i}\n";
    $j = $i;
    while(1){
        # cd ..
        $j =~ s/\/[^\/]+$//;
        $dir_sizes{$j} += $file_sizes{$i};
        print "\tAdding to $j\n";
        last if($j eq '');
    }
}

# Sum of dir sizes
foreach $i (keys %dir_sizes){
    next if($dir_sizes{$i} > 100000);
    print "$i: $dir_sizes{$i}\n";
    $total += $dir_sizes{$i};
}
print "TOTAL (part1): $total\n";

# part 2
$min_needed_space = 30000000 - (70000000 - $dir_sizes{""});
print "NEED: $min_needed_space\n";
@sizes = values %dir_sizes;
foreach $i (sort { $a <=> $b } @sizes){
    $delete = $i;
    last if($i >= $min_needed_space)
}
print "DELETE SIZE: $delete\n";