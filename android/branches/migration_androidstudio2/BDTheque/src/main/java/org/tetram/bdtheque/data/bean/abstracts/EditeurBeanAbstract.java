package org.tetram.bdtheque.data.bean.abstracts;

import android.os.Parcel;

import org.tetram.bdtheque.data.orm.annotations.Field;
import org.tetram.bdtheque.database.DDLConstants;

import java.util.UUID;

@SuppressWarnings("UnusedDeclaration")
public abstract class EditeurBeanAbstract extends CommonBean {

    @SuppressWarnings("InstanceVariableNamingConvention")
    @Field(fieldName = DDLConstants.EDITEURS_ID, primaryKey = true)
    protected UUID id;
    @Field(fieldName = DDLConstants.EDITEURS_NOM)
    protected String nom;

    public EditeurBeanAbstract(Parcel in) {
        super(in);
    }


    public EditeurBeanAbstract() {
        super();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeString(this.nom);
    }

    @Override
    public void readFromParcel(Parcel in) {
        super.readFromParcel(in);
        this.nom = in.readString();
    }

    @Override
    public UUID getId() {
        return this.id;
    }

    @Override
    public void setId(UUID id) {
        this.id = id;
    }

    public String getNom() {
        return this.nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
