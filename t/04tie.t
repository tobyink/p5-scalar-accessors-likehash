use strict;
use warnings;
use Test::More;
use Test::Requires qw/ JSON /;

use Tie::Hash::SerializedString;

my $str  = '{}';
tie my %hash, 'Tie::Hash::SerializedString', \$str;

$hash{foo} = "bar";
is($str, '{"foo":"bar"}', 'tie mechanism seems to work');

my $str2 = %hash;
is($str2, '{"foo":"bar"}', '%hash in scalar context works');

$hash{baz} = "quux";

is_deeply(
	[keys %hash],
	[qw/ baz foo /],
	'keys %hash',
);

is_deeply(
	[values %hash],
	[qw/ quux bar /],
	'values %hash',
);

done_testing;
