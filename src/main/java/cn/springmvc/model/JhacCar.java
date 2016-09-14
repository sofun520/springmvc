package cn.springmvc.model;

import java.util.Date;

public class JhacCar {
    private Integer cId;

    private String cChangpai;

    private String cXinghao;

    private String cDengjidate;

    private String cLicence;

    private String cEngineno;

    private String cColor;

    private String cGear;

    private String cOutId;

    private String cStatus;

    private Date cCreateTime;

    private Integer cCreateId;

    private Date cUpdateTime;

    private Integer cUpdateId;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcChangpai() {
        return cChangpai;
    }

    public void setcChangpai(String cChangpai) {
        this.cChangpai = cChangpai == null ? null : cChangpai.trim();
    }

    public String getcXinghao() {
        return cXinghao;
    }

    public void setcXinghao(String cXinghao) {
        this.cXinghao = cXinghao == null ? null : cXinghao.trim();
    }

    public String getcDengjidate() {
        return cDengjidate;
    }

    public void setcDengjidate(String cDengjidate) {
        this.cDengjidate = cDengjidate == null ? null : cDengjidate.trim();
    }

    public String getcLicence() {
        return cLicence;
    }

    public void setcLicence(String cLicence) {
        this.cLicence = cLicence == null ? null : cLicence.trim();
    }

    public String getcEngineno() {
        return cEngineno;
    }

    public void setcEngineno(String cEngineno) {
        this.cEngineno = cEngineno == null ? null : cEngineno.trim();
    }

    public String getcColor() {
        return cColor;
    }

    public void setcColor(String cColor) {
        this.cColor = cColor == null ? null : cColor.trim();
    }

    public String getcGear() {
        return cGear;
    }

    public void setcGear(String cGear) {
        this.cGear = cGear == null ? null : cGear.trim();
    }

    public String getcOutId() {
        return cOutId;
    }

    public void setcOutId(String cOutId) {
        this.cOutId = cOutId == null ? null : cOutId.trim();
    }

    public String getcStatus() {
        return cStatus;
    }

    public void setcStatus(String cStatus) {
        this.cStatus = cStatus == null ? null : cStatus.trim();
    }

    public Date getcCreateTime() {
        return cCreateTime;
    }

    public void setcCreateTime(Date cCreateTime) {
        this.cCreateTime = cCreateTime;
    }

    public Integer getcCreateId() {
        return cCreateId;
    }

    public void setcCreateId(Integer cCreateId) {
        this.cCreateId = cCreateId;
    }

    public Date getcUpdateTime() {
        return cUpdateTime;
    }

    public void setcUpdateTime(Date cUpdateTime) {
        this.cUpdateTime = cUpdateTime;
    }

    public Integer getcUpdateId() {
        return cUpdateId;
    }

    public void setcUpdateId(Integer cUpdateId) {
        this.cUpdateId = cUpdateId;
    }
}