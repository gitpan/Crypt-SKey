use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Crypt::SKey',
    'VERSION_FROM'	=> 'SKey.pm', # finds $VERSION
    'PREREQ_PM'		=> {Digest::MD4 => '',
			    Term::ReadKey => '',
			   },
);
