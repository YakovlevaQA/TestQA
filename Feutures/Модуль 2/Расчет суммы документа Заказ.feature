﻿#language: ru

@tree

Функционал: Заполнение документа Заказ и проверка поля Количество

Как Администратор я хочу проверить
заполнение документа Заказ и расчет поля Количество   

Контекст: Подготовка базы и запуск тест клиента
*Подготовка базы
	Тогда Создание элемента для справочника Виды цен
	Тогда Создание элемента для справочника Контрагенты
	Тогда Создание элемента для справочника Регионы
	Тогда Создание элемента для справочника Организации
	Тогда Создание элемента для справочника Склады
	Тогда Создание элемента для справочника Товары
*Запуск тест-клиента
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Расчет суммы документа Заказ
*Заполнение и создание документа 
	И Я открываю навигационную ссылку "e1cib/list/Документ.Заказ"
	И я жду открытия окна "Заказы товаров" в течение 10 секунд
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И я жду открытия окна "Заказ (создание)" в течение 10 секунд
	И из выпадающего списка с именем "Организация" я выбираю по строке 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю по строке 'Шлюзовая ООО'
	И из выпадающего списка с именем "Склад" я выбираю по строке 'Большой'
	И из выпадающего списка с именем "ВидЦен" я выбираю по строке 'Оптовая'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Bosch15'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '3200'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '32'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
*Проверка расчета поля Сумма
	И таблица "Товары" содержит строки:
		| 'Сумма'      |
		| '102 400,00' |
	
		
