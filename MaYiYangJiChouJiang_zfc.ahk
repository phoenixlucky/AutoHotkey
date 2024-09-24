CoordMode("Mouse", "Screen")
global isRunning := false
global difference :=80
global difference1 :=20

; 定义兑换操作的函数
performExchange(repeatCount := 2, scrollTimes := 3) {
    Loop repeatCount {
        wheeldownnew(scrollTimes)  ; 滚轮向下
        MouseMove(1843, 518+difference, 50)  ; 移动到兑换位置
        Click("left", "1")  ; 点击兑换
        Sleep(1000)
        MouseMove(1769, 538, 50)  ; 移动到兑换子页面
        Click("left", "1")  ; 点击确认兑换
        Sleep(1000)
    }
}

; 定义函数来模拟鼠标滚轮
MouseWheel(direction, times) {
    Loop times {
        if (direction == "down") {
            DllCall("mouse_event", "UInt", 0x0800, "Int", 0, "Int", 0, "UInt", -120, "UInt", 0)  ; 滚轮向下
        } else {
            DllCall("mouse_event", "UInt", 0x0800, "Int", 0, "Int", 0, "UInt", 120, "UInt", 0)  ; 滚轮向上
        }
        Sleep(100)  ; 每次滚动后等待一点时间
    }
}

wheeldownnew(wheelDownTimes := 3){
	MouseWheel("down", wheelDownTimes)  ; 模拟向下滚动 3 次
	;MouseClick("WheelDown", , , wheelDownTimes)  ; 滚轮向下滚动 3 次
	;Send("{WheelDown wheelDownTimes}")
}

; 定义浏览操作的函数
performBrowse(repeatCount := 3, scrollCount := 5, wheelDownTimes := 3) {
    Loop repeatCount {
        wheeldownnew(3)  ; 滚轮向下 3 次
        MouseMove(1843, 518+difference, 50)  ; 浏览
        Click("left", "1")  ; 点击浏览
        Sleep(2000)

        ; 内部循环处理上划和滚动
        Loop scrollCount {
            MouseMove(1843, 623+difference, 50)  ; 上划
            wheeldownnew(1)  ; 滚轮向下 1 次
            Sleep(5000)
        }

        MouseMove(1514, 127, 50)  ; 返回
        Click("left", "1")  ; 点击返回
        Sleep(3000)
        MouseMove(1843, 518+difference, 50)  ; 领奖
		Click("left", "1")  ; 点击返回
		Sleep(3000)
    }
}

; 按下 F8 键时，开始执行循环
F8:: {
    isRunning := true
    MouseMove(1843, 518+difference, 50)
	Click("left", "1")
	wheeldownnew(3)
	

    ; 循环直到按下 F9 键停止
    while (isRunning) {
        Sleep(3000)
        ;MouseMove(1843, 518+difference, 50)  ; 免费
        Click("left", "1")
        Sleep(3000)

        ;2执行 2 次兑换操作
        performExchange(2,3)

        ;3浏览部分
        performBrowse(3,5,3)
    }
}

; 按下 F9 键时，停止循环
F9:: {
    isRunning := false
	Reload
}
