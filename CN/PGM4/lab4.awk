BEGIN{
	pack1=0
	pack2=0
	time1=0
	time2=0
}{
if($1=="r" && $3=="_1_" && $4=="AGT"){
	pack1 = pack1 + $8
	time1 = $2
}
if($1=="r" && $3=="_2_" && $4=="AGT"){
        pack2 = pack2 + $8
        time2 = $2
}
}
END{
	printf("The throughput from n to n2: %f Mbps\n",( (pack1 * 8) / (time1 * 1000000)));
	printf("The throughput from n to n2: %f Mbps\n",( (pack2 * 8) / (time2 * 1000000)));
}
