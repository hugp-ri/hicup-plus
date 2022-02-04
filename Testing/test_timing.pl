#!/usr/bin/perl

use strict;
use warnings;
use Time::HiRes;

my $start_time = [Time::HiRes::gettimeofday()];
sleep 1;
my $diff = Time::HiRes::tv_interval($start_time);

print "\n\n$diff\n";
