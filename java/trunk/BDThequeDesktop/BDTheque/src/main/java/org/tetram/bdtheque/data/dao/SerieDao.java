/*
 * Copyright (c) 2014, tetram.org. All Rights Reserved.
 * SerieDao.java
 * Last modified by Tetram, on 2014-07-29T11:09:14CEST
 */

package org.tetram.bdtheque.data.dao;

import org.tetram.bdtheque.data.bean.Serie;

import java.util.UUID;

/**
 * Created by Thierry on 10/06/2014.
 */
public interface SerieDao extends DaoRW<Serie, UUID> {
    @Override
    Serie get(UUID id);
}
