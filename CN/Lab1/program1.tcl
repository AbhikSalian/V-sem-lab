set ns [new Simulator]

set nf [open program1.nam w]
$ns namtrace-all $nf


set tf [open program1.tr w]
$ns trace-all $tf

proc finish { } {
global ns tf nf
$ns flush-trace
close $nf
close $tf
exec nam program1.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

$ns duplex-link $n0 $n1 1Mb 2ms DropTail
$ns duplex-link $n1 $n2 512Kb 10ms DropTail

$ns queue-limit $n0 $n1 2

set u [new Agent/UDP]
$ns attach-agent $n0 $u

set n [new Agent/Null]
$ns attach-agent $n2 $n

set cb [new Application/Traffic/CBR]
$cb attach-agent $u
$cb set packetSize_ 500
$cb set interval_ 0.005

$ns connect $u $n

$ns at 0.1 "$cb start"
$ns at 1.0 "finish"

$ns run
