package com.java;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.Action;

public class FileAction implements Action {

	private File myFile;
	private String myFileContentType;
	private String myFileFileName;
	
	@Override
	public String execute() throws Exception {
		
		try {
			String destPath = "E:/Project/workspase/Exam0331/WebContent/files/";
			System.out.println("file");
			File file = new File(destPath, myFileFileName);
			FileUtils.copyFile(myFile, file);
			System.out.println(myFileFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileContentType() {
		return myFileContentType;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}
	
	

}
