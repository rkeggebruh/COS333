#!/usr/bin/perl

use strict;
use warnings;

# Prompt the user for input file
print "Enter the input file name: ";
my $input_file = <STDIN>;
chomp $input_file;

# Check if the input file exists
unless (-e $input_file) {
    die "Error: File '$input_file' not found. Please try again.\n";
}

# Prompt the user for the word to search
print "Enter the word to search: ";
my $word_to_search = <STDIN>;
chomp $word_to_search;

# Open file or exit with error
open(my $fh, '<', $input_file) or die "Error: Cannot open file '$input_file': $!\n";

# Read file contents
my $file_contents = do { local $/; <$fh> };

# Convert to lowercase and strip non-alphabetic characters
$file_contents =~ tr/A-Za-z//cd;
$file_contents = lc $file_contents;

# Count occurrences of the word in reverse order
my $matches = () = reverse($file_contents) =~ /\Q$word_to_search\E/g;

# Output the result
print "Matches: $matches\n";
