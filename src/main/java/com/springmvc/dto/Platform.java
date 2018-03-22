package com.springmvc.dto;

import java.util.ArrayList;

public class Platform {

    public String id;
    public String PlatformName;
    public ArrayList<Job> Jobs;
   
    
	public Platform() { }
	public Platform(String id, String platformName, ArrayList<Job> jobs) {
		this.id = id;
		PlatformName = platformName;
		Jobs = jobs;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPlatformName() {
		return PlatformName;
	}
	public void setPlatformName(String platformName) {
		PlatformName = platformName;
	}
	public ArrayList<Job> getJobs() {
		return Jobs;
	}
	public void setJobs(ArrayList<Job> jobs) {
		Jobs = jobs;
	}
	
}