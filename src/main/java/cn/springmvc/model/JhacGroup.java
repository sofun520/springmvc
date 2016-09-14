package cn.springmvc.model;

public class JhacGroup {
    private Integer gId;

    private String gName;

    private String gStatus;

    private Integer gAddId;

    private Integer gUpdateId;

    public Integer getgId() {
        return gId;
    }

    public void setgId(Integer gId) {
        this.gId = gId;
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName == null ? null : gName.trim();
    }

    public String getgStatus() {
        return gStatus;
    }

    public void setgStatus(String gStatus) {
        this.gStatus = gStatus == null ? null : gStatus.trim();
    }

    public Integer getgAddId() {
        return gAddId;
    }

    public void setgAddId(Integer gAddId) {
        this.gAddId = gAddId;
    }

    public Integer getgUpdateId() {
        return gUpdateId;
    }

    public void setgUpdateId(Integer gUpdateId) {
        this.gUpdateId = gUpdateId;
    }
}