#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/array-init.dt -o array-init `;
is_deeply(\@res, [], 'No compilation errors');
@res = `./array-init`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ (1..9) ], 'Got correct results');

`rm array-init`;

1;