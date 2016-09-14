package cn.springmvc.model;

public class JhacCompany {
    private Integer comId;

    private String comName;

    private Integer comGroupId;

    private String comNetworkCode;

    private String comStatus;

    private Integer comAddId;

    private Integer comUpdateId;

    public Integer getComId() {
        return comId;
    }

    public void setComId(Integer comId) {
        this.comId = comId;
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName == null ? null : comName.trim();
    }

    public Integer getComGroupId() {
        return comGroupId;
    }

    public void setComGroupId(Integer comGroupId) {
        this.comGroupId = comGroupId;
    }

    public String getComNetworkCode() {
        return comNetworkCode;
    }

    public void setComNetworkCode(String comNetworkCode) {
        this.comNetworkCode = comNetworkCode == null ? null : comNetworkCode.trim();
    }

    public String getComStatus() {
        return comStatus;
    }

    public void setComStatus(String comStatus) {
        this.comStatus = comStatus == null ? null : comStatus.trim();
    }

    public Integer getComAddId() {
        return comAddId;
    }

    public void setComAddId(Integer comAddId) {
        this.comAddId = comAddId;
    }

    public Integer getComUpdateId() {
        return comUpdateId;
    }

    public void setComUpdateId(Integer comUpdateId) {
        this.comUpdateId = comUpdateId;
    }
}