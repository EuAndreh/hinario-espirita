#!/usr/bin/env perl

use strict;
use warnings;

# if (undef $ARGV[0]) {
#   die "Faltou o nome da música como primeiro argumento.";
# }

my $titulo = `grep beginsong $ARGV[0]`;
$titulo =~ s/.*beginsong\{(.*?)\}.*/$1/;
$titulo =~ s/\n//g;

open my $fh, '<', $ARGV[0] or die "Can't open file $!";
my $letra = do { local $/; <$fh> };
close $fh;

$letra =~ s/\\\w+//g;
$letra =~ s/\\\[.*?\]//g;
$letra =~ s/\^//g;
$letra =~ s/.*\\bfseries.*//;
$letra =~ s/\{.*?\}//g;
$letra =~ s/\n\n/\n/g;
$letra =~ s/(.*)/  $1/g;

my $arquivo_ly = `basename $ARGV[0] .tex`;
$arquivo_ly =~ s/\n//;

`titulo="$titulo" letra="$letra" envsubst < template-lilypond.ly > LilyPond/$arquivo_ly.ly`;
print "Arquivo LilyPond/$arquivo_ly.ly gerado.\n"
