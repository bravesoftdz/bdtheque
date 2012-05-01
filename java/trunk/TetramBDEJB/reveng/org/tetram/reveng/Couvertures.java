package org.tetram.reveng;

// Generated 1 mai 2012 09:51:32 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Couvertures generated by hbm2java
 */
@Entity
@Table(name = "COUVERTURES")
public class Couvertures implements java.io.Serializable {

	private String idCouverture;
	private Editions editions;
	private Albums albums;
	private Integer ordre;
	private Short categorieimage;
	private Short stockagecouverture;
	private byte[] imagecouverture;
	private String fichiercouverture;
	private Date dcCouvertures;
	private Date dmCouvertures;

	public Couvertures() {
	}

	public Couvertures(String idCouverture, Date dcCouvertures,
			Date dmCouvertures) {
		this.idCouverture = idCouverture;
		this.dcCouvertures = dcCouvertures;
		this.dmCouvertures = dmCouvertures;
	}

	public Couvertures(String idCouverture, Editions editions, Albums albums,
			Integer ordre, Short categorieimage, Short stockagecouverture,
			byte[] imagecouverture, String fichiercouverture,
			Date dcCouvertures, Date dmCouvertures) {
		this.idCouverture = idCouverture;
		this.editions = editions;
		this.albums = albums;
		this.ordre = ordre;
		this.categorieimage = categorieimage;
		this.stockagecouverture = stockagecouverture;
		this.imagecouverture = imagecouverture;
		this.fichiercouverture = fichiercouverture;
		this.dcCouvertures = dcCouvertures;
		this.dmCouvertures = dmCouvertures;
	}

	@Id
	@Column(name = "ID_COUVERTURE", unique = true, nullable = false, length = 38)
	public String getIdCouverture() {
		return this.idCouverture;
	}

	public void setIdCouverture(String idCouverture) {
		this.idCouverture = idCouverture;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_EDITION")
	public Editions getEditions() {
		return this.editions;
	}

	public void setEditions(Editions editions) {
		this.editions = editions;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_ALBUM")
	public Albums getAlbums() {
		return this.albums;
	}

	public void setAlbums(Albums albums) {
		this.albums = albums;
	}

	@Column(name = "ORDRE")
	public Integer getOrdre() {
		return this.ordre;
	}

	public void setOrdre(Integer ordre) {
		this.ordre = ordre;
	}

	@Column(name = "CATEGORIEIMAGE")
	public Short getCategorieimage() {
		return this.categorieimage;
	}

	public void setCategorieimage(Short categorieimage) {
		this.categorieimage = categorieimage;
	}

	@Column(name = "STOCKAGECOUVERTURE")
	public Short getStockagecouverture() {
		return this.stockagecouverture;
	}

	public void setStockagecouverture(Short stockagecouverture) {
		this.stockagecouverture = stockagecouverture;
	}

	@Column(name = "IMAGECOUVERTURE")
	public byte[] getImagecouverture() {
		return this.imagecouverture;
	}

	public void setImagecouverture(byte[] imagecouverture) {
		this.imagecouverture = imagecouverture;
	}

	@Column(name = "FICHIERCOUVERTURE")
	public String getFichiercouverture() {
		return this.fichiercouverture;
	}

	public void setFichiercouverture(String fichiercouverture) {
		this.fichiercouverture = fichiercouverture;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DC_COUVERTURES", nullable = false, length = 19)
	public Date getDcCouvertures() {
		return this.dcCouvertures;
	}

	public void setDcCouvertures(Date dcCouvertures) {
		this.dcCouvertures = dcCouvertures;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DM_COUVERTURES", nullable = false, length = 19)
	public Date getDmCouvertures() {
		return this.dmCouvertures;
	}

	public void setDmCouvertures(Date dmCouvertures) {
		this.dmCouvertures = dmCouvertures;
	}

}
