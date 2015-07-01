#!/usr/bin/env perl

use strict;
use warnings;
use POSIX;

my $n_pags = `pdfinfo "$ARGV[0]" | grep Pages`;
$n_pags =~ s/\w+//;
$n_pags =~ s/://;
$n_pags =~ s/ +//;

my $l_center = 2*ceil($n_pags/4);
my $r_center = $l_center + 1;
my $pg_counter = 1;

while ($l_center > 0) {
  print `pdfseparate -f $l_center -l $l_center "$ARGV[0]" tmp_$pg_counter.pdf`;
  $pg_counter++;
  if ($r_center > $n_pags) {
    `cp Capa/Vazia.pdf tmp_$pg_counter.pdf`;
  } else {
    print `pdfseparate -f $r_center -l $r_center "$ARGV[0]" tmp_$pg_counter.pdf`;
  }
  $pg_counter++;
  $l_center--;
  $r_center++;

  if ($r_center > $n_pags) {
    `cp Capa/Vazia.pdf tmp_$pg_counter.pdf`;
  } else {
    print `pdfseparate -f $r_center -l $r_center "$ARGV[0]" tmp_$pg_counter.pdf`;
  }
  $pg_counter++;
  print `pdfseparate -f $l_center -l $l_center "$ARGV[0]" tmp_$pg_counter.pdf`;
  $pg_counter++;

  $l_center--;
  $r_center++;
}

`pdfunite tmp* out.pdf`;
my $pdf_list =  `ls -v tmp*`;
`pdfunite \$(ls -v tmp*) out.pdf`;
`pdfnup --nup 2x1 out.pdf 2> /dev/null`;
`mv out-nup.pdf "$ARGV[0]"`;
`rm tmp*`;
`rm out.pdf`;
