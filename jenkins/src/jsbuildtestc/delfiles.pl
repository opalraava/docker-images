use strict;
use warnings;

while (defined(my $line = <>))
{
    chomp $line;

    if (-d $line) {
	my $dir = substr($line, 5);
	$dir =~ s/\//\\/g;
	if ($dir ne "") {
	    print("  rmdir \"\$INSTDIR\\$dir\"\n");
	}
    }
    if (-f $line) {
	my $file = substr($line, 5);
	$file =~ s/\//\\/g;
	print("  delete \"\$INSTDIR\\$file\"\n");
    }    
}
