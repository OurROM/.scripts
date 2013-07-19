import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Calendar;

public class genForumPosts
{
	private static final int MAKO		= 0;
	private static final int GROUPER	= 1;
	private static final int TILAPIA	= 2;

	private static ArrayList<String> md5s = new ArrayList<String>();
	private static ArrayList<String> posts = new ArrayList<String>();
	
	public static void main(String[] args)
	{
		try
		{
			FileInputStream fstream = new FileInputStream("/home/thebytesmasher/aokp_jb/scripts/md5s.txt");
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			
			String line;
			
			while ((line = br.readLine()) != null)
			{
				if (line.equals(""))
					continue;

				md5s.add(line);
			}
		}
		catch (Exception e) { System.err.println("Error: " + e.getMessage()); }
		
		//Removed theMirror(i+1)
		for (int i = 0; i < md5s.size()-1; i++)
			posts.add(theDate() + theTime() + theLink(i+1) + theMD5(i+1) + "\n");
		
		try
		{
			FileWriter fstream = new FileWriter("/home/thebytesmasher/aokp_jb/scripts/forumpost.txt");
			
			BufferedWriter bw = new BufferedWriter(fstream);
			
			bw.write("");
			for (int i = 0; i < posts.size(); i++)
				bw.append(posts.get(i));

			bw.flush();
			bw.close();
		}
		catch (Exception e) { System.err.println(e.getMessage()); }
	}
	
	public static String theDate()
	{
		Calendar c = Calendar.getInstance();
		
		return "[b]" + pad(c.get(Calendar.MONTH) + 1) + "/" + pad(c.get(Calendar.DAY_OF_MONTH)) + "/" + c.get(Calendar.YEAR) + ":[/b]\n";
	}
	public static String theTime()
	{
		Calendar c = Calendar.getInstance();
		
		String timeOfDay = "AM";
		if(c.get(Calendar.AM_PM) == Calendar.PM)
			timeOfDay = "PM";
		
		return "[indent=1]RST: " + md5s.get(0) + " " + timeOfDay + " EDT[/indent]\n";
	}
	public static String theLink(int device)
	{
		String link = "[indent=1][color=#282828][font=Roboto, helvetica, arial, sans-serif][background=rgb(245, 245, 245)][color=#282828][font=Roboto, helvetica, arial, sans-serif][background=rgb(245, 245, 245)]Download: [url=\"http://goo.im/devs/DizzyThermal/";
		String codename = "";

		switch(device-1)
		{
			case MAKO:
				codename="mako";
        	break;
			case GROUPER:
				codename="grouper";
	        break;
			case TILAPIA:
				codename="tilapia";
	        break;
		}
		
		return link + codename + "/AOKP_Nightlies/aokp_" + codename + "_unofficial_TheByteSmasher_" + aokpDate() + ".zip\"]http://goo.im/devs/T...r_" + aokpDate() + ".zip[/url][/background][/font][/color][/background][/font][/color][/indent]\n";
	}
	public static String theMD5(int device)
	{
		String link = "[indent=1][color=#282828][font=Roboto, helvetica, arial, sans-serif][background=rgb(245, 245, 245)][color=#282828][font=Roboto, helvetica, arial, sans-serif][background=rgb(245, 245, 245)][color=#282828][font=Roboto, helvetica, arial, sans-serif][background=rgb(245, 245, 245)][color=#282828][font=Roboto, helvetica, arial, sans-serif][background=rgb(245, 245, 245)](MD5: [b][color=#555555][background=rgb(249, 249, 249)]";
		return link + md5s.get(device) + "[/background][/color][/b])[/background][/font][/color][/background][/font][/color][/background][/font][/color][/background][/font][/color][/indent]\n";
	}
	public static String theMirror(int device)
	{
		String link = "[indent=1][color=#282828][font=Roboto, helvetica, arial, sans-serif][background=rgb(245, 245, 245)][color=#282828][font=Roboto, helvetica, arial, sans-serif][background=rgb(245, 245, 245)][color=#282828][font=Roboto, helvetica, arial, sans-serif][background=rgb(245, 245, 245)]Mirror: [url=\"";
		String driveLink = "";

		switch(device-1)
		{
			case TORO:
				driveLink="https://docs.google.com/folder/d/0B9Z4Amoa_MkAZGZVQi12V3N5VTA/edit";
        	break;
			case MAGURO:
				driveLink="https://docs.google.com/folder/d/0B9Z4Amoa_MkAS09LRFZQb0dPU1E/edit";
	        break;
			case GROUPER:
				driveLink="https://docs.google.com/folder/d/0B9Z4Amoa_MkAdHNVSEtpckNVRUE/edit";
	        break;
			case TOROPLUS:
				driveLink="https://docs.google.com/folder/d/0B9Z4Amoa_MkATnZnVHEtNm80aWM/edit";
	        break;
		}
		
		return link + driveLink + "\"]Google Drive AOKP Nightly Mirrors[/url][/background][/font][/color][/background][/font][/color][/background][/font][/color][/indent]\n";
	}
	public static String pad(int number)
	{
		if (number > 9)
			return Integer.toString(number);
		
		return "0" + Integer.toString(number);
	}
	public static String aokpDate()
	{
		Calendar c = Calendar.getInstance();
		int month = c.get(Calendar.MONTH) + 1;
		
		String monthName = "";
		switch(month)
		{
			case 1:
				monthName = "Jan";
			break;
			case 2:
				monthName = "Feb";
			break;
			case 3:
				monthName = "Mar";
			break;
			case 4:
				monthName = "Apr";
			break;
			case 5:
				monthName = "May";
			break;
			case 6:
				monthName = "Jun";
			break;
			case 7:
				monthName = "Jul";
			break;
			case 8:
				monthName = "Aug";
			break;
			case 9:
				monthName = "Sep";
			break;
			case 10:
				monthName = "Oct";
			break;
			case 11:
				monthName = "Nov";
			break;
			case 12:
				monthName = "Dec";
			break;
		}
		
		return monthName + "-" + pad(c.get(Calendar.DAY_OF_MONTH)) + "-" + Integer.toString(c.get(Calendar.YEAR)).substring(2);
	}
}
