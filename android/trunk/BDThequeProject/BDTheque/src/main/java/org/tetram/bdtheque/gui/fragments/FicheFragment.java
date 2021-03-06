package org.tetram.bdtheque.gui.fragments;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import org.jetbrains.annotations.Nullable;
import org.tetram.bdtheque.BDThequeApplication;
import org.tetram.bdtheque.R;
import org.tetram.bdtheque.data.bean.abstracts.CommonBean;
import org.tetram.bdtheque.gui.activities.FicheActivity;

import java.lang.reflect.InvocationTargetException;
import java.util.UUID;

public abstract class FicheFragment extends Fragment {

    public static final String BEAN = "org.tetram.bdtheque.gui.fragments.FicheFragment.BEAN";

    @Nullable
    public static FicheFragment newInstance(Class<? extends FicheFragment> classFiche, CommonBean bean) {
        FicheFragment ficheFragment = null;
        try {
            ficheFragment = classFiche.getConstructor().newInstance();
        } catch (final IllegalAccessException | java.lang.InstantiationException e) {
            e.printStackTrace();
            return null;
        } catch (final InvocationTargetException | NoSuchMethodException e) {
            e.printStackTrace();
        }

        Bundle args = new Bundle();
        args.putParcelable(BEAN, bean);
        ficheFragment.setArguments(args);

        return ficheFragment;
    }

    public UUID getShownId() {
        return ((CommonBean) getArguments().getParcelable(BEAN)).getId();
    }

    public void showFiche(CommonBean bean) {
        if (BDThequeApplication.getInstance().isRepertoireDualPanel()) {
            TitlesFragment titlesFragment = (TitlesFragment) getFragmentManager().findFragmentById(R.id.titles);
            titlesFragment.showDetails(bean);
        } else {
            Intent intent = new Intent();
            intent.setClass(getActivity(), FicheActivity.class);
            intent.putExtra(BEAN, bean);
            startActivity(intent);
        }
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        if (container == null) {
            // We have different layouts, and in one of them this
            // fragments's containing frame doesn't exist.  The fragments
            // may still be created from its saved state, but there is
            // no reason to try to create its view hierarchy because it
            // won't be displayed.  Note this is not needed -- we could
            // just run the code below, where we would create and return
            // the view hierarchy; it would just never be used.
            return null;
        } else {
            return buildView(inflater, container, savedInstanceState);
        }

    }

    @Nullable
    public View buildView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        // CommonBean bean = getArguments().getParcelable(FicheFragment.BEAN);
        // Toast.makeText(this.getActivity(), String.format("%s: %s", bean.getClass().getSimpleName(), bean.getId().toString()), Toast.LENGTH_LONG).show();

        return null;
    }

}
