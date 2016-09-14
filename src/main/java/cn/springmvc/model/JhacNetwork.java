package cn.springmvc.model;

import java.io.Serializable;

public class JhacNetwork implements Serializable {
	private Integer nId;

	private String nName;

	private String nCode;

	private String nLeader;

	private String nLeaderTelphone;

	public Integer getnId() {
		return nId;
	}

	public void setnId(Integer nId) {
		this.nId = nId;
	}

	public String getnName() {
		return nName;
	}

	public void setnName(String nName) {
		this.nName = nName == null ? null : nName.trim();
	}

	public String getnCode() {
		return nCode;
	}

	public void setnCode(String nCode) {
		this.nCode = nCode == null ? null : nCode.trim();
	}

	public String getnLeader() {
		return nLeader;
	}

	public void setnLeader(String nLeader) {
		this.nLeader = nLeader == null ? null : nLeader.trim();
	}

	public String getnLeaderTelphone() {
		return nLeaderTelphone;
	}

	public void setnLeaderTelphone(String nLeaderTelphone) {
		this.nLeaderTelphone = nLeaderTelphone == null ? null : nLeaderTelphone
				.trim();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "JhacNetwork [nId=" + nId + ", nName=" + nName + ", nCode="
				+ nCode + ", nLeader=" + nLeader + ", nLeaderTelphone="
				+ nLeaderTelphone + "]";
	}

}