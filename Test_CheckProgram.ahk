#Requires AutoHotkey v2.0
MyGui := Gui()  ; 创建一个新的 GUI 窗口

; 添加复选框1
Checkbox1 := MyGui.Add("Checkbox", "x50 y50", "程序1")

; 添加复选框2
Checkbox2 := MyGui.Add("Checkbox", "x50 y100", "程序2")

; 添加复选框3
Checkbox3 := MyGui.Add("Checkbox", "x50 y150", "程序3")

; 添加按钮，用于执行勾选的程序
MyGui.Add("Button", "x50 y200 w100 h30", "执行").OnEvent("Click", RunSelectedPrograms)

MyGui.Show("w400 h300")  ; 显示 GUI 窗口并设置大小
MyGui.Title := "选择并执行程序"

; 点击按钮时执行勾选的程序
RunSelectedPrograms(*) {
    if Checkbox1.Value  ; 如果复选框1被勾选
    {
        Run("notepad.exe")  ; 示例：运行记事本程序
    }
    if Checkbox2.Value  ; 如果复选框2被勾选
    {
        Run("calc.exe")  ; 示例：运行计算器程序
    }
    if Checkbox3.Value  ; 如果复选框3被勾选
    {
        Run("mspaint.exe")  ; 示例：运行画图程序
    }
}

F9::ExitApp  ; 按下 F9 退出脚本

