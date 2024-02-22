import java.util.*;
import java.math.*;
import java.io.*;
public class leaky extends Thread
{
	public static final int NOF_PACKETS=10;
	public static int randl(int a)
	{
		Random r=new Random();
		int rn = (r.nextInt(100)%a);
		if(rn==0)
			return 1;
		else
			return rn;
	}

public static void main(String args[])
{
	try
	{
		int[] packet_size;
		int i,clk,b_size,o_rate,p_sz_rm=0,p_sz,p_time,op;
		packet_sz=new int[NOF_PACKETS];
		Scanner scanner=new Scanner(System.in);
		for(i=0;i<NOF_PACKETS;++i)
		{
			packet_sz[i]=randl(6)*10;
		}
		for(i=0;i<NOF_PACKETS;++i)
		{
			System.out.println("\npacket "+i+" bytes\t"+packet_sz[i]);
		}
		System.out.println("\nEnter the Output Rate: ");
		o_rate=scanner.nextInt();
		
