package org.tetram.bdtheque.data.bean;

import org.tetram.bdtheque.data.Database;
import org.tetram.bdtheque.data.dao.ValeurListeDao;
import org.tetram.bdtheque.data.dao.ValeurListeDaoImpl;

/**
 * Created by Thierry on 24/05/2014.
 */
public class CouvertureLite extends ImageLite {

    static {
        ValeurListeDao valeurListeDao = Database.getInstance().getApplicationContext().getBean(ValeurListeDao.class);
        defaultCategorie = valeurListeDao.getDefaultTypeCouverture();
    }

}