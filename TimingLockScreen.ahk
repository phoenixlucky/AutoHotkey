; 定义一个全局变量来控制循环
global isRunning := false

; 当按下 F8 键时，开始锁屏与取消锁屏的循环
F8:: {
    isRunning := true
    
    ; 循环直到按下 F9 键停止
    while (isRunning) {
		; 再等待 20 秒，模拟锁屏后的暂停期
		Sleep(20000)
        ; 模拟按下 Win+L 键进行锁屏
        DllCall("LockWorkStation")
        
        ; 等待 5 秒（期间用户需要手动解锁）
        Sleep(5000)
		
		; 解锁屏幕
		MouseMove(941 585, 50)  ; 50 表示中等速度
		Click("down")
		Sleep(2000)
		Click("down")
        
        
    }
}

; 当按下 F9 键时，停止循环
F9:: {
    isRunning := false
    ; 在停止循环时结束脚本的当前操作
    ExitApp
}