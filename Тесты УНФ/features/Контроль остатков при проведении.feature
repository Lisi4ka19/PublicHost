#language: ru
@tree

Функциональность: Контроль остатков при проведении

Как пользователь УНФ
Я хочу убедиться, что контроль остатков при проведении включен по-умолчанию

Контекст:
	Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Контролировать остатки при проведении в демобазе

	Допустим В командном интерфейсе я выбираю 'Компания' 'Администрирование'
	И открылось окно 'Больше возможностей: настройка программы'
	
	Когда в таблице "ДеревоРазделов" я перехожу к строке:
		| Представление   |
		| Общие настройки |
	И я перехожу к закладке "Общие настройки"
	Тогда флаг "Контролировать остатки при проведении" равен "Да"
