package com.springmvc.dto;

import java.util.ArrayList;

public class Job {

    public String id;
    public String JobName;
    public ArrayList<OutputFile> OutputFiles;
    public ArrayList<String> Dependencies;
    
	public Job() { }
	public Job(String id, String jobName, ArrayList<OutputFile> outputFiles, ArrayList<String> dependencies) {
		this.id = id;
		JobName = jobName;
		OutputFiles = outputFiles;
		Dependencies = dependencies;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJobName() {
		return JobName;
	}
	public void setJobName(String jobName) {
		JobName = jobName;
	}
	public ArrayList<OutputFile> getOutputFiles() {
		return OutputFiles;
	}
	public void setOutputFiles(ArrayList<OutputFile> outputFiles) {
		OutputFiles = outputFiles;
	}
	public ArrayList<String> getDependencies() {
		return Dependencies;
	}
	public void setDependencies(ArrayList<String> dependencies) {
		Dependencies = dependencies;
	}
    
}