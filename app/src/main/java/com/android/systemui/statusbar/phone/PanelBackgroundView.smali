.class public Lcom/android/systemui/statusbar/phone/PanelBackgroundView;
.super Landroid/widget/ImageView;
.source "PanelBackgroundView.java"


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "daxgirl"

.field private static final SERVICE_SCHEDULER:Ljava/util/concurrent/ScheduledExecutorService;


# instance fields
.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mUriString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->SERVICE_SCHEDULER:Ljava/util/concurrent/ScheduledExecutorService;

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    const-string v0, "daxgirl"

    const-string v1, "PanelBackgroundView constructor is called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    return-void
.end method

.method private getMyDrawable()Landroid/graphics/drawable/Drawable;
    .registers 11

    .prologue
    .line 86
    const/4 v5, 0x0

    .line 87
    .local v5, "inputStream":Ljava/io/InputStream;
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 88
    .local v2, "context":Landroid/content/Context;
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 89
    .local v1, "contentResolver":Landroid/content/ContentResolver;
    const-string v7, "notification_panel_bg"

    invoke-static {v1, v7}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->mUriString:Ljava/lang/String;

    .line 90
    const-string v7, "daxgirl"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getMyDrawable uri string is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->mUriString:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    iget-object v7, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->mUriString:Ljava/lang/String;

    if-eqz v7, :cond_58

    iget-object v7, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->mUriString:Ljava/lang/String;

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_58

    .line 92
    iget-object v7, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->mUriString:Ljava/lang/String;

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 97
    .local v6, "uri":Landroid/net/Uri;
    :try_start_3f
    invoke-virtual {v1, v6}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v5

    .line 98
    invoke-static {v5}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 99
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-direct {v3, v7, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 100
    .local v3, "drawable":Landroid/graphics/drawable/Drawable;
    iput-object v3, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->mDrawable:Landroid/graphics/drawable/Drawable;
    :try_end_52
    .catch Ljava/io/FileNotFoundException; {:try_start_3f .. :try_end_52} :catch_5f
    .catchall {:try_start_3f .. :try_end_52} :catchall_6f

    .line 106
    if-eqz v5, :cond_57

    .line 107
    :try_start_54
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_57
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_57} :catch_5a

    .line 114
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v6    # "uri":Landroid/net/Uri;
    :cond_57
    :goto_57
    return-object v3

    .line 94
    :cond_58
    const/4 v3, 0x0

    goto :goto_57

    .line 109
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v3    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v6    # "uri":Landroid/net/Uri;
    :catch_5a
    move-exception v4

    .line 110
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_57

    .line 101
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v4    # "e":Ljava/io/IOException;
    :catch_5f
    move-exception v4

    .line 102
    .local v4, "e":Ljava/io/FileNotFoundException;
    :try_start_60
    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_63
    .catchall {:try_start_60 .. :try_end_63} :catchall_6f

    .line 103
    const/4 v3, 0x0

    .line 106
    .restart local v3    # "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v5, :cond_57

    .line 107
    :try_start_66
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_69
    .catch Ljava/io/IOException; {:try_start_66 .. :try_end_69} :catch_6a

    goto :goto_57

    .line 109
    :catch_6a
    move-exception v4

    .line 110
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_57

    .line 105
    .end local v3    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_6f
    move-exception v7

    .line 106
    if-eqz v5, :cond_75

    .line 107
    :try_start_72
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_75} :catch_76

    .line 111
    :cond_75
    :goto_75
    throw v7

    .line 109
    :catch_76
    move-exception v4

    .line 110
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_75
.end method

.method private isCustomBgEnabled()Z
    .registers 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 79
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "enable_custom_bg"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_13

    :goto_12
    return v0

    :cond_13
    move v0, v1

    goto :goto_12
.end method

.method private isSet()Z
    .registers 4

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 75
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->mUriString:Ljava/lang/String;

    if-eqz v1, :cond_1c

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "notification_panel_bg"

    invoke-static {v1, v2}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->mUriString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    const/4 v1, 0x1

    :goto_1b
    return v1

    :cond_1c
    const/4 v1, 0x0

    goto :goto_1b
.end method

.method private setBackgroundForView()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 52
    const-string v3, "daxgirl"

    const-string v4, "setBackgroundForView is initiated"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "keyguard"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/KeyguardManager;

    .line 55
    .local v2, "keyguardManager":Landroid/app/KeyguardManager;
    invoke-virtual {v2}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v3

    if-nez v3, :cond_20

    invoke-direct {p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->isCustomBgEnabled()Z

    move-result v3

    if-nez v3, :cond_30

    .line 56
    :cond_20
    const-string v3, "daxgirl"

    const-string v4, "setBackgroundForView setting transparent color because keyguard is locked"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 68
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    :goto_2c
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 71
    return-void

    .line 59
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_30
    invoke-direct {p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->isSet()Z

    move-result v3

    if-eqz v3, :cond_47

    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 60
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :goto_38
    if-nez v1, :cond_4c

    .line 61
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-direct {v1, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 62
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    const-string v3, "daxgirl"

    const-string v4, "setBackgroundForView setting transparent color because drawable is null"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2c

    .line 59
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_47
    invoke-direct {p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->getMyDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_38

    .line 64
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_4c
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "notification_panel_alpha"

    const/16 v5, 0xff

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 65
    .local v0, "alpha":I
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_2c
.end method


# virtual methods
.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 119
    invoke-super {p0}, Landroid/widget/ImageView;->onFinishInflate()V

    .line 120
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 121
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 4
    .param p1, "hasWindowFocus"    # Z

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->setBackgroundForView()V

    .line 47
    const-string v0, "daxgirl"

    const-string v1, "onWindowFocusChanged is called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onWindowFocusChanged(Z)V

    .line 49
    return-void
.end method

.method public setPanelBgVisibility(Z)V
    .registers 7
    .param p1, "isToSetVisible"    # Z

    .prologue
    .line 124
    if-nez p1, :cond_8

    .line 125
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->setVisibility(I)V

    .line 136
    :goto_7
    return-void

    .line 127
    :cond_8
    new-instance v0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView$1;-><init>(Lcom/android/systemui/statusbar/phone/PanelBackgroundView;)V

    .line 133
    .local v0, "runnable":Ljava/lang/Runnable;
    sget-object v1, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->SERVICE_SCHEDULER:Ljava/util/concurrent/ScheduledExecutorService;

    const-wide/16 v2, 0x1f4

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v0, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    goto :goto_7
.end method
