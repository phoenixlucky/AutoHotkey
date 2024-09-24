SetTimer(AutoUnlock, 5000) ; 每5秒检查一次锁屏状态
return

AutoUnlock() {
    if (A_TimeIdlePhysical > 5000) ; 如果物理闲置时间超过5秒
    {
        Send("{Enter}") ; 模拟按下 Enter 键
        Sleep(3000) ; 等待 3000 毫秒
        Send("{Enter}") ; 输入密码后再次按下 Enter
    }
}