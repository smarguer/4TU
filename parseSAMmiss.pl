#!/usr/bin/perl
use strict;
use warnings;
use Benchmark;
use Data::Dumper;
use POSIX qw(strftime);

if (@ARGV != 1) {die "need 1 name";}
(my $sam)=@ARGV;
my %status;
my $n=0;
my $line;
my @holder;
my %wt;
my %mut;
###EXTRACT MUTATIONS
#
#use sam3tsv.java

$status{$n}=system "/data01/software/jvarkit/dist/sam2tsv -r ~/smarguer/SAM_GENOMES/ALLchromosomes.090511.chr.fa ".$sam."  > ".$sam.'.sam2tsv';
die "Problem stage $n" if $status{$n}; $n++;

###PARSE output###

open (IN, "$sam.sam2tsv") or die "could not find the tmp file";
open (OUT, ">", "$sam.parsed") or die 'could not open output file';

while ($line=<IN>)
{
 chomp ($line);
 @holder = split (/\t/, $line);
 if ($holder[4] ne uc($holder[7]))
 {
  if($holder[8] eq "M")
  {
   my $strand='-';
   if($holder[1] == 16)
   {
    $strand='+';
   }
   print OUT "$line\n";
   $wt{"$holder[6]".'.'."$holder[2]".'.'."$strand"}=0;
   $mut{"$holder[6]".'.'."$holder[2]".'.'."$strand"}++;
  }
 }
}
close IN;
close OUT;
open (IN, "$sam.sam2tsv") or die "could not find the tmp file";
#open (OUT, ">", "$sam.reject") or die 'could not open output file';
while ($line=<IN>)
{
 chomp ($line);
 @holder = split (/\t/, $line);
 my $strand='-';
 if($holder[1] == 16)
 {
  $strand='+';
 }
 if (exists $wt{"$holder[6]".'.'."$holder[2]".'.'."$strand"})
 {
   $wt{"$holder[6]".'.'."$holder[2]".'.'."$strand"}++;
 }
# else
# {
#  print OUT "$line\n";
# }
}
close IN;
#close OUT;

$status{$n}=system "rm -f ".$sam.'.sam2tsv';

open (IN, "$sam.parsed") or die "could not find the tmp file";

my %count; 
my @BASE=("REF","A","T","C","G");

while ($line=<IN>)
{
 chomp ($line);
 @holder = split (/\t/, $line);
 my $strand='-';
 if($holder[1] == 16)
 {
  $strand='+';
 } 
 $count{"$holder[6]".'.'."$holder[2]".'.'."$strand"}{uc($holder[4])}++;
 $count{"$holder[6]".'.'."$holder[2]".'.'."$strand"}{REF} = uc($holder[7]);
}
foreach my $out (keys %count)
{
 print "$out\t";
 foreach my $out1 (@BASE)
 {
  unless (defined($count{$out}{$out1}))
  {
   print "0\t";
  }
  else
  {
   print "$count{$out}{$out1}\t";
  }
 }
 print "$wt{$out}\t";
 print "$mut{$out}";
 print "\n";
}

$status{$n}=system "rm -f ".$sam.'.parsed';
die "Problem stage $n" if $status{$n}; $n++;

