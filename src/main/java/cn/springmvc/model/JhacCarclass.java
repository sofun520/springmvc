package cn.springmvc.model;

import java.io.Serializable;
import java.util.Date;

public class JhacCarclass implements Serializable {
	private Integer ccId;

	private String ccName;

	private Integer ccComId;

	private String ccStatus;

	private String ccNetworkCode;

	private Integer ccCreateId;

	private Date ccCreateTime;

	private Integer ccUpdateId;

	private Date ccUpdateTime;

	public Integer getCcId() {
		return ccId;
	}

	public void setCcId(Integer ccId) {
		this.ccId = ccId;
	}

	public String getCcName() {
		return ccName;
	}

	public void setCcName(String ccName) {
		this.ccName = ccName == null ? null : ccName.trim();
	}

	public Integer getCcComId() {
		return ccComId;
	}

	public void setCcComId(Integer ccComId) {
		this.ccComId = ccComId;
	}

	public String getCcStatus() {
		return ccStatus;
	}

	public void setCcStatus(String ccStatus) {
		this.ccStatus = ccStatus == null ? null : ccStatus.trim();
	}

	public String getCcNetworkCode() {
		return ccNetworkCode;
	}

	public void setCcNetworkCode(String ccNetworkCode) {
		this.ccNetworkCode = ccNetworkCode == null ? null : ccNetworkCode
				.trim();
	}

	public Integer getCcCreateId() {
		return ccCreateId;
	}

	public void setCcCreateId(Integer ccCreateId) {
		this.ccCreateId = ccCreateId;
	}

	public Date getCcCreateTime() {
		return ccCreateTime;
	}

	public void setCcCreateTime(Date ccCreateTime) {
		this.ccCreateTime = ccCreateTime;
	}

	public Integer getCcUpdateId() {
		return ccUpdateId;
	}

	public void setCcUpdateId(Integer ccUpdateId) {
		this.ccUpdateId = ccUpdateId;
	}

	public Date getCcUpdateTime() {
		return ccUpdateTime;
	}

	public void setCcUpdateTime(Date ccUpdateTime) {
		this.ccUpdateTime = ccUpdateTime;
	}
}