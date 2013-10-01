# Date: Sep. 30 2013
# READ FILE
# my $input_file = "/path/to/my/file"; 
# open( my $input_fh, "<", $input_file ) || die "Can't open $input_file: $!";

# WRITE FILE
#open (MYFILE, '>>data.txt');
#print MYFILE "\n>\nBailey1\n";
#print MYFILE "\n>\nBailey2\n";
#print MYFILE "\n>\nBailey3\n";
#close (MYFILE);

my $query_seq_dir = "C:\Users\zz\workspace\perl";

my $input_file = "add_euk.fasta";
#my $input_file = "data.txt";
open (MYFILE, "< $input_file") || die "Can't open $data.txt: $!";

my $id;
my $seq;
my $tmpid;
my $tmpseq;
my $first_seq = "true";
		
while(<MYFILE>){
	my $line = $_;			# line = read one line
	
	$line =~ s/\n//;		#connect one line to the next line
	if(length($line) <= 0){	# skip the blank line
		next;
	}
	$tmpid = $id;
	$tmpseq = "$seq";
	if($line =~ />/){ 		# if match '>' ?
		if($first_seq eq "false"){
			
			$seq = "";
			print "$tmpid\n";
			print "$tmpseq\n";
		}
		
		if($first_seq eq "true"){
			$first_seq = "false";
		}
		$id = substr($line, 1, 6);
	}
	else{
		$seq = $seq.$line;
		$seq =~ s/\n//;;
	}
}
print "$tmpid\n";
print "$tmpseq";
close (MYFILE);