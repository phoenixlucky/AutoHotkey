MyGui := Gui()  ; 创建一个新的 GUI 窗口
;MyGui.Add("Picture", "x20 y20 w200 h200", "C:\path\to\image.jpg")  ; 添加图片控件
MyGui.Add("Button", "x50 y250 w100 h30", "确定").OnEvent("Click", ButtonClick)  ; 添加按钮控件，并绑定点击事件

MyGui.Show("w300 h350")  ; 显示 GUI 窗口，设置大小
MyGui.Title := "图像界面示例"  ; 设置窗口标题

ButtonClick(*) {
    MsgBox("您点击了按钮！")
}

F9::ExitApp  ; 按下 F9 退出脚本
