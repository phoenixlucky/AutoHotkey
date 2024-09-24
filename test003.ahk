#Requires AutoHotkey v2.0
#Include E:\tool\AdventureCN - v5.7.0\Tools\Findtext\FindText.ahk  ; 替换成 FindText 9.9 的路径

t1:=A_TickCount, Text:=X:=Y:=""

Text:="|<>*191$20.0zk0zz0Q0sC0773stVz6kzlw6wT0DDk7mw1sj0w3kD1w3URUw6QD3XVVkT1s3zw0Dw2"


F8::{
if (ok:=FindText(&X, &Y, 871-150000, 70-150000, 871+150000, 70+150000, 0, 0, Text))
{
  FindText().Click(X, Y, "L")
}

; ok:=FindText(&X:="wait", &Y:=3, 0,0,0,0,0,0,Text)  ; 等待3秒等图像出现
; ok:=FindText(&X:="wait0", &Y:=-1, 0,0,0,0,0,0,Text)  ; 无限等待等图像消失

MsgBox "找到:`t" (IsObject(ok)?ok.Length:ok)
  . "`n`n时间:`t" (A_TickCount-t1) " 毫秒"
  . "`n`n位置:`t" X ", " Y
  . "`n`n结果:`t<" (IsObject(ok)?ok[1].id:"") ">", "Tip", 4096

Try For i,v in ok  ; ok 值可以这样获取 ok:=FindText().ok
  if (i<=2)
    FindText().MouseTip(ok[i].x, ok[i].y)
}