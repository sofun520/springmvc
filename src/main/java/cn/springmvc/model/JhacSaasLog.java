package cn.springmvc.model;

import java.util.Date;

public class JhacSaasLog {
	private Integer slId;

	private Integer slSaasId;

	private Date slNewBegindate;

	private Date slOldExpiredate;

	private Date slNewExpiredate;

	private String slStatus;

	private Integer slCreateId;

	private Date slCreateTime;

	private Integer slUpdateId;

	private Date slUpdateTime;

	private String slNetwork;

	private String slTimeType;

	private Integer slTimeNum;

	private Integer slReviewId;

	private String slReviewResult;

	private String slReviewReason;

	private String slOrder;

	private JhacUser user;

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

	public Integer getSlId() {
		return slId;
	}

	public void setSlId(Integer slId) {
		this.slId = slId;
	}

	public Integer getSlSaasId() {
		return slSaasId;
	}

	public void setSlSaasId(Integer slSaasId) {
		this.slSaasId = slSaasId;
	}

	public Date getSlNewBegindate() {
		return slNewBegindate;
	}

	public void setSlNewBegindate(Date slNewBegindate) {
		this.slNewBegindate = slNewBegindate;
	}

	public Date getSlOldExpiredate() {
		return slOldExpiredate;
	}

	public void setSlOldExpiredate(Date slOldExpiredate) {
		this.slOldExpiredate = slOldExpiredate;
	}

	public Date getSlNewExpiredate() {
		return slNewExpiredate;
	}

	public void setSlNewExpiredate(Date slNewExpiredate) {
		this.slNewExpiredate = slNewExpiredate;
	}

	public String getSlStatus() {
		return slStatus;
	}

	public void setSlStatus(String slStatus) {
		this.slStatus = slStatus == null ? null : slStatus.trim();
	}

	public Integer getSlCreateId() {
		return slCreateId;
	}

	public void setSlCreateId(Integer slCreateId) {
		this.slCreateId = slCreateId;
	}

	public Date getSlCreateTime() {
		return slCreateTime;
	}

	public void setSlCreateTime(Date slCreateTime) {
		this.slCreateTime = slCreateTime;
	}

	public Integer getSlUpdateId() {
		return slUpdateId;
	}

	public void setSlUpdateId(Integer slUpdateId) {
		this.slUpdateId = slUpdateId;
	}

	public Date getSlUpdateTime() {
		return slUpdateTime;
	}

	public void setSlUpdateTime(Date slUpdateTime) {
		this.slUpdateTime = slUpdateTime;
	}

	public String getSlNetwork() {
		return slNetwork;
	}

	public void setSlNetwork(String slNetwork) {
		this.slNetwork = slNetwork == null ? null : slNetwork.trim();
	}

	public String getSlTimeType() {
		return slTimeType;
	}

	public void setSlTimeType(String slTimeType) {
		this.slTimeType = slTimeType == null ? null : slTimeType.trim();
	}

	public Integer getSlTimeNum() {
		return slTimeNum;
	}

	public void setSlTimeNum(Integer slTimeNum) {
		this.slTimeNum = slTimeNum;
	}

	public Integer getSlReviewId() {
		return slReviewId;
	}

	public void setSlReviewId(Integer slReviewId) {
		this.slReviewId = slReviewId;
	}

	public String getSlReviewResult() {
		return slReviewResult;
	}

	public void setSlReviewResult(String slReviewResult) {
		this.slReviewResult = slReviewResult == null ? null : slReviewResult
				.trim();
	}

	public String getSlReviewReason() {
		return slReviewReason;
	}

	public void setSlReviewReason(String slReviewReason) {
		this.slReviewReason = slReviewReason == null ? null : slReviewReason
				.trim();
	}

	public String getSlOrder() {
		return slOrder;
	}

	public void setSlOrder(String slOrder) {
		this.slOrder = slOrder == null ? null : slOrder.trim();
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "JhacSaasLog [slId=" + slId + ", slSaasId=" + slSaasId
				+ ", slNewBegindate=" + slNewBegindate + ", slOldExpiredate="
				+ slOldExpiredate + ", slNewExpiredate=" + slNewExpiredate
				+ ", slStatus=" + slStatus + ", slCreateId=" + slCreateId
				+ ", slCreateTime=" + slCreateTime + ", slUpdateId="
				+ slUpdateId + ", slUpdateTime=" + slUpdateTime
				+ ", slNetwork=" + slNetwork + ", slTimeType=" + slTimeType
				+ ", slTimeNum=" + slTimeNum + ", slReviewId=" + slReviewId
				+ ", slReviewResult=" + slReviewResult + ", slReviewReason="
				+ slReviewReason + ", slOrder=" + slOrder + ", user=" + user
				+ "]";
	}
	
	
}