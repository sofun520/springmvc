package cn.springmvc.model;

import java.io.Serializable;

public class JhacApi implements Serializable {
	private Integer aId;

	private String aName;

	private String aUrl;

	private String aType;

	private String aParam;

	private String aDescription;

	public Integer getaId() {
		return aId;
	}

	public void setaId(Integer aId) {
		this.aId = aId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName == null ? null : aName.trim();
	}

	public String getaUrl() {
		return aUrl;
	}

	public void setaUrl(String aUrl) {
		this.aUrl = aUrl == null ? null : aUrl.trim();
	}

	public String getaType() {
		return aType;
	}

	public void setaType(String aType) {
		this.aType = aType == null ? null : aType.trim();
	}

	public String getaParam() {
		return aParam;
	}

	public void setaParam(String aParam) {
		this.aParam = aParam == null ? null : aParam.trim();
	}

	public String getaDescription() {
		return aDescription;
	}

	public void setaDescription(String aDescription) {
		this.aDescription = aDescription == null ? null : aDescription.trim();
	}
}