#!/usr/bin/env perl
use warnings;
use strict;
chdir("public");
# Set $verbose to a true value if you need to debug this script.
my $verbose;
use File::Find;
find (\&wanted, ("."));
sub wanted
{
    if (/(.*\.(?:html|css|js)$)/) {
        my $gz = "$_.gz";
        if (-f $gz) {
            if (age ($_) <= age ($gz)) {
                if ($verbose) {
                    print "Don't need to compress $_\n";
                }
                return;
            }
        }
        if ($verbose) {
            print "Compressing $_\n";
        }
        # The following substitution is for the case that the file
        # name contains double quotation marks ".
        $_ =~ s/"/\\"/g;
        # Now compress the file.
        system ("cat \"$_\" | gzip --best --force > \"$_\".gz");
    }
    else {
        if ($verbose) {
            print "Rejecting $_\n";
        }
    }
}

# This returns the age of the file.

sub age
{
    my ($file) = @_;
    my @stat = stat $file;
    return $stat[9];
}
