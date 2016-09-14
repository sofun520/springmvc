package cn.springmvc.model;

import java.io.Serializable;
import java.util.Date;

public class JhacProductClass implements Serializable {
	private Integer pcId;

	private String pcName;

	private String pcXinghao;

	private Short pcPrice;

	private String pcStatus;

	private Integer pcCreateId;

	private Date pcCreateDate;

	private Integer pcUpdateId;

	private Date pcUpdateDate;

	public Integer getPcId() {
		return pcId;
	}

	public void setPcId(Integer pcId) {
		this.pcId = pcId;
	}

	public String getPcName() {
		return pcName;
	}

	public void setPcName(String pcName) {
		this.pcName = pcName == null ? null : pcName.trim();
	}

	public String getPcXinghao() {
		return pcXinghao;
	}

	public void setPcXinghao(String pcXinghao) {
		this.pcXinghao = pcXinghao == null ? null : pcXinghao.trim();
	}

	public Short getPcPrice() {
		return pcPrice;
	}

	public void setPcPrice(Short pcPrice) {
		this.pcPrice = pcPrice;
	}

	public String getPcStatus() {
		return pcStatus;
	}

	public void setPcStatus(String pcStatus) {
		this.pcStatus = pcStatus == null ? null : pcStatus.trim();
	}

	public Integer getPcCreateId() {
		return pcCreateId;
	}

	public void setPcCreateId(Integer pcCreateId) {
		this.pcCreateId = pcCreateId;
	}

	public Date getPcCreateDate() {
		return pcCreateDate;
	}

	public void setPcCreateDate(Date pcCreateDate) {
		this.pcCreateDate = pcCreateDate;
	}

	public Integer getPcUpdateId() {
		return pcUpdateId;
	}

	public void setPcUpdateId(Integer pcUpdateId) {
		this.pcUpdateId = pcUpdateId;
	}

	public Date getPcUpdateDate() {
		return pcUpdateDate;
	}

	public void setPcUpdateDate(Date pcUpdateDate) {
		this.pcUpdateDate = pcUpdateDate;
	}
}