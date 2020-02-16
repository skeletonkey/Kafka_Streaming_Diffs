#!/usr/local/bin/perl

use strict;
use warnings;

use JSON;
use Net::WebSocket::Server;

print "Starting Websocket Server\n";
#Config
my $port = 22000; #Websocket Port
my $timeInterval = 2; #Seconds
my @seat_status = qw(Open Hold Sold);

use Net::WebSocket::Server;

Net::WebSocket::Server->new(
    listen => $port,
    on_connect => sub {
        my ($serv, $conn) = @_;
        $conn->on(
            utf8 => sub {
                my ($conn, $msg) = @_;
                print "Message received: $msg\n";
                $conn->send_utf8(send_seat_map());
            },
        );
    },
)->start;
print "Finished RUnning\n";


sub send_seat_map {
    print ("Generating Seat Map\n");
    my %seat_map = ( event_id => 123455, seats => []);

    foreach my $seat_number (1..3) {
        foreach my $row_number (1..3) {
            push(@{$seat_map{seats}}, {
                row    => $row_number,
                seat   => $seat_number,
                status => $seat_status[int(rand(3))],
            });
        }
    }

    # use Data::Dumper;
    # print "Before decoding: " . Dumper(\%seat_map) . "\n";
    my $json = encode_json(\%seat_map);

    print "Sending: $json\n";
    return $json;
}