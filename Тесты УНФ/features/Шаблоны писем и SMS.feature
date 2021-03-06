# language: ru
@tree

Функциональность: Шаблоны писем и SMS
	Как пользователь УНФ
	Я хочу использовать шаблоны сообщений
	Чтобы стандартизировать взаимодействие с контрагентами

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Структура сценария: Я создаю шаблон электронного письма
	Допустим В командном интерфейсе я выбираю 'CRM' 'Шаблоны писем, SMS'
	Когда открылось окно 'Шаблоны сообщений'
	И я нажимаю на кнопку 'Электронного письма'
	Тогда открылось окно 'Шаблон сообщения электронного письма (создание)'

	Когда из выпадающего списка "ПолноеИмяТипаПараметраВводаНаОсновании" я выбираю точное значение <Назначение>
	И в поле 'Наименование' я ввожу текст <Назначение>
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Шаблон сообщения электронного письма (создание) *' в течение 20 секунд

Примеры:
  | Номер | Назначение                     |
  |   1.  | Общий                          |
  |   2.  | Акт выполненных работ          |
  |   3.  | Договор обслуживания           |
  |   4.  | Задание на работу              |
  |   5.  | Заказ на производство          |
  |   6.  | Заказ покупателя (заказ-наряд) |
  |   7.  | Заказ поставщику               |
  |   8.  | Контакты                       |
  |   9.  | Контрагенты                    |
  |  10.  | Прием и передача в ремонт      |
  |  11.  | Рабочие места                  |
  |  12.  | Расходная накладная            |
  |  13.  | Событие                        |
  |  14.  | Счет на оплату                 |

Структура сценария: Я создаю шаблон SMS
	Допустим В командном интерфейсе я выбираю 'CRM' 'Шаблоны писем, SMS'
	Когда открылось окно 'Шаблоны сообщений'
	И я нажимаю на кнопку 'Сообщения SMS'
	Тогда открылось окно 'Шаблон сообщения SMS (создание)'

	Когда из выпадающего списка "ПолноеИмяТипаПараметраВводаНаОсновании" я выбираю точное значение <Назначение>
	И в поле 'Наименование' я ввожу текст <Назначение>
	И я нажимаю на кнопку 'Записать и закрыть'
	И я жду закрытия окна 'Шаблон сообщения SMS (создание) *' в течение 20 секунд

Примеры:
  | Номер | Назначение                     |
  |   1.  | Общий                          |
  |   2.  | Акт выполненных работ          |
  |   3.  | Договор обслуживания           |
  |   4.  | Задание на работу              |
  |   5.  | Заказ на производство          |
  |   6.  | Заказ покупателя (заказ-наряд) |
  |   7.  | Заказ поставщику               |
  |   8.  | Контакты                       |
  |   9.  | Контрагенты                    |
  |  10.  | Прием и передача в ремонт      |
  |  11.  | Рабочие места                  |
  |  12.  | Расходная накладная            |
  |  13.  | Событие                        |
  |  14.  | Счет на оплату                 |
