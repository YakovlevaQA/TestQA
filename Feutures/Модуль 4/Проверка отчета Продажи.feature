﻿#language: ru

@tree

Функционал: Проверка отчета продажи

Как Администратор я хочу проверить
отображение возвратов в отчете D2001 Продажи
   

Контекст: Подготовка базы и запуск тест-клиента
*Подготовка базы
	Тогда экспорт основных данных
	Тогда экспорт документов закупок
*Запуск тест-клиента
	И я подключаю TestClient "CI" логин "CI" пароль "CI"

Сценарий: Проверка отчета продажи
*Проверка
	Когда В панели разделов я выбираю 'Отчеты'
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	И я жду открытия окна "D2001 Продажи" в течение 10 секунд
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'FormGenerate'
	Дано Табличный документ "Result" равен макету "Otchet"
	
		
