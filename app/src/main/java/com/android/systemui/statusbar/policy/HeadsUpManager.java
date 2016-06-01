package com.android.systemui.statusbar.policy;

import com.android.systemui.statusbar.ExpandableNotificationRow;
import com.android.systemui.statusbar.NotificationData;

/**
 * Created by Anna Berkovitch on 31/05/2016.
 */
public class HeadsUpManager {

    public void addListener(OnHeadsUpChangedListener listener) {

    }

    public interface OnHeadsUpChangedListener {
        /**
         * The state whether there exist pinned heads-ups or not changed.
         *
         * @param inPinnedMode whether there are any pinned heads-ups
         */
        void onHeadsUpPinnedModeChanged(boolean inPinnedMode);
        /**
         * A notification was just pinned to the top.
         */
        void onHeadsUpPinned(ExpandableNotificationRow headsUp);
        /**
         * A notification was just unpinned from the top.
         */
        void onHeadsUpUnPinned(ExpandableNotificationRow headsUp);
        /**
         * A notification just became a heads up or turned back to its normal state.
         *
         * @param entry the entry of the changed notification
         * @param isHeadsUp whether the notification is now a headsUp notification
         */
        void onHeadsUpStateChanged(NotificationData.Entry entry, boolean isHeadsUp);
    }
}
