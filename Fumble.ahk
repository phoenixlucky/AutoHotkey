#SingleInstance force
CoordMode("Mouse", "Screen")
#Include FindText.ahk

; 定义一个全局变量来控制循环
global isRunning := false
; 获取屏幕宽度和高度
ScreenWidth := A_ScreenWidth
ScreenHeight := A_ScreenHeight
; 获取指定窗口的位置和尺寸
X := 0, Y := 0, Width := 0, Height := 0

LeftClick2() {
    Click("left", 2)  ; 执行两次左键点击，相当于双击
}

BezierCurve(x1, y1, x2, y2, controlX, controlY, steps := 100)
{
    points := []
    Loop steps
    {
        t := A_Index / steps
        invT := 1 - t

        ; 贝塞尔曲线方程
        Bx := invT * invT * x1 + 2 * invT * t * controlX + t * t * x2
        By := invT * invT * y1 + 2 * invT * t * controlY + t * t * y2
        points.Push({x: Bx, y: By})
    }
    return points
}

; 模拟拖拽操作，沿着贝塞尔曲线轨迹移动鼠标
MouseDragWithCurve(StartX, StartY, EndX, EndY)
{
    ; 控制点决定曲线的形状，通常在起点和终点之间的某个位置
    ControlX := (StartX + EndX) / 2 + 100  ; 控制点的 X 坐标，调节控制点位置可以影响曲线
    ControlY := (StartY + EndY) / 2 - 100  ; 控制点的 Y 坐标

    ; 生成从起点到终点的贝塞尔曲线
    points := BezierCurve(StartX, StartY, EndX, EndY, ControlX, ControlY)

    ; 移动到起点并按下左键
    MouseMove(StartX, StartY)
    Sleep(200)
    MouseClick("left",,,,, "D")
    Sleep(200)

    ; 沿着曲线移动鼠标，模拟拖拽
    for _, point in points
    {
        MouseMove(point.x, point.y, 0)  ; 每次移动到曲线上一个点
        Sleep(10)  ; 调整移动速度
    }

    ; 松开左键
    Sleep(200)
    MouseClick("left",,,,, "U")
}

; 当按下 F8 键时，开始循环
F8:: {
    isRunning := true  ; 开始循环
    global X, Y
    WinGetPos(&X, &Y, &Width, &Height, "ZMDesktopElf")
    Text:="|<>##0.90$0/0/524F5D,-1/5/342939,27/6/40363A,40/0/30202E,21/-5/FFE5DE"
    if (ok := FindText(&X:= "wait", &Y:= 3, 0, 0, X, Y, Width, Height, Text))
    {
      MouseDragWithCurve(X, Y,1039, 502)
    }
    n := 0  ; 初始化 n

    ; 循环直到按下 F9 键停止
    while (isRunning) {
        ; 执行 5 次操作作为一个循环
        Loop 6 {
            MouseMove(1039, 412 + n, 50)  ; 移动鼠标到指定位置
            LeftClick2()  ; 执行双击
            n += 25  ; 每次增加 20 的偏移
            Sleep(12000)  ; 等待 12 秒
        }
        ; 重置 n 的值，开始新的一轮 5 次操作
        n := 0
    }
}

; 当按下 F9 键时，停止循环
F9:: {
    isRunning := false  ; 停止循环
	Reload
}
