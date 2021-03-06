# language: ru
@Email
@tree

Функциональность: Нежелательные письма
	Как пользователь УНФ
	Я хочу помечать письма как нежелательные
	Чтобы очистить почту от спама

Сценарий: Выбор папки с нежелательной почтой
	Допустим в почтовом ящике есть папка "Нежелательная почта"
	Тогда устанавливаем для папки "Нежелательная почта" признак "Нежелательная почта"

Сценарий: Пометка письма как нежелательное
	Допустим в почтовом ящике есть письмо с темой "Это спам"
	Когда Я помечаю письмо как нежелательное
	Тогда Письмо перемещается в папку с признаком "Нежелательная почта"

