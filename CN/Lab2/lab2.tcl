set ns [ new Simulator ]
set nf [ open lab2.nam w ]
$ns namtrace-all $nf
set tf [ open lab2.tr w ]
$ns trace-all $tf

set n0 [ $ns node ]
set n1 [ $ns node ]
set n2 [ $ns node ]
set n3 [ $ns node ]
set n4 [ $ns node ]
set n5 [ $ns node ]

$ns duplex-link $n0 $n4 100Kb 1ms DropTail
$ns duplex-link $n1 $n4 100Kb 1ms DropTail
$ns duplex-link $n2 $n4 100Kb 1ms DropTail
$ns duplex-link $n3 $n4 100Kb 1ms DropTail
$ns duplex-link $n4 $n5 100Kb 1ms DropTail

set p1 [new Agent/Ping]
$ns attach-agent $n0 $p1
$p1 set packetSize_ 50000
$p1 set interval_ 0.0001
set p2 [new Agent/Ping]
$ns attach-agent $n1 $p2
set p3 [new Agent/Ping]
$ns attach-agent $n2 $p3
$p3 set packetSize_ 30000
$p3 set interval_ 0.00001
set p4 [new Agent/Ping]
$ns attach-agent $n3 $p4
set p5 [new Agent/Ping]
$ns attach-agent $n5 $p5
$ns queue-limit $n0 $n4 5
$ns queue-limit $n2 $n4 3
$ns queue-limit $n4 $n5 2

Agent/Ping instproc recv { from rtt } {
$self instvar node_
puts "node [ $node_ id ] received answer from $from with round trip time $rtt msec"}

$ns connect $p1 $p5
$ns connect $p3 $p4
proc finish { } {
global ns nf tf
$ns flush-trace
close $nf
close $tf
exec nam lab2.nam &
exit 0
}

$ns at 0.1 "$p1 send"
$ns at 0.2 "$p1 send"
$ns at 0.3 "$p1 send"
$ns at 0.4 "$p1 send"
$ns at 0.5 "$p1 send"
$ns at 0.6 "$p1 send"
$ns at 0.7 "$p1 send"
$ns at 0.8 "$p1 send"
$ns at 0.9 "$p1 send"
$ns at 0.10 "$p1 send"
$ns at 0.11 "$p1 send"
$ns at 0.12 "$p1 send"
$ns at 0.13 "$p1 send"
$ns at 0.14 "$p1 send"
$ns at 0.15 "$p1 send"
$ns at 0.16 "$p1 send"
$ns at 0.17 "$p1 send"
$ns at 0.18 "$p1 send"
$ns at 0.19 "$p1 send"
$ns at 0.20 "$p1 send"
$ns at 0.21 "$p1 send"
$ns at 0.22 "$p1 send"
$ns at 0.23 "$p1 send"
$ns at 0.24 "$p1 send"
$ns at 0.25 "$p1 send"
$ns at 0.26 "$p1 send"
$ns at 0.27 "$p1 send"
$ns at 0.28 "$p1 send"
$ns at 0.29 "$p1 send"

$ns at 0.1 "$p3 send"
$ns at 0.2 "$p3 send"
$ns at 0.3 "$p3 send"
$ns at 0.4 "$p3 send"
$ns at 0.5 "$p3 send"
$ns at 0.6 "$p3 send"
$ns at 0.7 "$p3 send"
$ns at 0.8 "$p3 send"
$ns at 0.9 "$p3 send"
$ns at 0.10 "$p3 send"
$ns at 0.11 "$p3 send"
$ns at 0.12 "$p3 send"
$ns at 0.13 "$p3 send"
$ns at 0.14 "$p3 send"
$ns at 0.15 "$p3 send"
$ns at 0.16 "$p3 send"
$ns at 0.17 "$p3 send"
$ns at 0.18 "$p3 send"
$ns at 0.19 "$p3 send"
$ns at 0.20 "$p3 send"
$ns at 0.21 "$p3 send"
$ns at 0.22 "$p3 send"
$ns at 0.23 "$p3 send"
$ns at 0.24 "$p3 send"
$ns at 0.25 "$p3 send"
$ns at 0.26 "$p3 send"
$ns at 0.27 "$p3 send"
$ns at 0.28 "$p3 send"
$ns at 0.29 "$p3 send"
$ns at 3.0 "finish"
$ns run

