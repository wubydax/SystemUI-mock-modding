.class public Lcom/android/systemui/statusbar/phone/GearRebootView;
.super Landroid/widget/ImageView;
.source "GearRebootView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/phone/GearRebootView$GearSettingsObserver;
    }
.end annotation


# instance fields
.field private mColorKey:Ljava/lang/String;

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mGearSettingsObserver:Lcom/android/systemui/statusbar/phone/GearRebootView$GearSettingsObserver;

.field private mVisibilityKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    const-string v0, "gear_reboot_view_visibility"

    iput-object v0, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mVisibilityKey:Ljava/lang/String;

    .line 25
    const-string v0, "gear_reboot_view_color"

    iput-object v0, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mColorKey:Ljava/lang/String;

    .line 29
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContentResolver:Landroid/content/ContentResolver;

    .line 31
    new-instance v0, Lcom/android/systemui/statusbar/phone/GearRebootView$GearSettingsObserver;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/systemui/statusbar/phone/GearRebootView$GearSettingsObserver;-><init>(Lcom/android/systemui/statusbar/phone/GearRebootView;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mGearSettingsObserver:Lcom/android/systemui/statusbar/phone/GearRebootView$GearSettingsObserver;

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/statusbar/phone/GearRebootView;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/android/systemui/statusbar/phone/GearRebootView;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mVisibilityKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/phone/GearRebootView;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/android/systemui/statusbar/phone/GearRebootView;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mColorKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/systemui/statusbar/phone/GearRebootView;)V
    .registers 1
    .param p0, "x0"    # Lcom/android/systemui/statusbar/phone/GearRebootView;

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/android/systemui/statusbar/phone/GearRebootView;->updateViewVisibility()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/systemui/statusbar/phone/GearRebootView;)V
    .registers 1
    .param p0, "x0"    # Lcom/android/systemui/statusbar/phone/GearRebootView;

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/android/systemui/statusbar/phone/GearRebootView;->updateViewColorOverlay()V

    return-void
.end method

.method private updateViewColorOverlay()V
    .registers 5

    .prologue
    .line 87
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mColorKey:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 88
    .local v0, "color":I
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, v0, v1}, Lcom/android/systemui/statusbar/phone/GearRebootView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 89
    return-void
.end method

.method private updateViewVisibility()V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 82
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mVisibilityKey:Ljava/lang/String;

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_f

    .line 83
    .local v0, "visibility":I
    :goto_b
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/phone/GearRebootView;->setVisibility(I)V

    .line 84
    return-void

    .line 82
    .end local v0    # "visibility":I
    :cond_f
    const/16 v0, 0x8

    goto :goto_b
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 46
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    .line 47
    invoke-virtual {p0, p0}, Lcom/android/systemui/statusbar/phone/GearRebootView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mVisibilityKey:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mGearSettingsObserver:Lcom/android/systemui/statusbar/phone/GearRebootView$GearSettingsObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 49
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mColorKey:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mGearSettingsObserver:Lcom/android/systemui/statusbar/phone/GearRebootView$GearSettingsObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 51
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 72
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 73
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.wubydax.gearreboot"

    const-string v3, "com.wubydax.gearreboot.GearRebootDialogService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 74
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, v0, v4}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-eqz v1, :cond_24

    .line 75
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 79
    :goto_23
    return-void

    .line 77
    :cond_24
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    const-string v2, "Service not found"

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_23
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 66
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 67
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mGearSettingsObserver:Lcom/android/systemui/statusbar/phone/GearRebootView$GearSettingsObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 68
    return-void
.end method

.method protected onFinishInflate()V
    .registers 6

    .prologue
    .line 55
    invoke-super {p0}, Landroid/widget/ImageView;->onFinishInflate()V

    .line 56
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "ic_gear_power"

    const-string v3, "drawable"

    iget-object v4, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 57
    .local v0, "id":I
    if-eqz v0, :cond_22

    .line 58
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/phone/GearRebootView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 60
    :cond_22
    invoke-direct {p0}, Lcom/android/systemui/statusbar/phone/GearRebootView;->updateViewColorOverlay()V

    .line 61
    invoke-direct {p0}, Lcom/android/systemui/statusbar/phone/GearRebootView;->updateViewVisibility()V

    .line 62
    return-void
.end method

.method openRebootService()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 35
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 36
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.wubydax.gearreboot"

    const-string v3, "com.wubydax.gearreboot.GearRebootDialogService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 37
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, v0, v4}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-eqz v1, :cond_24

    .line 38
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 42
    :goto_23
    return-void

    .line 40
    :cond_24
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/GearRebootView;->mContext:Landroid/content/Context;

    const-string v2, "Service not found"

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_23
.end method
