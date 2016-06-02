package com.android.systemui.statusbar.phone;

import android.app.KeyguardManager;
import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.provider.Settings;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Created by Roberto Mariani Anna Berkovitch on 29/05/2016.
 * Custom view for notification bg
 */
public class PanelBackgroundView extends ImageView {
    public static final String LOG_TAG = "daxgirl";
    private String mUriString;
    private Drawable mDrawable;
    private static final ScheduledExecutorService SERVICE_SCHEDULER =
            Executors.newSingleThreadScheduledExecutor();


    public PanelBackgroundView(Context context, AttributeSet attrs) {
        super(context, attrs);
        Log.d(LOG_TAG, "PanelBackgroundView constructor is called");
    }


    @Override
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        setBackgroundForView();
        Log.d(LOG_TAG, "onWindowFocusChanged is called");
        super.onWindowFocusChanged(hasWindowFocus);
    }

    private void setBackgroundForView() {
        Log.d(LOG_TAG, "setBackgroundForView is initiated");
        Drawable drawable;
        KeyguardManager keyguardManager = (KeyguardManager) getContext().getSystemService(Context.KEYGUARD_SERVICE);
        if (keyguardManager.isKeyguardLocked() || !isCustomBgEnabled()) {
            Log.d(LOG_TAG, "setBackgroundForView setting transparent color because keyguard is locked");
            drawable = new ColorDrawable(Color.TRANSPARENT);
        } else {
            drawable = isSet() ? mDrawable : getMyDrawable();
            if (drawable == null) {
                drawable = new ColorDrawable(Color.TRANSPARENT);
                Log.d(LOG_TAG, "setBackgroundForView setting transparent color because drawable is null");
            } else {
                int alpha = Settings.System.getInt(getContext().getContentResolver(), "notification_panel_alpha", 255);
                drawable.setAlpha(alpha);
            }
        }
        setImageDrawable(drawable);


    }

    private boolean isSet() {
        Context context = getContext();
        return mUriString != null && Settings.System.getString(context.getContentResolver(), "notification_panel_bg").equals(mUriString);
    }

    private boolean isCustomBgEnabled() {
        return Settings.System.getInt(getContext().getContentResolver(), "enable_custom_bg", 0) == 1;
    }

    private Drawable getMyDrawable() {

        Drawable drawable;
        Uri uri;
        InputStream inputStream = null;
        Context context = getContext();
        ContentResolver contentResolver = context.getContentResolver();
        mUriString = Settings.System.getString(contentResolver, "notification_panel_bg");
        Log.d(LOG_TAG, "getMyDrawable uri string is " + mUriString);
        if (mUriString != null && !mUriString.equals("")) {
            uri = Uri.parse(mUriString);
        } else {
            return null;
        }
        try {
            inputStream = contentResolver.openInputStream(uri);
            Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
            drawable = new BitmapDrawable(context.getResources(), bitmap);
            mDrawable = drawable;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            drawable = null;
        } finally {
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return drawable;
    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();
        setScaleType(ScaleType.CENTER_CROP);
    }

    public void setPanelBgVisibility(boolean isToSetVisible) {
        if(!isToSetVisible) {
            setVisibility(View.GONE);
        } else {
            Runnable runnable = new Runnable() {
                @Override
                public void run() {
                    setVisibility(View.VISIBLE);
                }
            };
            SERVICE_SCHEDULER.schedule(runnable, 500, TimeUnit.MILLISECONDS);
        }

    }

}
