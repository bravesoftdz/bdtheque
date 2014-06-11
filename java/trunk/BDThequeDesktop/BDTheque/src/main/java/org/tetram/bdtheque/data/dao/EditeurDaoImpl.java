package org.tetram.bdtheque.data.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.tetram.bdtheque.data.ConsistencyException;
import org.tetram.bdtheque.data.bean.Editeur;
import org.tetram.bdtheque.utils.I18nSupport;

import java.util.UUID;

/**
 * Created by Thierry on 03/06/2014.
 */
@Repository
@Lazy
public class EditeurDaoImpl extends DaoImpl<Editeur, UUID> implements EditeurDao {
    @Override
    public int save(Editeur o) throws ConsistencyException {
        if (!isUnique(o))
            throw new ConsistencyException(I18nSupport.message("title.still.used", I18nSupport.message("editeur")));
        return super.save(o);
    }
}