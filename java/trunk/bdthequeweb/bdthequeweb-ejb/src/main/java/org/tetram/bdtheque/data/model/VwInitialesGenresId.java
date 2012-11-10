package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * VwInitialesGenresId generated by hbm2java
 */
@Embeddable
public class VwInitialesGenresId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String initialegenre;
	private Integer countinitiale;

	public VwInitialesGenresId() {
	}

	public VwInitialesGenresId(String initialegenre, Integer countinitiale) {
		this.initialegenre = initialegenre;
		this.countinitiale = countinitiale;
	}

	@Column(name = "INITIALEGENRE", length = 4)
	public String getInitialegenre() {
		return this.initialegenre;
	}

	public void setInitialegenre(String initialegenre) {
		this.initialegenre = initialegenre;
	}

	@Column(name = "COUNTINITIALE")
	public Integer getCountinitiale() {
		return this.countinitiale;
	}

	public void setCountinitiale(Integer countinitiale) {
		this.countinitiale = countinitiale;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof VwInitialesGenresId))
			return false;
		VwInitialesGenresId castOther = (VwInitialesGenresId) other;

		return ((this.getInitialegenre() == castOther.getInitialegenre()) || (this
				.getInitialegenre() != null
				&& castOther.getInitialegenre() != null && this
				.getInitialegenre().equals(castOther.getInitialegenre())))
				&& ((this.getCountinitiale() == castOther.getCountinitiale()) || (this
						.getCountinitiale() != null
						&& castOther.getCountinitiale() != null && this
						.getCountinitiale()
						.equals(castOther.getCountinitiale())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getInitialegenre() == null ? 0 : this.getInitialegenre()
						.hashCode());
		result = 37
				* result
				+ (getCountinitiale() == null ? 0 : this.getCountinitiale()
						.hashCode());
		return result;
	}

}