# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..7\n"; }
END {print "not ok 1\n" unless $::loaded;}
use strict;
use Crypt::SKey qw(key compute);
$::loaded = 1;
&report_result(1);

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

{
  my $line = compute(50, 'fo099804', 'pwd');
  &report_result($line eq 'HESS SWIM RAYS DING MOAT FAWN', $line);
}

{
  my @lines = compute(50, 'fo099804', 'pwd', 4);
  &report_result($lines[0] eq 'THUD HERE THAN VASE ROTH BOAT', $lines[0]);
  &report_result($lines[1] eq 'FEED SLY COOL CORN ACTS ROOK',  $lines[1]);
  &report_result($lines[2] eq 'LAB TERN BLUE CLAN EVEN SLED',  $lines[2]);
  &report_result($lines[3] eq 'HESS SWIM RAYS DING MOAT FAWN', $lines[3]);
}

{
  print "Testing interactive mode: enter 'pwd' (without quotes) at the prompt:\n";
  local @ARGV = (50, 'fo099804');
  my $got = key;
  my $expect = 'HESS SWIM RAYS DING MOAT FAWN';
  print "You should see the output '$expect'.\n";
  &report_result($got eq $expect, $got);
}

##################################################################
sub report_result {
  my $bad = !shift;
  use vars qw($TEST_NUM);
  $TEST_NUM++;
  print "not "x$bad, "ok $TEST_NUM\n";
  
  print "$_[0]\n" if ($bad and $ENV{TEST_VERBOSE});
}
