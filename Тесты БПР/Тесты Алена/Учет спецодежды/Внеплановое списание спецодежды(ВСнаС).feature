#language: ru

Функционал: Создание и заполнение документа Внеплановое списание спецодежды, вид операции Возврат спецодежды на склад

Как релиз-инженер БПР
Я хочу проверять создание и заполнение документа Внеплановое списание спецодежды, вид операции Возврат спецодежды на склад
Чтобы избежать регресса


Контекст:
	Дано Я открыл сеанс TestClient от имени "Бухгалтер без права на зарплату и кадры" с паролем "" или подключаю уже существующий
    И Пауза 3

Сценарий: Создание и заполнение документа Внеплановое списание спецодежды, вид операции Реализация Возврат спецодежды на склад

	И В командном интерфейсе я выбираю 'Учет спецодежды' 'Внеплановое (экстренное) списание спецодежды'
	Тогда открылось окно 'Внеплановое (экстренное) списание спецодежды'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
    Тогда открылось окно 'Внеплановое (экстренное) списание спецодежды: Списание остаточной стоимости. Новый'
	И из выпадающего списка "Вид операции" я выбираю точное значение 'Возврат спецодежды на склад'
	И из выпадающего списка "Организация" я выбираю точное значение 'ТОО "Лакомка"'
	И в поле 'от' я ввожу текст '30.04.2020 23:59:59'

    #ИИ Если поле "ВидУчетаНУ" имеет значение "Ложь" тогда я изменяю флаг 'Учитывать КПН'
    #ИИ    Если  флаг "ВидУчетаНУ" равен "Ложь" Тогда  

	#И я изменяю флаг 'Учитывать КПН'
	#И я изменяю флаг 'Учитывать КПН'

	И я нажимаю кнопку выбора у поля "Склад"
	Тогда открылось окно 'Склады (места хранения)'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| 'БА0000004' | 'Спецодежда'   |
	И в таблице "Список" я активизирую поле с именем "Наименование"
	И в таблице "Список" я выбираю текущую строку
		И в таблице "ВозвратТЧ" я нажимаю на кнопку с именем 'ТоварыЗаполнитьПоОстаткамСклада2'
	И в таблице "ВозвратТЧ" я перехожу к строке:
		| 'N' | 'Документ выдачи'                                                | 'Количество' | 'Номенклатура'    | 'Номенклатура возврата' | 'Счет учета (БУ)' | 'Счет учета (НУ)' | 'Физлицо'             |
		| '5' | 'Выдача спецодежды работнику БА100000002 от 28.02.2018 22:27:34' | '1,000'      | 'Халат синий х/б' | 'Халат синий х/б'       | '1390'            | '1310Н'           | 'Юн Лариса Борисовна' |
	И в таблице "ВозвратТЧ" я активизирую поле с именем "ВозвратТЧФизлицо"
	И в таблице 'ВозвратТЧ' я удаляю строку
	И в таблице 'ВозвратТЧ' я удаляю строку
	И в таблице 'ВозвратТЧ' я удаляю строку
	И в таблице 'ВозвратТЧ' я удаляю строку
	И в таблице 'ВозвратТЧ' я удаляю строку
	И в таблице "ВозвратТЧ" я нажимаю на кнопку с именем 'СписаниеЗаполнитьПоОстаткамСотрудника2'
	Тогда открылось окно 'Сотрудники'
	И в таблице "Список" я перехожу к строке:
		| 'Вид занятости'         | 'Должность' | 'Наименование'        | 'Подразделение'                    | 'Принят'     |
		| 'Основное место работы' | 'Технолог'  | 'Юн Лариса Борисовна' | 'Хлебо-булочный цех ТОО "Лакомка"' | '08.01.2018' |
	И в таблице "Список" я выбираю текущую строку
	И Я закрываю окно 'Сотрудники'
		И в таблице "ВозвратТЧ" я перехожу к строке:
		| 'N' | 'Документ выдачи'                                                | 'Количество' | 'Номенклатура'    | 'Номенклатура возврата' | 'Счет учета (БУ)' | 'Счет учета (НУ)' | 'Физлицо'             |
		| '1' | 'Выдача спецодежды работнику БА100000002 от 28.02.2018 22:27:34' | '1,000'      | 'Халат синий х/б' | 'Халат синий х/б'       | '1390'            | '1310Н'           | 'Юн Лариса Борисовна' |
	И в таблице "ВозвратТЧ" я активизирую поле с именем "ВозвратТЧСкладПолучатель"
	И в таблице "ВозвратТЧ" я выбираю текущую строку
	И в таблице "ВозвратТЧ" я нажимаю кнопку выбора у реквизита "Склад получатель"
	Тогда открылось окно 'Склады (места хранения)'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| 'БА0000004' | 'Спецодежда'   |
	И в таблице "Список" я активизирую поле с именем "Наименование"
	И в таблице "Список" я выбираю текущую строку
	И в таблице "ВозвратТЧ" я активизирую поле "Новый счет учета (БУ)"
	И в таблице "ВозвратТЧ" я нажимаю кнопку выбора у реквизита "Новый счет учета (БУ)"
	Тогда открылось окно 'План счетов бухгалтерского учета'
	И в таблице "Список" я перехожу к строке:
		| 'Акт.' | 'Вал.' | 'Заб.' | 'Код счета' | 'Кол.' | 'Наименование'      | 'Счет (НУ)' |
		| 'А'    | 'Нет'  | 'Нет'  | '1310'      | 'Да'   | 'Сырье и материалы' | '1310Н'     |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "ВозвратТЧ" я завершаю редактирование строки
	И я нажимаю на кнопку 'Провести'

	И я изменяю флаг 'Использовать транзитный счет'
	И я нажимаю кнопку выбора у поля "Вернуть на другую карточку через транзитный счет"
	Тогда открылось окно 'План счетов бухгалтерского учета'
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку 'Провести'
	И я изменяю флаг 'Доначислить амортизацию'
	И я нажимаю на кнопку 'Провести'
	И я нажимаю на кнопку 'Отменить проведение'
	И Я закрываю окно 'Внеплановое (экстренное) списание спецодежды: Возврат спецодежды на склад. Не проведен'
