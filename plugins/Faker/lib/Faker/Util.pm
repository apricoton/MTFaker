package Faker::Util;

use strict;
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
    
    my $date = localtime(time);
    my $message = '';
    if (defined $level) {
        $message .= '[' . "\x1b[45m\x1b[37m" . uc($level) . . "\x1b[49m\x1b[39m" . '] ';
    }
    $message .= $plugin->name . '/' . $plugin->version . ' : ' . $msg . ' (' . $date . ')' . "\n";
    print $message;
}

1;