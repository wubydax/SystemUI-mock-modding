.class Lcom/android/systemui/statusbar/phone/PanelBackgroundView$1;
.super Ljava/lang/Object;
.source "PanelBackgroundView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->setPanelBgVisibility(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/phone/PanelBackgroundView;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/phone/PanelBackgroundView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/android/systemui/statusbar/phone/PanelBackgroundView;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView$1;->this$0:Lcom/android/systemui/statusbar/phone/PanelBackgroundView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 130
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PanelBackgroundView$1;->this$0:Lcom/android/systemui/statusbar/phone/PanelBackgroundView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/phone/PanelBackgroundView;->setVisibility(I)V

    .line 131
    return-void
.end method
