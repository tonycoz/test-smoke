#! /usr/bin/perl -w
use strict;

# $Id$

use Test::More tests => 9;
my $verbose = 0;

use FindBin;
use lib $FindBin::Bin;
use TestLib;

use_ok "Test::Smoke::SysInfo";

{
    local $^O = 'Generic';
    my $si = Test::Smoke::SysInfo->new;

    isa_ok $si => 'Test::Smoke::SysInfo';
    ok $si->cpu_type, $si->cpu_type;
    ok $si->cpu, $si->cpu;
    is $si->ncpu, '', "no ncpu";
}

{
    my $si = Test::Smoke::SysInfo->new;

    isa_ok $si => 'Test::Smoke::SysInfo';
    ok $si->cpu_type, "cpu_type: " . $si->cpu_type;
    ok $si->cpu,      "cpu: " . $si->cpu;
    ok $si->ncpu,     "number of cpus: " . $si->ncpu;
}
