package org.tetram.bdtheque.service.remote;

import java.util.List;
import java.util.Map;

import javax.ejb.Remote;

import org.tetram.bdtheque.model.dao.BDthequeDaoFactory;
import org.tetram.bdtheque.model.entity.Album;

@Remote
public interface AlbumService {
  BDthequeDaoFactory getbdthequeDaoFactory();

  public Map<Object, List<Album>> getListByAnnee()
      throws IllegalArgumentException,
        SecurityException,
        IllegalAccessException,
        NoSuchFieldException;

  public Map<Object, List<Album>> getListByInitiale()
      throws IllegalArgumentException,
        SecurityException,
        IllegalAccessException,
        NoSuchFieldException;
  
  public String test();
  
  public Album getAlbum(String id);
}