#Requires AutoHotkey v2.0

#h::  ; Win+H 热键
{
    ; 保存剪贴板当前的内容以便后面恢复
    ClipboardOld := A_Clipboard  ; 获取当前剪贴板内容
    Clipboard := ""  ; 清空剪贴板，确保能获取到新的内容
    
    ; 发送 Ctrl+C 复制文本
    SendInput("^c")
    
    ; 等待剪贴板更新，增加延迟时间
    Sleep(500)  ; 等待500毫秒让剪贴板内容更新

    
    ; 等待剪贴板更新，超时时间设置为 1 秒
    if !ClipWait(1)  ; 如果在1秒内没有获取到内容
    {
        Clipboard := ClipboardOld  ; 恢复剪贴板之前的内容
        MsgBox("未能捕获剪贴板内容1")
        return
    }

    ; 获取剪贴板内容
    ClipContent := Clipboard  ; 不需要使用 Clipboard() 函数，直接获取内容
    
    ; 检查是否成功获取剪贴板内容
    if ClipContent = ""
    {
        MsgBox("剪贴板为空或未能捕获内容2")
        Clipboard := ClipboardOld  ; 恢复剪贴板之前的内容
        return
    }

    ; 处理特殊字符
    ClipContent := StrReplace(ClipContent, "`r`n", "``n")  ; 替换换行符
    ClipContent := StrReplace(ClipContent, "`t", "``t")    ; 替换制表符

    ; 恢复剪贴板之前的内容
    Clipboard := ClipboardOld

    ; 显示输入框，并传递剪贴板内容作为默认值
    ShowInputBox(":T:`::" ClipContent)
}

ShowInputBox(DefaultValue := "")
{
    ; 设置定时器，移动输入框的光标到适当位置
    SetTimer(MoveCaret, 10)

    ; 显示输入框，提供默认值
    IB := InputBox("
    (
    输入你的缩写并在指示点处填写。你也可以编辑替换文本。

    示例条目: :T:btw`::by the way
    )", "New Hotstring",, DefaultValue)

    ; 检查用户是否取消输入框
    if !IB.Ok  ; 用户选择了取消
        return

    ; 使用正则表达式匹配输入框内容，并提取缩写和替换内容
    if RegExMatch(IB.Value, "(?P<Label>:.*?:(?P<Abbreviation>.*?))::(?P<Replacement>.*)", Hotstring)
    {
        if !Hotstring.Abbreviation
            MsgText := "你没有提供缩写"
        else if !Hotstring.Replacement
            MsgText := "你没有提供替换内容"
        else
        {
            Hotstring(Hotstring.Label, Hotstring.Replacement)  ; 创建新的热字串
            FileAppend("`n" IB.Value, A_ScriptFullPath)  ; 保存热字串以备以后使用
        }
    }
    else
        MsgText := "热字串格式似乎不正确"

    if MsgText
    {
        Result := MsgBox(MsgText ". 要重试吗?", "提示", 4)
        if Result = "Yes"
            ShowInputBox(DefaultValue)
    }

    ; 定义 MoveCaret 函数以将光标移到输入框的适当位置
    MoveCaret()
    {
        if WinWait("New Hotstring")
        {
            Send("{Home}{Right 3}")
            SetTimer("MoveCaret", 0)  ; 停止定时器
        }
    }
}