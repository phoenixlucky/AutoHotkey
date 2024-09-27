#SingleInstance force
global isRunning := false  ; 定义一个全局变量控制循环
#hotif winactive("ahk_exe PC Connect.exe")
#Include FindText.ahk
LeftClick2() {
    Click("left", 2)  ; 执行两次左键点击，相当于双击
}
X1 := "", Y1 := "", Width := "", Height := ""
XS := "", YS := ""
; 当按下 F8 键时，开始循环
F8:: {
    isRunning := true  ; 开始循环
    WinGetPos(&X1, &Y1, &Width, &Height, "ahk_exe PC Connect.exe")
    ; 循环直到按下 F9 键停止
    while (isRunning) {
        ; 执行 5 次操作作为一个循环
        Text := "|<>*81$57.zzxzzzzzzzzz7zzzzzzzzwDzzzzzzzzkTzzzzzzzz1zzzzzzzzw7zzzzzzzvkTzzzzzzzD1zzzzzzzlw7zzzzzzyDkTzzzzzzlz1zzzzzzw7w7zzzzzzkzkzzzzzzyTy3zzzzzzzzwDzzzzzzzzUzzzzzzvzy3zzzzzzTzsDzzzzzvzzUzzzzzzTzw3zzzzzvzzkDzzzzzTzz1zzzzzvzzxzzzzzzTzzy1zzzzvzzzU3zzzzTzykMDzzzvzzkC0zzzzTzy3VXzzzzzzkMCTzk3zzy21nzs03zzk0CDw003zy01nz000D1s0CTs6100703nz1sM00w0wTs6600DUD7z01k01y3Uzs0A00TkMTz03003y27bs0k00DUTsTU6000s3y3w1U0000TUDks00003w1z200000Tk7s000007y0TU00000zs3y000007z0Ds00000zw1zk0000DzU7z00001zy1zz0000TzkTzs0007zzDzz0001zzzzzs000Tzzzzy000Dzzzzzk10Dzzzzzy0Dzzzzzzzk3zzzzzzzz0Tzzzzzzzs7zzzzzzzz0zzzzzzzzsDzzzzzzzzVzzzzzzzzyTzzzzzzU"
        if (ok := FindText(&X := "wait", &Y := 3, &X1, &Y1, &Width, &Height, 0.3, 0.2, Text))
        {
            global XS, YS
            FindText().Click(X, Y, "L")
            XS := X, YS := Y
        } else {
            XS :=1428,YS :=768
        }
        Sleep(3000)  ; 等待 12 秒
        Text := "|<>##0.90$0/0/EFF5D9,-12/5/FFCE0A,-17/6/F9D317,-17/11/FFCD0A,-1/11/FFCE07,-7/16/FFCE0B,-12/19/FFD607,-8/25/FFCF08,9/18/FECC04,8/25/F8F2D8,-19/21/EFF3D9,-23/12/F2F3D7"
        if (ok := FindText(&X := "wait", &Y := 2, XS - 100, YS - 100, XS + 100, YS + 100, 0.3, 0.2, Text))
        {
            FindText().Click(X, Y, "L")
        }
        Text := "|<>*150$13.DzDzb03U1zyzzQQAC6733XVlkskQE"
        if (ok := FindText(&X := "wait", &Y := 2, &X1, &Y1, &Width, &Height, 0.3, 0.2, Text))
        {   MsgBox("1")
            FindText().Click(X, Y - 200, "L", 3)
            Sleep(500)
            Click("left", "1")
        }
        else{ 
            Text := "|<>*201$31.1U0M00k0C00TsDzkDw7zs6070A3U7zazznznTzssPUM0ABkDk7ys7w3zM3D1U01VUk00k0TzkM0DzsA0002"
            if (ok := FindText(&X := "wait", &Y := 2, &X1, &Y1, &Width, &Height, 0.3, 0.2, Text))
            {   
                FindText().Click(X, Y - 200, "L", 3)
                Sleep(2000)
                Click("left", "1")
            }
        }

    }
}


; 当按下 F9 键时，停止循环
F9:: {
    isRunning := false  ; 停止循环
    Reload
}