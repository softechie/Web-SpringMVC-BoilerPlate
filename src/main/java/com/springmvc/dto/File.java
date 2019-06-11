package com.springmvc.dto;

public class File {
	
	private String name;
	private int recordCount;
	private int seqNo;
	private String sourceSysName;
	private String arrivalTime;
	private String startTime;
	private String completeTime;
	private String status;
	private String record;
	private int priority;
	
	public File() {
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}

	public String getSourceSysName() {
		return sourceSysName;
	}

	public void setSourceSysName(String sourceSysName) {
		this.sourceSysName = sourceSysName;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getCompleteTime() {
		return completeTime;
	}

	public void setCompleteTime(String completeTime) {
		this.completeTime = completeTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	@Override
	public String toString() {
		return "File [name=" + name + ", recordCount=" + recordCount + ", seqNo=" + seqNo + ", sourceSysName="
				+ sourceSysName + ", arrivalTime=" + arrivalTime + ", startTime=" + startTime + ", completeTime="
				+ completeTime + ", status=" + status + ", record=" + record + ", priority=" + priority + "]";
	}
}