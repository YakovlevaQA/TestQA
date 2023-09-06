#language: ru

@tree

Функционал: Создание элементов справочника Номенклатура 
и заполнение поля Организация с условием

Как Администратор хочу создать 10 элементов справочника Номенклатура 
и заполненить поле Организация

Контекст:
	И я подключаю TestClient "CI" логин "CI" пароль "CI"

Сценарий: Создание элементов справочника Номенклатура
	И я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
	И я запоминаю значение выражения '$Шаг$+1' в переменную "Шаг"
	И я запоминаю значение выражения '"Товар"+$Шаг$' в переменную "Номенклатура"
	И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                              | 'DeletionMark' | 'Code'   | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{“e1cib/data/Catalog.Items?ref=” +StrReplace(New UUID, “-“, “”)}' | 'False'        |          | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6878' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '58791'  | ''            | '$Номенклатура$' | ''                 | ''               | ''               |          |          |          | 0.21     |         |
	И я перезаполняю для объекта табличную часть "AddAttributes":
		| 'Ref'                                                           | 'Property'                                                                                           | 'Value'                                                                                 |
		| 'e1cib/data/Catalog.Items?ref=b762b13668d0905011eb76684b9f687d' | 'e1cib/data/ChartOfCharacteristicTypes.AddAttributeAndProperty?ref=b762b13668d0905011eb766bf96b275d' | 'e1cib/data/Catalog.AddAttributeAndPropertyValues?ref=b762b13668d0905011eb766bf96b2760' |


Сценарий: Заполнение поля Организация с условием
*Заполнение поля Организация с условием
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	И я жду открытия окна "Заказ покупателя (создание)" в течение 10 секунд
	Если элемент формы с именем "Company" отсутствует на форме Тогда
		И я нажимаю кнопку выбора у поля с именем "Company"
		И в таблице "List" я активизирую поле с именем "Description"
		И я нажимаю на кнопку с именем 'FormChoose'
	И из выпадающего списка с именем "Partner" я выбираю по строке 'клиент 1 (1 соглашение')
*Проверка		
	Тогда элемент формы с именем "Company" стал равен 'Собственная компания 1'
	Тогда элемент формы с именем "Partner" стал равен 'Клиент 1 (1 соглашение)'
	Тогда элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
					
