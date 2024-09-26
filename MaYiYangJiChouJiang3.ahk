#SingleInstance force
CoordMode("Mouse", "Screen")
#Include FindText.ahk

global isRunning := false
global SX := ""
global SY := ""
ScreenWidth := A_ScreenWidth
ScreenHeight := A_ScreenHeight
t1 := A_TickCount, Text := X := Y := ""

; 定义兑换操作的函数
performExchange(repeatCount := 2, scrollTimes := 3) {
    Loop repeatCount {
        Send("{WheelDown " scrollTimes "}")  ; 滚轮向下
        Text:="|<>*166$33.400800kz1XyTzUSTtkE3s3D20vTvvz6Tz6T0y0PwE1XvTbsAzNzz1aPDW0AnPoF1jvq38DSMkT1kD63kA1o"
        if (ok := FindText(&X := "wait", &Y := 3, 640, 0, ScreenWidth, ScreenHeight, 0.2, 0.2, Text))
            {
                MouseMove(X + 200, Y, 50)
                Click("left", "1")  ; 点击浏览
                Text:="|<>*191$29.XnzbDXbzCTbDw0TyTk0kwzbxttzDvnly07b3y0T+HzNy1bwnw3bnaMD6D0zzQz3"
                if (ok := FindText(&X := "wait", &Y := 3, 640, 0, ScreenWidth, ScreenHeight, 0.2, 0.2, Text))
                    {
                        MouseMove(X, Y, 50)
                        Click("left", "1")  ; 点击浏览
                    }

            } else {
                break
                ; MsgBox("没找到杂货铺！！！")
            }
    }
    return
}

; 定义浏览操作的函数
performBrowse(repeatCount := 3, scrollCount := 5, wheelDownTimes := 3) {
    Loop repeatCount {
        Send("{WheelDown " wheelDownTimes "}")  ; 滚轮向下 3 次
        Text := "|<杂货铺>*166$32.3006kDz03Anzs3Xw761vsVVgGyTkT0VysnU8DDzs7zXzz1zQ4k0NX3Bk6MlnC1DwskkDT9w0T1sA0202U"
        if (ok := FindText(&X := "wait", &Y := 3, 640, 0, ScreenWidth, ScreenHeight, 0.2, 0.2, Text))
        {
            MouseMove(X + 200, Y, 50)
            Click("left", "1")  ; 点击浏览
        } else {
            break
            ; MsgBox("没找到杂货铺！！！")
        }
        Sleep(2000)

        ; 内部循环处理上划和滚动
        Loop scrollCount {
            Text := "|<>*220$34.zzzvzzzzzbbzzzyM3zzz0TDzzy1wzzzyS3zzz00Dk0w0Dk01uQzUDz03Dzzw0AzzzkQ3zzz1kDzzs00TzzW01zzzS03zzzjVs"
            if (ok := FindText(&X := "wait", &Y := 3, 640, 0, ScreenWidth, ScreenHeight, 0.2, 0.2, Text))
            {
                MouseMove(X + 120, Y, 50)
            }
            Send("{WheelDown 1}")  ; 滚轮向下 1 次
            Sleep(5000)
        }
        Text := "|<>*220$34.zzzvzzzzzbbzzzyM3zzz0TDzzy1wzzzyS3zzz00Dk0w0Dk01uQzUDz03Dzzw0AzzzkQ3zzz1kDzzs00TzzW01zzzS03zzzjVs"
        if (ok := FindText(&X := "wait", &Y := 3, 640, 0, ScreenWidth, ScreenHeight,  0.2, 0.2, Text))
        {
            MouseMove(X - 30, Y, 50)
            Click("left", "1")  ; 点击返回
        }
        Sleep(2000)
        Text := "|<>*180$22.k003000A000k102248M0EVU126048MMFVU16600MM0VXU26CDsEksU3320Q08Tk8Xz0WDw7Mzs"
        if (ok := FindText(&X := "wait", &Y := 3, 640, 0, ScreenWidth, ScreenHeight,  0.2, 0.2, Text))
        {
            MouseMove(X, Y, 50)
            Click("left", "1")  ; 领奖
        }
        Sleep(1000)
    }
    return
}

