use strict;
use warnings;
use Test::More;
use Test::Requires qw/ JSON Moose /; # JSON first; faster failover

{
	package Local::Class;
	use Acme::MooseX::JSON;
	has aaa => (
		is    => 'rw',
		isa   => 'ArrayRef',
	);
}

sub checker
{
	plan tests => 3;
	my $o1 = Local::Class->new(aaa => [1,2,3]);
	is($$o1, '{"aaa":[1,2,3]}', 'Object is internally JSON');
	is_deeply($o1->aaa, [1,2,3]);
	$o1->aaa([4,5,6]);
	is_deeply($o1->aaa, [4,5,6]);
}

subtest "Mutable class" => \&checker;

Local::Class->meta->make_immutable;
subtest "Immutable class" => \&checker;

done_testing;
