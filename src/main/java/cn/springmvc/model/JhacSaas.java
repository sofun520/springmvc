package cn.springmvc.model;

import java.util.Date;

public class JhacSaas {
    private Integer sId;

    private String sNetwork;

    private Date sBeginDate;

    private Date sExpireDate;

    private String sStatus;

    private Date sCreateTime;

    private Integer sCreateId;

    private Date sUpdateTime;

    private Integer sUpdateId;

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsNetwork() {
        return sNetwork;
    }

    public void setsNetwork(String sNetwork) {
        this.sNetwork = sNetwork == null ? null : sNetwork.trim();
    }

    public Date getsBeginDate() {
        return sBeginDate;
    }

    public void setsBeginDate(Date sBeginDate) {
        this.sBeginDate = sBeginDate;
    }

    public Date getsExpireDate() {
        return sExpireDate;
    }

    public void setsExpireDate(Date sExpireDate) {
        this.sExpireDate = sExpireDate;
    }

    public String getsStatus() {
        return sStatus;
    }

    public void setsStatus(String sStatus) {
        this.sStatus = sStatus == null ? null : sStatus.trim();
    }

    public Date getsCreateTime() {
        return sCreateTime;
    }

    public void setsCreateTime(Date sCreateTime) {
        this.sCreateTime = sCreateTime;
    }

    public Integer getsCreateId() {
        return sCreateId;
    }

    public void setsCreateId(Integer sCreateId) {
        this.sCreateId = sCreateId;
    }

    public Date getsUpdateTime() {
        return sUpdateTime;
    }

    public void setsUpdateTime(Date sUpdateTime) {
        this.sUpdateTime = sUpdateTime;
    }

    public Integer getsUpdateId() {
        return sUpdateId;
    }

    public void setsUpdateId(Integer sUpdateId) {
        this.sUpdateId = sUpdateId;
    }
}