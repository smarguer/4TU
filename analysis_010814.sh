perl parseSAMmiss.pl xaa > xaa.p
perl parseSAMmiss.pl xab > xab.p
perl parseSAMmiss.pl xac > xac.p
perl parseSAMmiss.pl xad > xad.p
perl parseSAMmiss.pl xae > xae.p
perl parseSAMmiss.pl xaf > xaf.p
perl parseSAMmiss.pl xag > xag.p
perl parseSAMmiss.pl xah > xah.p
perl parseSAMmiss.pl xai > xai.p
perl parseSAMmiss.pl xaj > xaj.p
perl parseSAMmiss.pl xak > xak.p
perl parseSAMmiss.pl xal > xal.p
perl parseSAMmiss.pl xam > xam.p
perl parseSAMmiss.pl xan > xan.p
cat x*.p > all.p
perl mapMUT.pl all.p ~/smarguer/SAM_GFF/gff_090511.txt > all.map

