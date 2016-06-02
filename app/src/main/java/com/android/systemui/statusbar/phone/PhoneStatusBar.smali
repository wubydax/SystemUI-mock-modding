.class public Lcom/android/systemui/statusbar/phone/PhoneStatusBar;
.super Lcom/android/systemui/statusbar/BaseStatusBar;
.source "PhoneStatusBar.java"

# interfaces
.implements Lcom/android/systemui/statusbar/policy/HeadsUpManager$OnHeadsUpChangedListener;


# instance fields
.field mContext:Landroid/content/Context;

.field mHeadsUpManager:Lcom/android/systemui/statusbar/policy/HeadsUpManager;

.field mIsDataViewEnabled:Z

.field mNotificationPanel:Lcom/android/systemui/statusbar/phone/NotificationPanelView;

.field mStatusBarView:Lcom/android/systemui/statusbar/phone/PhoneStatusBarView;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/android/systemui/statusbar/BaseStatusBar;-><init>()V

    return-void
.end method

.method private handlePanelBgVisibility(Z)V
    .registers 8
    .param p1, "setVisible"    # Z

    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "gear_panel_bg_view"

    const-string v4, "id"

    iget-object v5, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .local v0, "id":I
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mNotificationPanel:Lcom/android/systemui/statusbar/phone/NotificationPanelView;

    invoke-virtual {v2, v0}, Lcom/android/systemui/statusbar/phone/NotificationPanelView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;

    .local v1, "panelBackgroundView":Lcom/android/systemui/statusbar/phone/PanelBackgroundView;
    invoke-virtual {v1, p1}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->setPanelBgVisibility(Z)V

    return-void
.end method


# virtual methods
.method protected makeStatusBarView()Lcom/android/systemui/statusbar/phone/PhoneStatusBarView;
    .registers 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->mStatusBarView:Lcom/android/systemui/statusbar/phone/PhoneStatusBarView;

    return-object v0
.end method

.method public onHeadsUpPinned(Lcom/android/systemui/statusbar/ExpandableNotificationRow;)V
    .registers 3
    .param p1, "headsUp"    # Lcom/android/systemui/statusbar/ExpandableNotificationRow;

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->handlePanelBgVisibility(Z)V

    .line 61
    return-void
.end method

.method public onHeadsUpPinnedModeChanged(Z)V
    .registers 2
    .param p1, "inPinnedMode"    # Z

    .prologue
    .line 56
    return-void
.end method

.method public onHeadsUpStateChanged(Lcom/android/systemui/statusbar/NotificationData$Entry;Z)V
    .registers 3
    .param p1, "entry"    # Lcom/android/systemui/statusbar/NotificationData$Entry;
    .param p2, "isHeadsUp"    # Z

    .prologue
    .line 71
    return-void
.end method

.method public onHeadsUpUnPinned(Lcom/android/systemui/statusbar/ExpandableNotificationRow;)V
    .registers 3
    .param p1, "headsUp"    # Lcom/android/systemui/statusbar/ExpandableNotificationRow;

    .prologue
    .line 65
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/systemui/statusbar/phone/PhoneStatusBar;->handlePanelBgVisibility(Z)V

    .line 66
    return-void
.end method
