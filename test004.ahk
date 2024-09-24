#SingleInstance force

F8:: {
    loop 10 {
        SetKeyDelay(300, 50)  ; 设置每次按键之间的延时为100毫秒，每次按键按下50毫秒后才松开
        SendEvent("Hello{Enter}")         ; 发送 "Hello"，每个字母之间有100毫秒的延时，每个按键按下持续50毫秒}
    }
}


;
