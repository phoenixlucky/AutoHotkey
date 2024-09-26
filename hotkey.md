#### 符号说明
##### \#	Win (Windows 徽标键).

包含 Win 键的热键(例如 #a) 会等待 Win 键被释放后才发送任何包含 L 键击的文本. 这样避免了这种热键中的 Send 锁定 PC. 这种行为适用于除 SendPlay(这里不需要), 盲从模式和文本模式以外的所有发送模式.

注意: 按下包含 Win 键的热键可能会导致额外的模拟击键(默认为 Ctrl 键). 请参阅 A_MenuMaskKey.

##### !	Alt

注意: 按下包含 Alt 键的热键可能会导致额外的模拟击键(默认为 Ctrl 键). 请参阅 A_MenuMaskKey.

##### ^	Ctrl
##### +	Shift
##### &	
和符号可以用来组合任意两个按键或鼠标按钮, 让它们成为自定义热键. 有关详情, 请参阅下文.
##### <	
成对按键左边的那个按键. 例如 <!a 相当于 !a, 但只有使用左边的 Alt 键才可以触发.
##### >	
成对按键右边的那个按键.
#####  <^>!	AltGr(译者注: 美式标准键盘上没有该键). 
如果您键盘布局中含 AltGr 键而非右 Alt 键, 那么这一系列符号一般可用于表示 AltGr. 例如:

`<^>!m::MsgBox "你按下的是 AltGr+m."`
`<^<!m::MsgBox "你按下的是 LeftControl+LeftAlt+m."`
或者, 让 AltGr(alternate graph 或 alternate graphic) 本身成为热键, 请使用下面的热键(不像上面出现的任何热键):

`LControl & RAlt::MsgBox "你按下的是 AltGr 本身."`
##### *	通配符: 
即使额外的修饰键被按住也能触发热键. 这常与重映射按键或按钮组合使用. 例如:

`*#c::Run "calc.exe"  ; Win+C, Shift+Win+C, Ctrl+Win+C, 等都会触发此热键.
*ScrollLock::Run "notepad"  ; 即使在按住其他修饰键时按下 ScrollLock 也会触发此热键.
通配符热键总是使用键盘钩子, 就像任何被通配符热键覆盖的热键一样. 例如, *a:: 的存在会导致 ^a:: 总是使用钩子.`

##### ~	
触发热键时, 热键中按键原有的功能不会被屏蔽(对操作系统隐藏). 在下面的两个例子中, 用户的鼠标按钮点击会被发送到活动窗口:

`~RButton::MsgBox "You clicked the right mouse button."
~RButton & C::MsgBox "You pressed C while holding down the right mouse button."`
与其他前缀符号不同, 可以在热键的某些变体中使用颚化符(波浪号) 前缀而其他的不使用. 然而, 如果应用于颚化符(波浪号) 前缀的任何自定义组合键没有被关闭或暂停, 它会影响那个前缀键在 所有 组合中的行为.

用于替代 `alt-tab` 的特殊按键总是忽略颚化符(波浪号) 前缀.

如果把颚化符(前缀键) 用在自定义修饰键中且此修饰键自身也作为热键, 则在按下此修饰键时会触发热键而不会被延迟到按键释放的时候. 例如, 上文中 ~RButton 热键在按下此按键时就会触发.

如果颚化符前缀只应用于自定义组合键, 而不应用于非组合热键, 按键的原生功能将持续被屏蔽. 例如, 下面的脚本, 按住 Menu 键将会一直显示一个工具提示而不会触发上下文菜单:

`AppsKey::ToolTip "Press < or > to cycle through windows."
AppsKey Up::ToolTip
~AppsKey & <::Send "!+{Esc}"
~AppsKey & >::Send "!{Esc}"`
如果键盘热键的一个变体具有颚化修饰符, 那么热键总是使用键盘钩子.

##### $	
通常只在脚本使用 Send 函数发送包含了热键自身的按键时才需要使用此符号, 此时可以避免触发它自己. `$` 前缀强制使用键盘钩子来实现此热键, 作为副作用这样阻止了 Send 函数触发它自己. $ 前缀相当于在此热键定义之前的某个位置指定了 `#UseHook`.

$ 前缀对于鼠标热键不起作用, 因为它们始终使用鼠标钩子. 它对于已经启用了键盘钩子的热键同样无效, 包括任何带有颚化符(~) 或通配符(*) 修饰的热键, `key-up` 热键以及自定义组合. 要确定特定热键是否使用键盘钩子, 请使用 `ListHotkeys` 查看.

`#InputLevel` 和 `SendLevel` 对 `Send` 函数是否触发热键和热字串提供了额外的控制功能.

##### UP	
单词 UP 可以跟在热键名后面使得在释放按键时触发热键, 而不是按下时. 下面的例子把左 Win 重映射为左 Ctrl:

`*LWin::Send "{LControl down}"
*LWin Up::Send "{LControl up}"
"Up" 也可以用于普通热键中, 例如: ^!r Up::MsgBox "You pressed and released Ctrl+Alt+R". 它还可以用在组合键(例如 F1 & e Up::)`

`限制: 1) "Up" 不能和控制器按钮一起使用; 2) 在没有普通/按下热键副本的 "Up" 热键会完全接管那个按键以防被卡住. 避免这种情况的一种方法是添加颚化符(波浪号) 前缀(例如 ~LControl up::)`

`"Up" 热键和其 key-down 副本(如果有的话) 总是使用键盘钩子.`

相关提示, 类似于上面的一种技术是让热键成为前缀键. 好处是尽管热键会在按键松开时激发, 但仅在您之前按住此前缀键时没有按其他任何键的情况下才会如此. 例如:

`LControl & F1::return  ; 至少在 "&" 前面使用左 control 键一次, 来让它成为前缀键.
LControl::MsgBox "You released LControl without having used it to modify any other key."`