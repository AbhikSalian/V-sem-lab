import java.io.*;
import java.net.*;
public class FileClient
{
    public static void main(String[] args)
    {
        new FileClient();
    }
    public FileClient()
    {
        
        try{
            Socket clientsocket=new Socket("localhost",8000);
            System.out.println("Connecting to Server....");
            DataInputStream input=new DataInputStream(clientsocket.getInputStream());
            DataOutputStream output=new DataOutputStream(clientsocket.getOutputStream());
            System.out.println("Enter file name: ");
            BufferedReader bufReader=new BufferedReader(new InputStreamReader(System.in));
            String Name=bufReader.readLine();
            output.writeUTF(Name);
            String EchoedFile=input.readUTF();
            System.out.println(EchoedFile);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}