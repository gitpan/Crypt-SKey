use Test;

BEGIN { plan tests => 1 }

use strict;
use Crypt::SKey qw(key compute);
require "t/common.pl";

need_module('Term::ReadLine');

if (have_module('Digest::MD4')) {
  $Crypt::SKey::HASH = 'MD4';
} elsif (have_module('Digest::MD5')) {
  $Crypt::SKey::HASH = 'MD5';
} else {
  skip_test("Neither of Digest::MD4, Digest::MD5 is installed");
}

{
  warn "\nTesting interactive mode: enter 'pwd' (without quotes) at the prompt:\n";
  local @ARGV = (50, 'fo099804');
  my $got = key;
  my $expect = 'HESS SWIM RAYS DING MOAT FAWN';
  ok($got, $expect, $got);
}

