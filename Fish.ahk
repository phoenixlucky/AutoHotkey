global isRunning := false  ; 定义一个全局变量控制循环
#hotif winactive("ahk_exe PC Connect.exe")
LeftClick2() {
    Click("left", 2)  ; 执行两次左键点击，相当于双击
}

; 当按下 F8 键时，开始循环
F8:: {
    isRunning := true  ; 开始循环

    ; 循环直到按下 F9 键停止
    while (isRunning) {
        ; 执行 5 次操作作为一个循环
        Loop 14 {
            MouseMove(1601, 791, 50)  ; 移动鼠标到指定位置
			
            LeftClick2()  ; 执行双击
            Sleep(4000)  ; 等待 12 秒
			LeftClick2()  ; 执行双击
			Sleep(6000)  ; 等待 12 秒
			MouseMove(627, 781, 50)
        }
        ; 重置 n 的值，开始新的一轮 5 次操作
        n := 0
    }
}

; 当按下 F9 键时，停止循环
F9:: {
    isRunning := false  ; 停止循环
	Reload
}
