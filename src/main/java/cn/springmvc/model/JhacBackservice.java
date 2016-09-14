package cn.springmvc.model;

import java.util.Date;

public class JhacBackservice {
    private Integer bcId;

    private Integer bcOutId;

    private String bcFault;

    private String bcResolvent;

    private String bcStatus;

    private String bcNetwork;

    private Integer bcResolveId;

    private Date bcResolveTime;

    private Integer bcCreateId;

    private Date bcCreateDate;

    private Integer bcUpdateId;

    private Date bcUpdateTime;

    public Integer getBcId() {
        return bcId;
    }

    public void setBcId(Integer bcId) {
        this.bcId = bcId;
    }

    public Integer getBcOutId() {
        return bcOutId;
    }

    public void setBcOutId(Integer bcOutId) {
        this.bcOutId = bcOutId;
    }

    public String getBcFault() {
        return bcFault;
    }

    public void setBcFault(String bcFault) {
        this.bcFault = bcFault == null ? null : bcFault.trim();
    }

    public String getBcResolvent() {
        return bcResolvent;
    }

    public void setBcResolvent(String bcResolvent) {
        this.bcResolvent = bcResolvent == null ? null : bcResolvent.trim();
    }

    public String getBcStatus() {
        return bcStatus;
    }

    public void setBcStatus(String bcStatus) {
        this.bcStatus = bcStatus == null ? null : bcStatus.trim();
    }

    public String getBcNetwork() {
        return bcNetwork;
    }

    public void setBcNetwork(String bcNetwork) {
        this.bcNetwork = bcNetwork == null ? null : bcNetwork.trim();
    }

    public Integer getBcResolveId() {
        return bcResolveId;
    }

    public void setBcResolveId(Integer bcResolveId) {
        this.bcResolveId = bcResolveId;
    }

    public Date getBcResolveTime() {
        return bcResolveTime;
    }

    public void setBcResolveTime(Date bcResolveTime) {
        this.bcResolveTime = bcResolveTime;
    }

    public Integer getBcCreateId() {
        return bcCreateId;
    }

    public void setBcCreateId(Integer bcCreateId) {
        this.bcCreateId = bcCreateId;
    }

    public Date getBcCreateDate() {
        return bcCreateDate;
    }

    public void setBcCreateDate(Date bcCreateDate) {
        this.bcCreateDate = bcCreateDate;
    }

    public Integer getBcUpdateId() {
        return bcUpdateId;
    }

    public void setBcUpdateId(Integer bcUpdateId) {
        this.bcUpdateId = bcUpdateId;
    }

    public Date getBcUpdateTime() {
        return bcUpdateTime;
    }

    public void setBcUpdateTime(Date bcUpdateTime) {
        this.bcUpdateTime = bcUpdateTime;
    }
}