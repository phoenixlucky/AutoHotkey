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
    Sleep(200)
    Text:="|<>##0.90$0/0/FE9B39,0/4/FEA854,-1/14/F1AC63,2/20/F99E3D,6/10/FFA142,4/8/FFFCE2,2/5/FFFEFA"
    if (ok:=FindText(&X:= "wait", &Y:= 3, 640, 0, ScreenWidth, ScreenHeight,0,0, Text))
    {
      FindText().Click(X, Y, "L")
    }
    else {
      MsgBox("执行结束了！")
      break
    }
    ;查找礼物
    Text:="|<>*162$31.0s000Dw03zjy01zrz00Tzw001zw000zzU03zzs01zzy01zzz00zzzk0Tzzk0DyTs07zDw03zby01znz00ztzU0Twzk0DwDs07y7w03z3y01zVz00zUTU0Tk7k0Dk1s07kE"
    if (ok:=FindText(&X:= "wait", &Y:= 3, 1159-150000, 256-150000, 1159+150000, 256+150000, 0.1, 0.1, Text))
    {
      FindText().Click(X, Y, "L")
      ;礼物确认按钮
      Text:="|<>*160$40.A0000VUk3kC7C3yzUxzyTva1zzxiAA21kCskk0zsn333XzkAAATA3DzkkwzwTz30n1kAAA3A71skkAzw7n30n0kPgA3Dz36tkSzwQTy3w03UbsTzzw001lzzU"
      if (ok:=FindText(&X:= "wait", &Y:= 3, 1159-150000, 256-150000, 1159+150000, 256+150000, 0.1, 0.1, Text))
        {
          FindText().Click(X, Y, "L")
        }
    }
    Text := "|<一键收>**30$50.000E306M000CNs9a0003zz6NU001zWFazk000PaNjs007wdaHCTztzclhnDzyAzwPRnzzbWNCzw001zjngS000StYz7U003DzDls000n7Vwy000TtU7Rk003zz1yC0006TkT1c"
    if (ok2 := FindText(&X, &Y,  640, 0, ScreenWidth, ScreenHeight, 0.1, 0.1, Text))
    {
      FindText().Click(X, Y, "L")
    }
  }
}

; 当按下 F9 键时，停止循环
F9:: {
  isRunning := false
  ; 在停止循环时结束脚本的当前操作
  Reload
}