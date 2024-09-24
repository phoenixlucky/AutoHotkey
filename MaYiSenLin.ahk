CoordMode("Mouse","Screen")
; 定义一个全局变量来控制循环
global isRunning := false

; 当按下 F8 键时，开始锁屏与取消锁屏的循环
F8:: {
    isRunning := true
    
    ; 循环直到按下 F9 键停止
    while (isRunning) {
		Sleep(500)
		MouseMove(1842,642, 50)  ; 50 表示中等速度
		Click("left", "2")
		Sleep(3000)
		MouseMove(1695,578, 50)  ; 50 表示中等速度
		Click("left", "2")
		Sleep(2500)
        
        
    }
}

; 当按下 F9 键时，停止循环
F9:: {
    isRunning := false
    ; 在停止循环时结束脚本的当前操作
    Reload
}