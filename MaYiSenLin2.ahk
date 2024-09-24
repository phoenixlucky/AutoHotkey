#SingleInstance force
CoordMode("Mouse", "Screen")
#Include FindText.ahk

; 定义一个全局变量来控制循环
global isRunning := false
ScreenWidth := A_ScreenWidth
ScreenHeight := A_ScreenHeight
t1:=A_TickCount, Text:=X:=Y:=""

; 当按下 F8 键时，开始锁屏与取消锁屏的循环
F8:: {
  isRunning := true
  ; 循环直到按下 F9 键停止
  while (isRunning) {
    Sleep(500)
    Text:="|<>##0.90$0/0/FFC484,4/0/D97C35,4/4/E97026,17/3/FFF9E5"
    if (ok:=FindText(&X:= "wait", &Y:= 3, 0, 546, 1919, 741, 0, 0, Text))
    {
      FindText().Click(X, Y, "L")
    }
    else {
      MsgBox("执行结束了！")
      break
    }

    Text := "|<一键收>**30$50.000E306M000CNs9a0003zz6NU001zWFazk000PaNjs007wdaHCTztzclhnDzyAzwPRnzzbWNCzw001zjngS000StYz7U003DzDls000n7Vwy000TtU7Rk003zz1yC0006TkT1c"
    if (ok2 := FindText(&X:= "wait", &Y:= 3,  0, 0, ScreenWidth, ScreenHeight, 0, 0, Text))
    {
      FindText().Click(X, Y, "L", 2)
    }
    Sleep(2500)
  }
}

; 当按下 F9 键时，停止循环
F9:: {
  isRunning := false
  ; 在停止循环时结束脚本的当前操作
  Reload
}