prizeDraw() {
    global isRunning
    Loop 6 {
        Send("{WheelDown " 3 "}")  ; 滚轮向下 3 次
        Text:="|<>*176$48.wDsDwkkHsDsTs0U0sDsTs0U0k7kTsEU0U601zUzlU401w0kVU001s1U1sM01kV03sMEVkV07sMEVnV0DkMEVzwDzU801zwDz0801k0010801k0010MU3U001kkVXk003kkV3zU3zUkV3k0UD0k03U1U31k03U3U31k070Tw37w0TjzzzU"
        if (ok := FindText(&X := "wait", &Y := 3, 640, 0, ScreenWidth, ScreenHeight, 0.4, 0.2, Text))
        {
            MouseMove(X, Y, 50)
            Click("left", "1")  ; 点击
        }
        ; MouseMove(201 + X, 440 + Y, 50)  ; 返回
        ;抽奖机会用完
        Text := "|<>*180$35.zzzznzU0DzbzCCT00Cyww00BxttzyM03nzxk07s0DbjjzzzTTTzzyEQw00A01s00HtvzaTbrryQzDjjstkz8TXnVyEwDU7zztztk"
        if (ok := FindText(&X, &Y, 0, 0, ScreenWidth, ScreenHeight, 0.3, 0.1, Text))
        {
            isRunning := false
            break  ; 找到后退出循环
        } else {
            Sleep(1000)
            Text := "|<>*180$13.zRbYt06wzs29t40mSN0AXaE34300D08"
            if (ok := FindText(&X := "wait", &Y := 3, 640, 0, ScreenWidth, ScreenHeight, 0.2, 0.2, Text))
            {
                MouseMove(X, Y, 50)
                Click("left", "1")  ; 点击
                Sleep(1000)
            }
           
        }

    }
    ; MsgBox("执行结束！")
    return  ; 完全退出函数
}

; 按下 F8 键时，开始执行循环
F8:: {
    global isRunning
    isRunning := true
    Text := "|<>*180$22.k003000A000k102248M0EVU126048MMFVU16600MM0VXU26CDsEksU3320Q08Tk8Xz0WDw7Mzs"
    if (ok := FindText(&X := "wait", &Y := 3, 640, 0, ScreenWidth, ScreenHeight, 0.4, 0.2, Text))
    {
        global SX, SY
        MouseMove(X, Y + 100, 50)
        SX := X, SY := Y
        Click("left", "1")
        Send("{WheelDown 3}")
        ; MsgBox("找到了！！！")
    }

    ; 循环直到按下 F9 键停止
    while (isRunning) {
        global SX, SY
        ; 免费
        Text:="|<>*176$48.wDsDwkkHsDsTs0U0sDsTs0U0k7kTsEU0U601zUzlU401w0kVU001s1U1sM01kV03sMEVkV07sMEVnV0DkMEVzwDzU801zwDz0801k0010801k0010MU3U001kkVXk003kkV3zU3zUkV3k0UD0k03U1U31k03U3U31k070Tw37w0TjzzzU"
        if (ok:=FindText(&X, &Y,  640, 0, ScreenWidth, ScreenHeight, 0.2, 0.2, Text))
        {
        FindText().Click(X, Y, "L")
        }
        Sleep(1000)

        ;3浏览部分
        ;performBrowse(3,5,3)

        ;2执行 2 次兑换操作
        ; performExchange(2,3)

        ;抽奖
        prizeDraw()
    }
}

; 按下 F9 键时，停止循环
F9:: {
    Reload  ; 按下 F9 重新加载脚本，而不是退出
    global isRunning
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