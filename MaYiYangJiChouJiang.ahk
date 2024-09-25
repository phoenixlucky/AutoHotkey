CoordMode("Mouse", "Screen")
global isRunning := false
; 获取指定窗口的位置和尺寸
X := 0, Y := 0, Width := 0, Height := 0


; 定义兑换操作的函数
performExchange(repeatCount := 2, scrollTimes := 3) {
    Loop repeatCount {
        Send("{WheelDown " scrollTimes "}")  ; 滚轮向下
        MouseMove(1843 - 1497 + X, 594 - 8 + Y, 50)  ; 移动到兑换位置
        Click("left", "1")  ; 点击兑换
        Sleep(2000)
        MouseMove(1769 - 1497 + X, 538 - 8 + Y, 50)  ; 移动到兑换子页面
        Click("left", "1")  ; 点击确认兑换
        Sleep(2000)
    }
}

; 定义浏览操作的函数
performBrowse(repeatCount := 3, scrollCount := 5, wheelDownTimes := 3) {
    Loop repeatCount {
        Send("{WheelDown " wheelDownTimes "}")  ; 滚轮向下 3 次
        MouseMove(1843 - 1497 + X, 594 - 8 + Y, 50)  ; 浏览
        Click("left", "1")  ; 点击浏览
        Sleep(2000)

        ; 内部循环处理上划和滚动
        Loop scrollCount {
            MouseMove(1505 - 1497 + X, 623 - 8 + Y, 50)  ; 上划
            Send("{WheelDown 1}")  ; 滚轮向下 1 次
            Sleep(5000)
        }

        MouseMove(1514 - 1497 + X, 127 - 8 + Y, 50)  ; 返回
        Click("left", "1")  ; 点击返回
        Sleep(3000)
        MouseMove(1843 - 1497 + X, 594 - 8 + Y, 50)  ; 领奖
        Click("left", "1")  ; 点击返回
        Sleep(4000)
    }
}

prizeDraw() {
    Loop 6 {
        MouseMove(201 + X, 440 + Y, 50)  ; 返回
        Click("left", "1")  ; 点击
        Sleep(3000)
        MouseMove(199 + X, 616 + Y, 50)  ; 返回
        Click("left", "1")  ; 点击
        Sleep(1000)
    }
}

; 按下 F8 键时，开始执行循环
F8:: {
    isRunning := true
    global X, Y
    WinGetPos(&X, &Y, &Width, &Height, "跨屏互联")
    ; 显示窗口位置和尺寸
    ;MsgBox("窗口位置: X=" X " Y=" Y "`n宽度: " Width " 高度: " Height)
    MouseMove(1843 - 1497 + X, 594 - 8 + Y, 50)
    Send("{WheelDown 3}")

    ; 循环直到按下 F9 键停止
    while (isRunning) {
        ; MouseMove(1843-1497+X, 594-8+Y, 50)  ; 免费
        ; Click("left", "1")
        Sleep(3000)

        ;3浏览部分
        performBrowse(3, 5, 3)

        
        ;2执行 2 次兑换操作
        performExchange(2,3)

        ;抽奖
        ; prizeDraw()
    }
}

; 按下 F9 键时，停止循环
F9:: {
    Reload  ; 按下 F9 重新加载脚本，而不是退出
    isRunning := false
}

F11:: {

    ; 内部循环处理上划和滚动
    Loop 5 {
        MouseMove(1505, 623, 50)  ; 上划
        Send("{WheelDown 1}")  ; 滚轮向下 1 次
        Sleep(5000)
    }

    MouseMove(1514, 127, 50)  ; 返回
    Click("left", "1")  ; 点击返回
    Sleep(3000)
}