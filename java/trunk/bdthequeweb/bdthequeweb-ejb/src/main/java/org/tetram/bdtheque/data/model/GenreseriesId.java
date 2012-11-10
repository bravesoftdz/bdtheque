package org.tetram.bdtheque.data.model;

// Generated 10 nov. 2012 15:28:13 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * GenreseriesId generated by hbm2java
 */
@Embeddable
public class GenreseriesId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String idSerie;
	private String idGenre;

	public GenreseriesId() {
	}

	public GenreseriesId(String idSerie, String idGenre) {
		this.idSerie = idSerie;
		this.idGenre = idGenre;
	}

	@Column(name = "ID_SERIE", nullable = false, length = 38)
	public String getIdSerie() {
		return this.idSerie;
	}

	public void setIdSerie(String idSerie) {
		this.idSerie = idSerie;
	}

	@Column(name = "ID_GENRE", nullable = false, length = 38)
	public String getIdGenre() {
		return this.idGenre;
	}

	public void setIdGenre(String idGenre) {
		this.idGenre = idGenre;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof GenreseriesId))
			return false;
		GenreseriesId castOther = (GenreseriesId) other;

		return ((this.getIdSerie() == castOther.getIdSerie()) || (this
				.getIdSerie() != null && castOther.getIdSerie() != null && this
				.getIdSerie().equals(castOther.getIdSerie())))
				&& ((this.getIdGenre() == castOther.getIdGenre()) || (this
						.getIdGenre() != null && castOther.getIdGenre() != null && this
						.getIdGenre().equals(castOther.getIdGenre())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getIdSerie() == null ? 0 : this.getIdSerie().hashCode());
		result = 37 * result
				+ (getIdGenre() == null ? 0 : this.getIdGenre().hashCode());
		return result;
	}

}