#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use autodie;
use File::Slurp;
use File::Basename;

my @files_to_process = ('debian-paketmanagement.adoc');
my $output = "= Summary\n\n";

while (@files_to_process) {
    my $file = shift @files_to_process;
    my $dir = dirname($file);
    $dir =~ s:^\./::;
    my @contents = read_file($file);

    # Check for title
    foreach my $line (read_file($file)) {
        if ($line =~ /^(={1,10})\s*([^=]+?)\s*=*\s*$/) {
            my $level = length($1)-1;
            $output .= '.'x$level . " link:$file\[$2\]\n";
            last;
        }
    }

    foreach my $line (reverse read_file($file)) {
        if ($line =~ /^include::(.*)\[\]/) {
            next if $1 eq 'version.adoc';
            unshift(@files_to_process, "$dir/$1");
        }
    }
}

say $output;
