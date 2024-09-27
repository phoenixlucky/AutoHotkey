#SingleInstance force
CoordMode("Mouse", "Screen")
#Include FindText.ahk
log(message) {
  OutputDebug message  ; 输出到调试控制台
}

logMultiple(params*) {
  message := ""
  for index, value in params {
      message .= value . (index < params.Length ? ", " : "")  ; 使用 Count() 获取长度
  }
  log(message)  ; 调用 log 函数输出
}

; 定义一个全局变量来控制循环
global isRunning := false
; ScreenWidth := A_ScreenWidth
; ScreenHeight := A_ScreenHeight
t1:=A_TickCount, Text:=X:=Y:=""
X1 := "", Y1 := "", Width := "", Height := ""


; 当按下 F8 键时，开始锁屏与取消锁屏的循环
F8:: {
    isRunning := true
    WinGetPos(&X1, &Y1, &Width, &Height, "跨屏互联")
    ; logMultiple(X1,Y1, Width, Height)
    ; MsgBox(X1+Y1)
    ;开始
    Text:="|<>##0.85$0/0/FDD94D,-5/0/FFD84D,-12/-10/E1F1FB,-5/-14/E0F3FD,-21/-15/FD4C4B,-24/-14/FF4E48,-24/9/4E87FB,-26/13/4F86FF"
    if (ok:=FindText(&X:= "wait", &Y:=3,X1, Y1+500, X1+Width, Y1+Height,0.3,0.2, Text))
        {
          Sleep(200)
          MouseMove(X, Y,100)
          Click("left", 2)
          MouseMove(X, Y+20,100)
          Click("left", 2)
          MouseMove(X, Y-20,100)
          Click("left", 2)
        }
    ;结束
    ; 循环直到按下 F9 键停止
    Text:="|<>##0.82$0/0/FDD94D,-5/0/FFD84D,-12/-10/E1F1FB,-5/-14/E0F3FD,-21/-15/FD4C4B,-24/-14/FF4E48,-24/9/4E87FB,-26/13/4F86FF"
    while (isRunning) {     
        if (ok:=FindText(&X, &Y, X1+50, Y1+150, X1+Width-50, Y1+550 ,0.3,0.2, Text))
            {
              MouseMove(X, Y+20,100)
              Click("left", 2)
              MouseMove(X+20, Y+30,100)
              Click("left", 2)
              MouseMove(X-20, Y+20,100)
              Click("left", 2)
            }
    }
    

}

; 当按下 F9 键时，停止循环
F9:: {
    WinGetPos(&X1, &Y1, &Width, &Height, "跨屏互联")
    Text:="|<>*184$25.yzzzy1zzs0TzymTzz9DzzY7U001k0S7zzw1zzwGDzwtrzzxzzzU"
    if (ok:=FindText(&X, &Y, X1, Y1, X1+Width, Y1+Height ,0.2,0.1, Text))
      {
        FindText().Click(X, Y, "L",1)
      }
    isRunning := false
    ; 在停止循环时结束脚本的当前操作
    Reload
}