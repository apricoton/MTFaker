package Faker::Cmd;

use strict;
use utf8;
use Data::Dumper;
use MT;
use Faker::Util qw(doLog dump);

our $plugin = MT->component('Faker');

sub main () {
    my ($blog, $options) = @_;
    
    dump('test', 'info');
}