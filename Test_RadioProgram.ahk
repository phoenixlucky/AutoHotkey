#Requires AutoHotkey v2.0
MyGui := Gui()  ; 创建一个新的 GUI 窗口

; 添加按钮1，点击后执行程序1
MyGui.Add("Button", "x50 y50 w100 h30", "程序1").OnEvent("Click", RunProgram1)

; 添加按钮2，点击后执行程序2
MyGui.Add("Button", "x50 y100 w100 h30", "程序2").OnEvent("Click", RunProgram2)

; 添加按钮3，点击后执行程序3
MyGui.Add("Button", "x50 y150 w100 h30", "程序3").OnEvent("Click", RunProgram3)

MyGui.Show("w200 h250")  ; 显示 GUI 窗口并设置大小
MyGui.Title := "选择程序"

; 按钮1的点击事件，执行程序1
RunProgram1(*) {
    Run("notepad.exe")  ; 示例：运行记事本程序
}

; 按钮2的点击事件，执行程序2
RunProgram2(*) {
    Run("calc.exe")  ; 示例：运行计算器程序
}

; 按钮3的点击事件，执行程序3
RunProgram3(*) {
    Run("mspaint.exe")  ; 示例：运行画图程序
}

F9::ExitApp  ; 按下 F9 退出脚本

