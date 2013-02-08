use strict;
use warnings;
use Test::More;
use Test::Requires 'JSON';

use t::Accessors;

my $class = 'Scalar::Accessors::LikeHash::JSON';

subtest(
	"Accessors provided by $class work as expected",
	t::Accessors->checker($class),
);

my $j = $class->new;
$j->store(xxx => [1,2,3]);
is(
	$$j,
	'{"xxx":[1,2,3]}',
	"$class stores its internals as correctly formatted JSON",
);

done_testing;
