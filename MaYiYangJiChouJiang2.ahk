#SingleInstance force
CoordMode("Mouse", "Screen")
#Include FindText.ahk

global isRunning := false
global SX:=""
global SY:=""
ScreenWidth := A_ScreenWidth
ScreenHeight := A_ScreenHeight
t1:=A_TickCount, Text:=X:=Y:=""

; 定义兑换操作的函数
performExchange(repeatCount := 2, scrollTimes := 3) {
    global SX, SY
    Loop repeatCount {
        Send("{WheelDown " scrollTimes "}")  ; 滚轮向下
        MouseMove(SX+150, SY+140, 50)  ; 移动到兑换位置
        Click("left", "1")  ; 点击兑换
        Sleep(2000)
        MouseMove(SX+80, SY+80, 50)  ; 移动到兑换子页面
        Click("left", "1")  ; 点击确认兑换
        Sleep(2000)
    }
}

; 定义浏览操作的函数
performBrowse(repeatCount := 3, scrollCount := 5, wheelDownTimes := 3) {
    Loop repeatCount {
        Send("{WheelDown " wheelDownTimes "}")  ; 滚轮向下 3 次
        Text:="|<杂货铺>*166$32.3006kDz03Anzs3Xw761vsVVgGyTkT0VysnU8DDzs7zXzz1zQ4k0NX3Bk6MlnC1DwskkDT9w0T1sA0202U"
        if (ok:=FindText(&X:= "wait", &Y:= 3, 0, 0, ScreenWidth, ScreenHeight, 0, 0, Text))
            {
              MouseMove(X+200, Y, 50)
            }
          ; 浏览
        Click("left", "1")  ; 点击浏览
        Sleep(2000)

        ; 内部循环处理上划和滚动
        Loop scrollCount {
            Text:="|<>*220$34.zzzvzzzzzbbzzzyM3zzz0TDzzy1wzzzyS3zzz00Dk0w0Dk01uQzUDz03Dzzw0AzzzkQ3zzz1kDzzs00TzzW01zzzS03zzzjVs"
            if (ok:=FindText(&X:= "wait", &Y:= 3, 0, 0, ScreenWidth, ScreenHeight, 0, 0, Text))
                {
                  MouseMove(X+120, Y, 50)
                }
            Send("{WheelDown 1}")  ; 滚轮向下 1 次
            Sleep(5000)
        }
        Text:="|<>*220$34.zzzvzzzzzbbzzzyM3zzz0TDzzy1wzzzyS3zzz00Dk0w0Dk01uQzUDz03Dzzw0AzzzkQ3zzz1kDzzs00TzzW01zzzS03zzzjVs"
        if (ok:=FindText(&X:= "wait", &Y:= 3, 0, 0, ScreenWidth, ScreenHeight, 0, 0, Text))
            {
                MouseMove(X-30, Y, 50)
                Click("left", "1")  ; 点击返回
            }
        Sleep(3000)
        if (ok:=FindText(&X:= "wait", &Y:= 3, 0, 0, ScreenWidth, ScreenHeight, 0, 0, Text))
            {
              MouseMove(X, Y+80, 50)
              Click("left", "1")  ; 领奖
            }
		Sleep(4000)
    }
}

; 按下 F8 键时，开始执行循环
F8:: {
    isRunning := true
    Text:="|<>*193$24.zzzzw0k1s001s0U1s0U3sMVXs0V3k0V3k0V3kkX3kEX3k037k137k137lz27ll07Vl0DU17zUF7yUF7yzz7yU"
    if (ok:=FindText(&X:= "wait", &Y:= 3, 0, 0, ScreenWidth, ScreenHeight, 0, 0, Text))
        {
            global SX, SY
            MouseMove(X, Y+90, 50)
            SX:=X,SY:=Y
        }
    Click("left", "2")
	Send("{WheelDown 3}")

    ; 循环直到按下 F9 键停止
    while (isRunning) {
        ;MouseMove(SX+140, SY+140, 50)  ; 免费
        ;Click("left", "1")
        ;Sleep(3000)

        ;2执行 2 次兑换操作
        ;performExchange(2,3)

        ;3浏览部分
        performBrowse(3,5,3)
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
