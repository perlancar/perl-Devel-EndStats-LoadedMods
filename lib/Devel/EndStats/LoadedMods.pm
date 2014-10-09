package Devel::EndStats::LoadedMods;

# DATE
# VERSION

END {
    print "# BEGIN stats from Devel::EndStats::LoadedMods\n";
    for my $file (sort keys %INC) {
        next if $file =~ m!^/!;
        my $pkg = $file; $pkg =~ s!/!::!g; $pkg =~ s/\.pm$//;
        my $ver = ${"$pkg\::VERSION"};
        $ver = 'undef' unless defined $ver;
        print "$pkg ($ver)\n";
    }
    print "# END stats\n";
}

1;
# ABSTRACT: Display run time and dependencies after running code

=head1 SYNOPSIS

 # from the command line
 % perl -MDevel::EndStats::LoadedMods script.pl

 ##### sample output #####
 <normal script output, if any...>

 # BEGIN stats from Devel::EndStats::LoadedMods

 # END stats


=head1 DESCRIPTION

This module installs an END block to dump a list of loaded modules with their
versions. It simply lists the content of C<%INC> keys, with versions taken from
corresponding C<$VERSION> package variables. The output is easily diff-able.

I first wrote this to debug why my script doesn't work when run under cron
(using system perl) but works when run under my shell (using perlbrew's perl).


=head1 SEE ALSO

There are probably already existing modules on CPAN when I wrote this module,
but I couldn't find them.

Related modules to print information at the end of program run:
L<Devel::EndStats>.
