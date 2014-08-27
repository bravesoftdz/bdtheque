/*
 * Copyright (c) 2014, tetram.org. All Rights Reserved.
 * EntityPickerContent.java
 * Last modified by Tetram, on 2014-08-27T16:05:54CEST
 */

package org.tetram.bdtheque.gui.components;

import javafx.scene.control.PopupControl;
import javafx.scene.layout.Region;
import org.tetram.bdtheque.data.bean.abstractentities.AbstractDBEntity;
import org.tetram.bdtheque.gui.controllers.includes.TreeViewController;
import org.tetram.bdtheque.spring.SpringFxmlLoader;
import org.tetram.bdtheque.utils.ClassLink;
import org.tetram.bdtheque.utils.ClassLinks;

/**
 * Created by Thierry on 10/08/2014.
 */
@ClassLinks({
        @ClassLink(com.sun.javafx.scene.control.skin.ColorPalette.class),
        @ClassLink(com.sun.javafx.scene.control.skin.DatePickerContent.class)
})
public class EntityPickerContent extends Region {

    private final TreeViewController treeviewController;
    private PopupControl popupControl;

    public EntityPickerContent(EntityPicker entityPicker) {
        treeviewController = SpringFxmlLoader.load("components/treeview.fxml");
        treeviewController.setClickToShow(false);
        treeviewController.setOnClickItem(event -> {
            if (event.getClickCount() == 2) {
                event.consume();
                entityPicker.setValue((AbstractDBEntity) treeviewController.getSelectedEntity());
                entityPicker.hide();
            }
        });
        // getView devrait aussi fonctionner mais comme ça, on est sûr que c'est bien que le treeview qui est affiché
        getChildren().add(treeviewController.getTreeView());
    }

    public void setPopupControl(PopupControl popupControl) {
        this.popupControl = popupControl;
    }

    public void updateSelection(AbstractDBEntity value) {
        treeviewController.setSelectedEntity(value);
    }

    public void clearFocus() {
        treeviewController.getTreeView().requestFocus();
    }

    public TreeViewController getTreeviewController() {
        return treeviewController;
    }
}
