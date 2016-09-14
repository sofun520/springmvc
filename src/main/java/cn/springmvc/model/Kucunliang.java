package cn.springmvc.model;

public class Kucunliang {

	private String pName;
	private String pXinghao;
	private Integer pCount;

	/**
	 * @return the pName
	 */
	public String getpName() {
		return pName;
	}

	/**
	 * @param pName
	 *            the pName to set
	 */
	public void setpName(String pName) {
		this.pName = pName;
	}

	/**
	 * @return the pXinghao
	 */
	public String getpXinghao() {
		return pXinghao;
	}

	/**
	 * @param pXinghao
	 *            the pXinghao to set
	 */
	public void setpXinghao(String pXinghao) {
		this.pXinghao = pXinghao;
	}

	/**
	 * @return the pCount
	 */
	public Integer getpCount() {
		return pCount;
	}

	/**
	 * @param pCount
	 *            the pCount to set
	 */
	public void setpCount(Integer pCount) {
		this.pCount = pCount;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Kucunliang [pName=" + pName + ", pXinghao=" + pXinghao
				+ ", pCount=" + pCount + "]";
	}
	
	

}
