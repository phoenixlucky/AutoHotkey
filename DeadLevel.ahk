CoordMode("Mouse","Screen")
; 定义一个全局变量来控制循环
global isRunning := false

; 当按下 F8 键时，开始锁屏与取消锁屏的循环
F8:: {
    isRunning := true
	MouseMove(65,241, 50)  ; 50 表示中等速度
	Sleep(1000)
	Click("left", "1")
    
    ; 循环直到按下 F9 键停止
    while (isRunning) {
		Sleep(5000)
		MouseMove(1110,408, 80)  ;选择模式
		Click("left", "1")
		Sleep(3000)
		MouseMove(1064,713, 80) ;开始
		Click("left", "1")
		Sleep(7000) 
		MouseMove(569,142, 50) ;游戏快进
		Click("left", "1")
		Sleep(3000)
		Click("left", "1")
		Sleep(3000)
		Click("left", "1")
		Sleep(3000)
		Click("left", "1")
		Sleep(5000)
		MouseMove(609,614, 50)  ; 50 表示中等速度
		Click("left", "1")
		Sleep(2000)
		Click("left", "1")
        Sleep(2000)      
		Click("left", "1")
		Sleep(2000)    
		Click("left", "1")
		Sleep(2000)    
		Click("left", "2")
		Sleep(2000) 
		Click("left", "1")
		Sleep(2000)   
		Click("left", "2")
		Sleep(2000)   
		Click("left", "1")
		Sleep(2000)   
		Click("left", "1")
		Sleep(2000)   
    }
}

; 当按下 F9 键时，停止循环
F9:: {
    isRunning := false
    ; 在停止循环时结束脚本的当前操作
    Reload
}