use strict;
use warnings;
use v5.32;
use Set::Scalar;
use List::Util qw(sum);
use Array::Utils qw(intersect);

open my $fh, "<", "inpute";
$/ = "\n\n";
my @groups = <$fh>;

sub s1 {

    sub counts {
        my @chars = split //, $_;
        my $s     = Set::Scalar->new(@chars)->size();
    }

    my @groups = @groups;
    s/\n//g foreach @groups;
    my @counts = map { counts } @groups;
    say "p1: " . sum @counts;
}
s1;

sub s2 {

    sub seats_intersect {
        my @seats   = split "\n", $_;
        my @similar = split( //, shift(@seats) );
        while ( scalar @seats ) {
            my @current = split( //, shift(@seats) );
            @similar = intersect( @similar, @current );
        }
        return scalar @similar;
    }

    my @c = map { seats_intersect } @groups;
    say "s2: " . sum @c;
}
s2;
