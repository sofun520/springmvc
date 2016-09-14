package cn.springmvc.model;

import java.io.Serializable;
import java.util.Date;

public class JhacOrder implements Serializable {
	private Integer oId;

	private String oName;

	private String oCode;

	private String oStatus;

	private String oNetwork;

	private Integer oCreateId;

	private Date oCreateTime;

	private Integer oUpdateId;

	private Date oUpdateTime;

	private JhacNetwork network;

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

	/**
	 * @return the network
	 */
	public JhacNetwork getNetwork() {
		return network;
	}

	/**
	 * @param network
	 *            the network to set
	 */
	public void setNetwork(JhacNetwork network) {
		this.network = network;
	}

	public Integer getoId() {
		return oId;
	}

	public void setoId(Integer oId) {
		this.oId = oId;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName == null ? null : oName.trim();
	}

	public String getoCode() {
		return oCode;
	}

	public void setoCode(String oCode) {
		this.oCode = oCode == null ? null : oCode.trim();
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus == null ? null : oStatus.trim();
	}

	public String getoNetwork() {
		return oNetwork;
	}

	public void setoNetwork(String oNetwork) {
		this.oNetwork = oNetwork == null ? null : oNetwork.trim();
	}

	public Integer getoCreateId() {
		return oCreateId;
	}

	public void setoCreateId(Integer oCreateId) {
		this.oCreateId = oCreateId;
	}

	public Date getoCreateTime() {
		return oCreateTime;
	}

	public void setoCreateTime(Date oCreateTime) {
		this.oCreateTime = oCreateTime;
	}

	public Integer getoUpdateId() {
		return oUpdateId;
	}

	public void setoUpdateId(Integer oUpdateId) {
		this.oUpdateId = oUpdateId;
	}

	public Date getoUpdateTime() {
		return oUpdateTime;
	}

	public void setoUpdateTime(Date oUpdateTime) {
		this.oUpdateTime = oUpdateTime;
	}
}