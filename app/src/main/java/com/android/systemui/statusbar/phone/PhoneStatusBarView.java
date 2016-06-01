package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;

/**
 * Created by Anna Berkovitch on 28/05/2016.
 */
public class PhoneStatusBarView extends FrameLayout {
    public PhoneStatusBarView(Context context) {
        super(context);
    }

    public PhoneStatusBarView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PhoneStatusBarView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public PhoneStatusBarView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }
}
