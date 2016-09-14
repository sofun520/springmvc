package cn.springmvc.model;

import java.io.Serializable;
import java.util.Date;

public class JhacUser implements Serializable {
	private Integer uId;

	private String uName;

	private String uPassword;

	private String uTruename;

	private String uTelephone;

	private String uEmail;

	private Integer uRoleId;

	private Date uLastloginTime;

	private Date uRegisterTime;

	private String uNetworkCode;

	private JhacNetwork network;

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

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName == null ? null : uName.trim();
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword == null ? null : uPassword.trim();
	}

	public String getuTruename() {
		return uTruename;
	}

	public void setuTruename(String uTruename) {
		this.uTruename = uTruename == null ? null : uTruename.trim();
	}

	public String getuTelephone() {
		return uTelephone;
	}

	public void setuTelephone(String uTelephone) {
		this.uTelephone = uTelephone == null ? null : uTelephone.trim();
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail == null ? null : uEmail.trim();
	}

	public Integer getuRoleId() {
		return uRoleId;
	}

	public void setuRoleId(Integer uRoleId) {
		this.uRoleId = uRoleId;
	}

	public Date getuLastloginTime() {
		return uLastloginTime;
	}

	public void setuLastloginTime(Date uLastloginTime) {
		this.uLastloginTime = uLastloginTime;
	}

	public Date getuRegisterTime() {
		return uRegisterTime;
	}

	public void setuRegisterTime(Date uRegisterTime) {
		this.uRegisterTime = uRegisterTime;
	}

	public String getuNetworkCode() {
		return uNetworkCode;
	}

	public void setuNetworkCode(String uNetworkCode) {
		this.uNetworkCode = uNetworkCode == null ? null : uNetworkCode.trim();
	}
}