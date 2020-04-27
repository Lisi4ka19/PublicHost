#language: ru
@EmptyIB
@tree

Функциональность: Заполнение карточки Организации

Как релиз-инженер УНФ
Я хочу проверять заполнение карточки Организации
Чтобы избежать регресса

Контекст:
    Допустим Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Изменение названия Организации
    Допустим В командном интерфейсе я выбираю "Компания" "Реквизиты организации"
    И открылось окно "Наша фирма (Организация)"
    Тогда в поле "Юридическое название" я ввожу текст "ООО Купи-продай"
    И я активизирую поле с именем "Наименование"
    И значение поля с именем "Наименование" содержит текст "Купи-продай ООО"
    Когда я нажимаю на кнопку "Записать и закрыть"
    Тогда я жду закрытия окна "Наша фирма (Организация)" в течение 20 секунд

Сценарий: Заполнение Юридических данных
    Допустим В командном интерфейсе я выбираю "Компания" "Реквизиты организации"
    И открылось окно "Купи-продай ООО *"
    И я разворачиваю группу с именем "ЮридическиеДанные"
    И в поле "ИНН" я ввожу текст "7710047278"
    И я активизирую поле с именем "КПП"
    И значение поля с именем "КПП" содержит текст "771001001"
    И в поле "ОГРН" я ввожу текст "1026402000657"
    И в поле "ОКПО" я ввожу текст "24399828"
    И в поле "ОКТМО" я ввожу текст "63650440101"
    И в поле "ОКАТО" я ввожу текст "63250840"
    Когда я нажимаю на кнопку "Записать и закрыть"
    Тогда я жду закрытия окна "Купи-продай ООО *" в течение 20 секунд

Сценарий: Заполнение КИ
    Допустим В командном интерфейсе я выбираю "Компания" "Реквизиты организации"
    И открылось окно "Купи-продай ООО *"
    И я разворачиваю группу "Адреса, телефоны"
    И в поле "ПредставлениеКИ_0" я ввожу текст "4867878"
    И в поле "ПредставлениеКИ_1" я ввожу текст "123@123.test"
    И я нажимаю кнопку выбора у поля "ПредставлениеКИ_2"
    Тогда открылось окно "Юр. адрес"
    И я нажимаю кнопку выбора у поля "Город, населенный пункт"
    Тогда открылось окно "Населенный пункт"
    И я нажимаю кнопку выбора у поля "Регион"
    Тогда открылось окно "Выберите регион"
    И в таблице "ВариантыАдреса" я перехожу к строке:
        | Представление |
        | Амурская обл  |
    И я нажимаю на кнопку с именем "Выбрать"
    Тогда открылось окно "Населенный пункт *"
    И я нажимаю на кнопку "ОК"
    Тогда открылось окно "Юр. адрес *"
    И в поле "Улица" я ввожу текст "Улица первая"
    И в поле "Дом" я ввожу текст "16"
    И в поле "Строение" я ввожу текст "1"
    И в поле "Помещение" я ввожу текст "51"
    И я нажимаю на кнопку "ОК"
    Тогда открылось окно "Купи-продай ООО *"
    И из выпадающего списка "ПредставлениеКИ_3" я выбираю точное значение "Амурская обл, Улица первая, дом 16, корпус 1, квартира 51"
    И в поле "ПредставлениеКИ_4" я ввожу текст "Амурская обл, Улица вторая, дом 1, квартира 10"
    И в поле "ПредставлениеКИ_5" я ввожу текст "test11.1.comr"
    Когда я нажимаю на кнопку "Записать и закрыть"
    Тогда я жду закрытия окна "Купи-продай ООО *" в течение 20 секунд
