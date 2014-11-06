#split -l 1000000 1_S1_L001_R1_001.sam 
#
#cat sam_header xab > test
#mv test xab
#cat sam_header xac > test
#mv test xac
#cat sam_header xad > test
#mv test xad
#cat sam_header xae > test
#mv test xae
#cat sam_header xaf > test
#mv test xaf
#cat sam_header xag > test
#mv test xag
#cat sam_header xah > test
#mv test xah
#cat sam_header xai > test
#mv test xai
#cat sam_header xaj > test
#mv test xaj
#cat sam_header xak > test
#mv test xak
#cat sam_header xal > test
#mv test xal
#cat sam_header xam > test
#mv test xam
#cat sam_header xan > test
#mv test xan
#
#perl parseSAMmiss.pl xaa > xaa.p
#perl parseSAMmiss.pl xab > xab.p
#perl parseSAMmiss.pl xac > xac.p
#perl parseSAMmiss.pl xad > xad.p
#perl parseSAMmiss.pl xae > xae.p
#perl parseSAMmiss.pl xaf > xaf.p
#perl parseSAMmiss.pl xag > xag.p
#perl parseSAMmiss.pl xah > xah.p
#perl parseSAMmiss.pl xai > xai.p
#perl parseSAMmiss.pl xaj > xaj.p
#perl parseSAMmiss.pl xak > xak.p
#perl parseSAMmiss.pl xal > xal.p
#perl parseSAMmiss.pl xam > xam.p
#perl parseSAMmiss.pl xan > xan.p
#cat x*.p > 1_S1_L001_R1_001.p
perl mapMUT.pl 1_S1_L001_R1_001.p ~/smarguer/SAM_GFF/gff_090511.txt > 1_S1_L001_R1_001.map
#rm -f x*
cp 1_S1_L001_R1_001.map ~/smarguer/
