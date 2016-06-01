package com.android.systemui.statusbar;

import android.content.Context;

import com.android.systemui.statusbar.phone.PhoneStatusBarView;

/**
 * Created by Anna Berkovitch on 31/05/2016.
 */
public class BaseStatusBar {
    Context mContext;

    protected PhoneStatusBarView makeStatusBarView() {
        return new PhoneStatusBarView(mContext);
    }
}
