#!/usr/bin/perl


use strict;
use warnings;

#####Options#####
my $in_file = $ARGV[0];
##########

#####MAIN#####
my %hash = %{ &dragen2hash($in_file) };

print "Total reads:\t$hash{TOTAL}\n";
print "Mapped reads:\t$hash{MAPPED}\n";
print "Uniquely mapped reads:\t$hash{UNIQUE}\n";
print "Multi-mapped reads:\t$hash{MULTI}\n";
print "Unmapped reads:\t$hash{UNMAPPED}\n";
##########

#####SUB#####
#Reads a dragen output file and converts it into hash with accessible data
sub dragen2hash {
	if (@_ != 1) {
		die "USAGE: module dragen2hash requires one argument: <\$dragen_file>.\n";
	}
	
	#
	#Get file
	#
	my ($dragen_file) = @_;
	
	my %data = (
		'TOTAL' => "NA",
                'MAPPED' => "NA",
		'UNIQUE' => "NA",
		'MULTI' => "NA",
		'UNMAPPED' => "NA"
		);

	
	open (DRAGEN, "<", $dragen_file) or die "cannot open $dragen_file.\n";
	while (my $line = <DRAGEN>) {
		my $data = $line;
		$data =~ s/\r//sig;
		$data =~ s/\n//sig;
		if ($data !~ m/^MAPPING\/ALIGNING SUMMARY/) {
			next;
		}
		
		$data =~ s/ +/ /g; #ignores consecutive whitespaces 
		$data =~ s/ $//;   #removes the last space from each line
		
		my @data = split (/ /, $data);
		
		if ($data =~ m/Total input reads/) {
			$data{TOTAL} = $data[-2]/2;
			next;
		}
                elsif ($data =~ m/Mapped reads [0123456789]/) {
                        $data{MAPPED} = $data[-2];
                        next;
                }
		elsif ($data =~ m/Unmapped reads/ && $data{UNMAPPED} =~ m/NA/) {
			$data{UNMAPPED} = $data[-2];
		}
		elsif ($data =~ m/Reads with MAPQ \[ 0\:10\)/ && $data{MULTI} =~ m/NA/) {
			$data{MULTI} = $data[-2];
		}
		
		#print "$data\n";
	}
	close (DRAGEN);
	
	$data{UNIQUE} = $data{MAPPED} - $data{MULTI};
	
	return (\%data);
}
##########
__END__
