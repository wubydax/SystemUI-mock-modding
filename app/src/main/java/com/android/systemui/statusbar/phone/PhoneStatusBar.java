package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.graphics.Color;
import android.provider.Settings;
import android.view.View;
import android.widget.TextView;

import com.android.systemui.statusbar.ExpandableNotificationRow;
import com.android.systemui.statusbar.NotificationData;
import com.android.systemui.statusbar.policy.HeadsUpManager;

/**
 * Created by Anna Berkovitch on 28/05/2016.
 */
public class PhoneStatusBar extends com.android.systemui.statusbar.BaseStatusBar implements HeadsUpManager.OnHeadsUpChangedListener {
    PhoneStatusBarView mStatusBarView;
    Context mContext;
    NotificationPanelView mNotificationPanel;
    boolean mIsDataViewEnabled;
    HeadsUpManager mHeadsUpManager;


    @Override
    protected PhoneStatusBarView makeStatusBarView() {
        mIsDataViewEnabled = isDataViewEnabled();
        mNotificationPanel.updateShowDataUsageVisibility(isDataViewEnabled());
        setCarrierTextVisibility();
        return mStatusBarView;
    }




    void setCarrierTextVisibility() {
        int id = mContext.getResources().getIdentifier("adi_carrier_label", "id", mContext.getPackageName());
        int visibility = Settings.System.getInt(mContext.getContentResolver(), "dax_sb_carrier_label", 0) == 1 ? View.VISIBLE : View.GONE;
        mStatusBarView.findViewById(id).setVisibility(visibility);
    }

    boolean isDataViewEnabled() {
        return Settings.System.getInt(mContext.getContentResolver(), "data_usage_key_whatever", 1) == 1;
    }

    void setTroyColor() {
        TextView someText = (TextView) mStatusBarView.findViewById(getIdentifier("troy_custom_text", "id"));
        someText.setTextColor(Settings.System.getInt(mContext.getContentResolver(), "text_color_for_example", Color.WHITE));
    }

    int getIdentifier(String type, String name) {
        return mContext.getResources().getIdentifier(name, type, mContext.getPackageName());
    }


    @Override
    public void onHeadsUpPinnedModeChanged(boolean inPinnedMode) {

    }

    @Override
    public void onHeadsUpPinned(ExpandableNotificationRow headsUp) {
        removeNotificationBg();
    }

    @Override
    public void onHeadsUpUnPinned(ExpandableNotificationRow headsUp) {
        setBgVisible();
    }

    @Override
    public void onHeadsUpStateChanged(NotificationData.Entry entry, boolean isHeadsUp) {

    }

    private void setBgVisible() {
        int id = mContext.getResources().getIdentifier("gear_panel_bg_view", "id", mContext.getPackageName());
        mNotificationPanel.findViewById(id).setVisibility(View.VISIBLE);
    }

    private void removeNotificationBg() {
        int id = mContext.getResources().getIdentifier("gear_panel_bg_view", "id", mContext.getPackageName());
        mNotificationPanel.findViewById(id).setVisibility(View.GONE);
    }
}
