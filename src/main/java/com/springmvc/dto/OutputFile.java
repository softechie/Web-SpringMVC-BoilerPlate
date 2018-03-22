package com.springmvc.dto;

public class OutputFile {

    public String id;
    public String OutputFileName;
    public String OutputFileType;
    
	public OutputFile() { }
	public OutputFile(String id, String outputFileName, String outputFileType) {
		this.id = id;
		OutputFileName = outputFileName;
		OutputFileType = outputFileType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOutputFileName() {
		return OutputFileName;
	}
	public void setOutputFileName(String outputFileName) {
		OutputFileName = outputFileName;
	}
	public String getOutputFileType() {
		return OutputFileType;
	}
	public void setOutputFileType(String outputFileType) {
		OutputFileType = outputFileType;
	}
	
}