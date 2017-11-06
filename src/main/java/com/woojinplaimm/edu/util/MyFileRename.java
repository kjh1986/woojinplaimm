package com.woojinplaimm.edu.util;

import java.util.*;


import java.text.SimpleDateFormat;
 
public class MyFileRename {
	
     public static String rename(String originalfilename) {
    	 
          long currentTime = System.currentTimeMillis();
          SimpleDateFormat simDf = new SimpleDateFormat("HHMMmmyyyyssdd");
          Random r = new Random();
          String uniqueFileName = String.format("%04d%s", r.nextInt(1000), simDf.format(new Date(currentTime)));
 
          String newFileName = null;
          int dot = originalfilename.lastIndexOf(".");
          if (dot != -1) {
        	  newFileName = uniqueFileName + originalfilename.substring(originalfilename.lastIndexOf("."));  // includes "."
          }
          
          return newFileName;
     }

	

}
