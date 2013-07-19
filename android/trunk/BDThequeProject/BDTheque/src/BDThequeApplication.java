package org.tetram.bdtheque;

import android.app.Application;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import org.tetram.bdtheque.utils.UserConfig;

@SuppressWarnings("ClassNamePrefixedWithPackageName")
public class BDThequeApplication extends Application {
    private static BDThequeApplication ourInstance;
    private static String ficheAlbumLastShownTab;
    private static String ficheSerieLastShownTab;
    private static String fichePersonneLastShownTab;

    public static BDThequeApplication getInstance() {
        return ourInstance;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        ourInstance = this;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        prefs.edit().putString(getString(R.string.pref_symboleMonetaire), UserConfig.getInstance().getSymboleMonetaire()).commit();
        PreferenceManager.setDefaultValues(this, R.xml.preferences, false);
    }

    public static String getFicheAlbumLastShownTab() {
        return ficheAlbumLastShownTab;
    }

    public static void setFicheAlbumLastShownTab(String tabPosition) {
        BDThequeApplication.ficheAlbumLastShownTab = tabPosition;
    }

    public static String getFicheSerieLastShownTab() {
        return ficheSerieLastShownTab;
    }

    public static void setFicheSerieLastShownTab(String tabPosition) {
        BDThequeApplication.ficheSerieLastShownTab = tabPosition;
    }

    public static String getFichePersonneLastShownTab() {
        return fichePersonneLastShownTab;
    }

    public static void setFichePersonneLastShownTab(String tabPosition) {
        BDThequeApplication.fichePersonneLastShownTab = tabPosition;
    }
}
