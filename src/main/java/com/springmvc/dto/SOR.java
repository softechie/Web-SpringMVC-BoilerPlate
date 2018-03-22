package com.springmvc.dto;

import java.util.ArrayList;

public class SOR {

    public String id;
    public String SORName;
    public ArrayList<Platform> Platforms;
    
    public SOR() { }
	public SOR(String id, String sorName, ArrayList<Platform> platforms) {
		this.id = id;
		SORName = sorName;
		Platforms = platforms;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSORName() {
		return SORName;
	}
	public void setSORName(String sORName) {
		SORName = sORName;
	}
	public ArrayList<Platform> getPlatforms() {
		return Platforms;
	}
	public void setPlatforms(ArrayList<Platform> platforms) {
		Platforms = platforms;
	}

}