package cn.springmvc.model;

import java.util.Date;

public class JhacOrderDetail {
	private Integer odId;

	private String odOrderId;

	private Integer odPcId;

	private Integer odNumber;

	private String odStatus;

	private Integer odCreateId;

	private Date odCreateTime;

	private Integer odUpdateId;

	private Date odUpdateTime;

	private JhacProductClass pc;

	/**
	 * @return the pc
	 */
	public JhacProductClass getPc() {
		return pc;
	}

	/**
	 * @param pc
	 *            the pc to set
	 */
	public void setPc(JhacProductClass pc) {
		this.pc = pc;
	}

	public Integer getOdId() {
		return odId;
	}

	public void setOdId(Integer odId) {
		this.odId = odId;
	}

	public String getOdOrderId() {
		return odOrderId;
	}

	public void setOdOrderId(String odOrderId) {
		this.odOrderId = odOrderId == null ? null : odOrderId.trim();
	}

	public Integer getOdPcId() {
		return odPcId;
	}

	public void setOdPcId(Integer odPcId) {
		this.odPcId = odPcId;
	}

	public Integer getOdNumber() {
		return odNumber;
	}

	public void setOdNumber(Integer odNumber) {
		this.odNumber = odNumber;
	}

	public String getOdStatus() {
		return odStatus;
	}

	public void setOdStatus(String odStatus) {
		this.odStatus = odStatus == null ? null : odStatus.trim();
	}

	public Integer getOdCreateId() {
		return odCreateId;
	}

	public void setOdCreateId(Integer odCreateId) {
		this.odCreateId = odCreateId;
	}

	public Date getOdCreateTime() {
		return odCreateTime;
	}

	public void setOdCreateTime(Date odCreateTime) {
		this.odCreateTime = odCreateTime;
	}

	public Integer getOdUpdateId() {
		return odUpdateId;
	}

	public void setOdUpdateId(Integer odUpdateId) {
		this.odUpdateId = odUpdateId;
	}

	public Date getOdUpdateTime() {
		return odUpdateTime;
	}

	public void setOdUpdateTime(Date odUpdateTime) {
		this.odUpdateTime = odUpdateTime;
	}
}