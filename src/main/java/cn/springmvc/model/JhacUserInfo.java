package cn.springmvc.model;

import java.io.Serializable;
import java.util.Date;

public class JhacUserInfo implements Serializable {
	private Integer uiId;

	private Integer uiUserId;

	private String uiBirthday;

	private String uiSex;

	private Date uiEntryDate;

	private String uiDepartment;

	private String uiLeader;

	private String uiJob;

	private String uiAddress;

	private JhacUser user;

	/**
	 * @return the user
	 */
	public JhacUser getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(JhacUser user) {
		this.user = user;
	}

	public Integer getUiId() {
		return uiId;
	}

	public void setUiId(Integer uiId) {
		this.uiId = uiId;
	}

	public Integer getUiUserId() {
		return uiUserId;
	}

	public void setUiUserId(Integer uiUserId) {
		this.uiUserId = uiUserId;
	}

	public String getUiBirthday() {
		return uiBirthday;
	}

	public void setUiBirthday(String uiBirthday) {
		this.uiBirthday = uiBirthday == null ? null : uiBirthday.trim();
	}

	public String getUiSex() {
		return uiSex;
	}

	public void setUiSex(String uiSex) {
		this.uiSex = uiSex == null ? null : uiSex.trim();
	}

	public Date getUiEntryDate() {
		return uiEntryDate;
	}

	public void setUiEntryDate(Date uiEntryDate) {
		this.uiEntryDate = uiEntryDate;
	}

	public String getUiDepartment() {
		return uiDepartment;
	}

	public void setUiDepartment(String uiDepartment) {
		this.uiDepartment = uiDepartment == null ? null : uiDepartment.trim();
	}

	public String getUiLeader() {
		return uiLeader;
	}

	public void setUiLeader(String uiLeader) {
		this.uiLeader = uiLeader == null ? null : uiLeader.trim();
	}

	public String getUiJob() {
		return uiJob;
	}

	public void setUiJob(String uiJob) {
		this.uiJob = uiJob == null ? null : uiJob.trim();
	}

	public String getUiAddress() {
		return uiAddress;
	}

	public void setUiAddress(String uiAddress) {
		this.uiAddress = uiAddress == null ? null : uiAddress.trim();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "JhacUserInfo [uiId=" + uiId + ", uiUserId=" + uiUserId
				+ ", uiBirthday=" + uiBirthday + ", uiSex=" + uiSex
				+ ", uiEntryDate=" + uiEntryDate + ", uiDepartment="
				+ uiDepartment + ", uiLeader=" + uiLeader + ", uiJob=" + uiJob
				+ ", uiAddress=" + uiAddress + ", user=" + user + "]";
	}

}