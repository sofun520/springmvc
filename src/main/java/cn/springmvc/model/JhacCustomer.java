package cn.springmvc.model;

import java.util.Date;

public class JhacCustomer {
    private Integer cId;

    private String cName;

    private String cIdentity;

    private String cTelephone;

    private String cAddress;

    private Integer cOutId;

    private String cIdentityImg;

    private String cStatus;

    private Integer cCreateId;

    private Date cCreateTime;

    private Integer cUpdateId;

    private Date cUpdateTime;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public String getcIdentity() {
        return cIdentity;
    }

    public void setcIdentity(String cIdentity) {
        this.cIdentity = cIdentity == null ? null : cIdentity.trim();
    }

    public String getcTelephone() {
        return cTelephone;
    }

    public void setcTelephone(String cTelephone) {
        this.cTelephone = cTelephone == null ? null : cTelephone.trim();
    }

    public String getcAddress() {
        return cAddress;
    }

    public void setcAddress(String cAddress) {
        this.cAddress = cAddress == null ? null : cAddress.trim();
    }

    public Integer getcOutId() {
        return cOutId;
    }

    public void setcOutId(Integer cOutId) {
        this.cOutId = cOutId;
    }

    public String getcIdentityImg() {
        return cIdentityImg;
    }

    public void setcIdentityImg(String cIdentityImg) {
        this.cIdentityImg = cIdentityImg == null ? null : cIdentityImg.trim();
    }

    public String getcStatus() {
        return cStatus;
    }

    public void setcStatus(String cStatus) {
        this.cStatus = cStatus == null ? null : cStatus.trim();
    }

    public Integer getcCreateId() {
        return cCreateId;
    }

    public void setcCreateId(Integer cCreateId) {
        this.cCreateId = cCreateId;
    }

    public Date getcCreateTime() {
        return cCreateTime;
    }

    public void setcCreateTime(Date cCreateTime) {
        this.cCreateTime = cCreateTime;
    }

    public Integer getcUpdateId() {
        return cUpdateId;
    }

    public void setcUpdateId(Integer cUpdateId) {
        this.cUpdateId = cUpdateId;
    }

    public Date getcUpdateTime() {
        return cUpdateTime;
    }

    public void setcUpdateTime(Date cUpdateTime) {
        this.cUpdateTime = cUpdateTime;
    }
}