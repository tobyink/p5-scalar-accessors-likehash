use strict;
use warnings;
use Test::More;
use Test::Requires 'Sereal';

use t::Accessors;

my $class = 'Scalar::Accessors::LikeHash::Sereal';

subtest(
	"Accessors provided by $class work as expected",
	t::Accessors->checker($class),
);

my $j = $class->new;
$j->store(xxx => [1,2,3]);
is(
	$$j,
	"=srl\x{0001}\x{0000}(*\x{0001}cxxx(+\x{0003}\x{0001}\x{0002}\x{0003}",
	"$class stores its internals as correctly formatted Sereal",
);

done_testing;
