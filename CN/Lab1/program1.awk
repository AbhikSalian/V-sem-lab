BEGIN{m=0;
	n=0;
}
{
	if($1=="d")
	{
		m++;
	}
	else if($1=="r")
	{
		n++;
	}
}
END{printf("The no. of packets dropped =%d\n",m);
    printf("the no.of packets received =%d\n",n);}

