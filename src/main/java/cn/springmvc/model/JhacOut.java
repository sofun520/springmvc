package cn.springmvc.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class JhacOut {
	private Integer oId;

	private Integer oCarClass;

	private String oSerialno;

	private String oFrameno;

	private String oProductImg;

	private String oIsCheckCar;

	private String oIsTestCar;

	private String oIsSign;

	private String oSerialnoImg;

	private String oFramenoImg;

	private Integer oPerson;

	private Integer oAddress;

	private String oAuthTelephone;

	private String oRemark;

	private String oNetwork;

	private String oStatus;

	private Integer oCreateId;

	private Date oCreateTime;

	private Integer oUpdateId;

	private Date oUpdateTime;

	private JhacUser user;

	private JhacCarclass carClass;

	private JhacCompany com;

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
	 * @return the carClass
	 */
	public JhacCarclass getCarClass() {
		return carClass;
	}

	/**
	 * @param carClass
	 *            the carClass to set
	 */
	public void setCarClass(JhacCarclass carClass) {
		this.carClass = carClass;
	}

	/**
	 * @return the com
	 */
	public JhacCompany getCom() {
		return com;
	}

	/**
	 * @param com
	 *            the com to set
	 */
	public void setCom(JhacCompany com) {
		this.com = com;
	}

	public Integer getoId() {
		return oId;
	}

	public void setoId(Integer oId) {
		this.oId = oId;
	}

	public Integer getoCarClass() {
		return oCarClass;
	}

	public void setoCarClass(Integer oCarClass) {
		this.oCarClass = oCarClass;
	}

	public String getoSerialno() {
		return oSerialno;
	}

	public void setoSerialno(String oSerialno) {
		this.oSerialno = oSerialno == null ? null : oSerialno.trim();
	}

	public String getoFrameno() {
		return oFrameno;
	}

	public void setoFrameno(String oFrameno) {
		this.oFrameno = oFrameno == null ? null : oFrameno.trim();
	}

	public String getoProductImg() {
		return oProductImg;
	}

	public void setoProductImg(String oProductImg) {
		this.oProductImg = oProductImg == null ? null : oProductImg.trim();
	}

	public String getoIsCheckCar() {
		return oIsCheckCar;
	}

	public void setoIsCheckCar(String oIsCheckCar) {
		this.oIsCheckCar = oIsCheckCar == null ? null : oIsCheckCar.trim();
	}

	public String getoIsTestCar() {
		return oIsTestCar;
	}

	public void setoIsTestCar(String oIsTestCar) {
		this.oIsTestCar = oIsTestCar == null ? null : oIsTestCar.trim();
	}

	public String getoIsSign() {
		return oIsSign;
	}

	public void setoIsSign(String oIsSign) {
		this.oIsSign = oIsSign == null ? null : oIsSign.trim();
	}

	public String getoSerialnoImg() {
		return oSerialnoImg;
	}

	public void setoSerialnoImg(String oSerialnoImg) {
		this.oSerialnoImg = oSerialnoImg == null ? null : oSerialnoImg.trim();
	}

	public String getoFramenoImg() {
		return oFramenoImg;
	}

	public void setoFramenoImg(String oFramenoImg) {
		this.oFramenoImg = oFramenoImg == null ? null : oFramenoImg.trim();
	}

	public Integer getoPerson() {
		return oPerson;
	}

	public void setoPerson(Integer oPerson) {
		this.oPerson = oPerson;
	}

	public Integer getoAddress() {
		return oAddress;
	}

	public void setoAddress(Integer oAddress) {
		this.oAddress = oAddress;
	}

	public String getoAuthTelephone() {
		return oAuthTelephone;
	}

	public void setoAuthTelephone(String oAuthTelephone) {
		this.oAuthTelephone = oAuthTelephone == null ? null : oAuthTelephone
				.trim();
	}

	public String getoRemark() {
		return oRemark;
	}

	public void setoRemark(String oRemark) {
		this.oRemark = oRemark == null ? null : oRemark.trim();
	}

	public String getoNetwork() {
		return oNetwork;
	}

	public void setoNetwork(String oNetwork) {
		this.oNetwork = oNetwork == null ? null : oNetwork.trim();
	}

	public String getoStatus() {
		return oStatus;
	}

	public void setoStatus(String oStatus) {
		this.oStatus = oStatus == null ? null : oStatus.trim();
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

	/*public JhacOut(String oSerialno, String oFrameno, Integer oAddress,
			Date oCreateTime) {
		this.oSerialno = oSerialno;
		this.oFrameno = oFrameno;
		this.oAddress = oAddress;
		this.oCreateTime = oCreateTime;
	}

	public static List<JhacOut> getList() {
		List<JhacOut> list = new ArrayList<JhacOut>();
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		list.add(new JhacOut("sdfdsf", "sdfsdfdsf", 12, new Date()));
		return list;
	}*/
}