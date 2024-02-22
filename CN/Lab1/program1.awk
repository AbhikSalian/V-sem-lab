BEGIN{m=0;
	n=0;
}
{
	if(S1=="d")
	{
		m++;
	}
	else if(S1=="r")
	{
		n++;
	}
}
END{printf("The no. of packets dropped =%d\n",m);
    printf("the no.of packets dropped =%d\n",n);}

