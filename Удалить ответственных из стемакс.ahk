;ВАЖНО!!!! Запускать скрипт, щёлкнув по нему правой кнопкой мыши и выбрав пункт Run with UI Access

;При нажатии Ctrl+Del скрипт удалит 100 записей Персонала из открытой карточки Стемакс. Предварительно требуется открыть карточку объекта и перейти на вкладку "Персонал".

;ЭКСТРЕННОЕ ЗАВЕРШЕНИЕ РАБОТЫ СКРИПТА Ctrl+Esc. Либо подождать, пока отработает. 



#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;Не спрашивать о том, что может быть запущен только один инстанс.


^Del::
IfWinExist, Карточка объекта
		WinActivate
		WinWaitActive, Карточка объекта,, 1
			if ErrorLevel
			{
    			MsgBox 64, Окна нет, Карточка объекта не открыта, 1
			Reload
    			}
		
Sleep, 300
Send, {LWin Down}{Up}{LWin Up}

Loop, 100	; Количество повторений ограничено 100 на случай выхода скрипта из под контроля (было один раз, хе-хе). Если что-то пошло не так, ждём 100 итераций или нажимаем Ctrl+Esc. Максимальное количество ключей в приборе Мираж/Стемакс - 100.
	{
	Sleep, 300
	Click, right, 44, 90
	Sleep, 300
	Send, {Up}{Enter}
	Sleep, 300
	IfWinExist, Персонал объекта
		Break
		
		
	}
Send, {Esc}

^Esc::
exitapp