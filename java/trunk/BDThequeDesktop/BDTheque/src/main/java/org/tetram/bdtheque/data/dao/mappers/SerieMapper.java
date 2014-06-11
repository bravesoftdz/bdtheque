package org.tetram.bdtheque.data.dao.mappers;

import org.tetram.bdtheque.data.bean.Serie;
import org.tetram.bdtheque.data.bean.SerieLite;

import java.util.List;
import java.util.UUID;

/**
 * Created by Thierry on 25/05/2014.
 */
public interface SerieMapper extends BaseMapperInterface {
    SerieLite getSerieLiteById(UUID id);

    Serie getSerieById(UUID id);

    List<SerieLite> getListSerieIdByAuteurId(UUID id);
}