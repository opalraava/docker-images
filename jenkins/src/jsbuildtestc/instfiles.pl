use strict;
use warnings;

while (defined(my $line = <>))
{
    chomp $line;

    if (-d $line) {
	my $dir = substr($line, 5);
	$dir =~ s/\//\\/g;
	if ($dir ne "") {
	    print("  SetOutPath \$INSTDIR\\$dir\n");
	}
    }
    if (-f $line) {
	$line =~ s/\//\\/g;
	print("  File $line\n");
    }    
}
