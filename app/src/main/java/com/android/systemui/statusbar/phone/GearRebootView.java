package com.android.systemui.statusbar.phone;

import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.ContentObserver;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.net.Uri;
import android.os.Handler;
import android.provider.Settings;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;


@SuppressWarnings("unused")
public class GearRebootView extends ImageView implements View.OnClickListener {
    private Context mContext;
    private ContentResolver mContentResolver;
    private GearSettingsObserver mGearSettingsObserver;
    private String mVisibilityKey = "gear_reboot_view_visibility";
    private String mColorKey = "gear_reboot_view_color";

    public GearRebootView(Context context, AttributeSet attrs) {
        super(context, attrs);
        mContext = context;
        mContentResolver = context.getContentResolver();
        mGearSettingsObserver = new GearSettingsObserver(new Handler());
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        setOnClickListener(this);
        mContentResolver.registerContentObserver(Settings.System.getUriFor(mVisibilityKey), false, mGearSettingsObserver);
        mContentResolver.registerContentObserver(Settings.System.getUriFor(mColorKey), false, mGearSettingsObserver);

    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();
        int id = mContext.getResources().getIdentifier("ic_gear_power", "drawable", mContext.getPackageName());
        if (id != 0) {
            setImageDrawable(mContext.getDrawable(id));
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        mContentResolver.unregisterContentObserver(mGearSettingsObserver);
    }

    @Override
    public void onClick(View v) {
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.wubydax.gearreboot", "com.wubydax.gearreboot.GearRebootDialogService"));
        if (mContext.getPackageManager().resolveService(intent, 0) != null) {
            mContext.startService(intent);
        } else {
            Toast.makeText(mContext, "Service not found", Toast.LENGTH_SHORT).show();
        }
    }

    private void updateViewVisibility() {
        int visibility = Settings.System.getInt(mContentResolver, mVisibilityKey, 0) != 0 ? VISIBLE : GONE;
        setVisibility(visibility);
    }

    private void updateViewColorOverlay() {
        int color = Settings.System.getInt(mContentResolver, mColorKey, Color.TRANSPARENT);
        setColorFilter(color, PorterDuff.Mode.SRC_ATOP);
    }

    private class GearSettingsObserver extends ContentObserver {
        Uri mVisibilityUri, mColorUri;

        public GearSettingsObserver(Handler handler) {
            super(handler);
            mVisibilityUri = Settings.System.getUriFor(mVisibilityKey);
            mColorUri = Settings.System.getUriFor(mColorKey);

        }

        @Override
        public void onChange(boolean selfChange, Uri uri) {
            super.onChange(selfChange, uri);
            if(uri.equals(mVisibilityUri)) {
                updateViewVisibility();
            } else if (uri.equals(mColorUri)) {
                updateViewColorOverlay();
            }
        }
    }


}
