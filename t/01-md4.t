# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

use Test;

BEGIN { plan tests => 6 }

use strict;
use Crypt::SKey qw(key compute);
require 't/common.pl';

need_module('Digest::MD4');

ok(1);

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

{
  my $line = compute(50, 'fo099804', 'pwd');
  ok($line, 'HESS SWIM RAYS DING MOAT FAWN', $line);
}

{
  my @lines = compute(50, 'fo099804', 'pwd', 4);
  ok($lines[0], 'THUD HERE THAN VASE ROTH BOAT', $lines[0]);
  ok($lines[1], 'FEED SLY COOL CORN ACTS ROOK',  $lines[1]);
  ok($lines[2], 'LAB TERN BLUE CLAN EVEN SLED',  $lines[2]);
  ok($lines[3], 'HESS SWIM RAYS DING MOAT FAWN', $lines[3]);
}

