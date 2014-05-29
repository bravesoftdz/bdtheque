package org.tetram.bdtheque.data.dao;

import org.apache.ibatis.annotations.Param;
import org.tetram.bdtheque.data.bean.Edition;
import org.tetram.bdtheque.data.bean.lite.EditionLite;

import java.util.List;
import java.util.UUID;

/**
 * Created by Thierry on 29/05/2014.
 */
public interface EditionDao {
    EditionLite getEditionLiteById(UUID id);

    Edition getEditionById(UUID id);

    List<Edition> getListEditionByAlbumId(@Param("id") UUID id, @Param("stock") Boolean stock);
}
