package com.Infopackage;
import java.io.*;
public class FileSaver {
	
	public static void saveImage(String filename)throws IOException
	{
		File file = new File("D:\\eclipse-workspace\\Ecommerce\\src\\main\\webapp\\EnteredImages\\"+filename);     // img.jpg can be any image file
	      FileInputStream in = new FileInputStream(file);
	      long size = file.length();
	      byte[] temp = new byte[(int)size];
	      in.read(temp);
	      in.close();
	      // The img.jpg image data will be written in a new image File named "output.jpg"   "D:\eclipse-workspace\apache-tomcat-7.0.109\webapps\ProductImages"
	      DataOutputStream dos = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(new File("D:\\eclipse-workspace\\Ecommerce\\src\\main\\webapp\\dynamicImages\\"+filename))));
	      dos.write(temp);
	      dos.close();
	}
}
