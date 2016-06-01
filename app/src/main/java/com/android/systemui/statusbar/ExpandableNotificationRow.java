package com.android.systemui.statusbar;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;

/**
 * Created by Anna Berkovitch on 31/05/2016.
 */
public class ExpandableNotificationRow extends FrameLayout {
    public ExpandableNotificationRow(Context context) {
        super(context);
    }

    public ExpandableNotificationRow(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ExpandableNotificationRow(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public ExpandableNotificationRow(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }
}
