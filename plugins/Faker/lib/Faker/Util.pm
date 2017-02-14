package Faker::Util;

use strict;
use Data::Dumper;
use base qw(Exporter);
use MT;

our @EXPORT_OK = qw(doLog dump);
our $plugin = MT->component('Faker');

# ログ出力
sub doLog {
    my ($msg) = @_;
    return unless defined($msg);
    
    use MT::Log;
    my $log = MT::Log->new;
    my $date = localtime(time);
    my $message = $plugin->name . '/' . $plugin->version . ' : ' . $msg . ' (' . $date . ')';
    $log->message($message);
    $log->save or die $log->errstr;
}

# ログ出力(コンソール用)
sub dump {
    my ($msg, $level) = @_;
    return unless defined($msg);
    
    if (!defined $level || ($level ne 'info' && $level ne 'error' && $level ne 'warning' && $level ne 'debug')) {
        $level = 'debug';
    }
    my $level_text = eval($level);
    
    my $date = localtime(time);
    my $message = $level_text . ' ';
    $message .= $plugin->name . '/' . $plugin->version . ' : ' . $msg . ' (' . $date . ')' . "\n";
    print $message;
}

sub debug {
    return '[' . "\x1b[32m" . 'DEBUG' . "\x1b[49m\x1b[39m" . ']';
}
sub info {
    return '[' . "\x1b[32m" . 'INFO' . "\x1b[49m\x1b[39m" . ']';
}
sub warning {
    return '[' . "\x1b[33m" . 'WARNING' . "\x1b[49m\x1b[39m" . ']';
}
sub error {
    return '[' . "\x1b[31m". 'ERROR' . "\x1b[49m\x1b[39m" . ']';
}
1;