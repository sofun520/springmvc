package cn.springmvc.model;

import java.io.Serializable;
import java.util.Date;

public class JhacProduct implements Serializable {
	private Integer pId;

	private String pName;

	private String pSerialno;

	private Integer pClass;

	private String pUse;

	private String pStatus;

	private String pNetwork;

	private String pRemark;

	private Integer pCreateId;

	private Date pCreateTime;

	private Integer pUpdateId;

	private Date pUpdateTime;

	private JhacEnum jenum;

	private Integer pCount;

	private JhacProductClass pclass;

	/**
	 * @return the pclass
	 */
	public JhacProductClass getPclass() {
		return pclass;
	}

	/**
	 * @param pclass
	 *            the pclass to set
	 */
	public void setPclass(JhacProductClass pclass) {
		this.pclass = pclass;
	}

	/**
	 * @return the pCount
	 */
	public Integer getpCount() {
		return pCount;
	}

	/**
	 * @param pCount
	 *            the pCount to set
	 */
	public void setpCount(Integer pCount) {
		this.pCount = pCount;
	}

	/**
	 * @return the jenum
	 */
	public JhacEnum getJenum() {
		return jenum;
	}

	/**
	 * @param jenum
	 *            the jenum to set
	 */
	public void setJenum(JhacEnum jenum) {
		this.jenum = jenum;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName == null ? null : pName.trim();
	}

	public String getpSerialno() {
		return pSerialno;
	}

	public void setpSerialno(String pSerialno) {
		this.pSerialno = pSerialno == null ? null : pSerialno.trim();
	}

	public Integer getpClass() {
		return pClass;
	}

	public void setpClass(Integer pClass) {
		this.pClass = pClass;
	}

	public String getpUse() {
		return pUse;
	}

	public void setpUse(String pUse) {
		this.pUse = pUse == null ? null : pUse.trim();
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus == null ? null : pStatus.trim();
	}

	public String getpNetwork() {
		return pNetwork;
	}

	public void setpNetwork(String pNetwork) {
		this.pNetwork = pNetwork == null ? null : pNetwork.trim();
	}

	public String getpRemark() {
		return pRemark;
	}

	public void setpRemark(String pRemark) {
		this.pRemark = pRemark == null ? null : pRemark.trim();
	}

	public Integer getpCreateId() {
		return pCreateId;
	}

	public void setpCreateId(Integer pCreateId) {
		this.pCreateId = pCreateId;
	}

	public Date getpCreateTime() {
		return pCreateTime;
	}

	public void setpCreateTime(Date pCreateTime) {
		this.pCreateTime = pCreateTime;
	}

	public Integer getpUpdateId() {
		return pUpdateId;
	}

	public void setpUpdateId(Integer pUpdateId) {
		this.pUpdateId = pUpdateId;
	}

	public Date getpUpdateTime() {
		return pUpdateTime;
	}

	public void setpUpdateTime(Date pUpdateTime) {
		this.pUpdateTime = pUpdateTime;
	}
}