module I18N.En exposing (translations)

import I18Next exposing (fromTree, object, string)


translations =
    fromTree
        [ ( "Список Фениксов", string "Yours Fenixes" )
        , ( "Да", string "Yes" )
        , ( "Нет", string "No" )
        , ( "Режим", string "Mode" )
        , ( "Поиск", string "Search" )
        , ( "Ожидание", string "Standby" )
        , ( "themes"
          , object
                [ ( "dark", string "Dark" )
                , ( "light", string "Light" )
                ]
          )
        , ( "menu"
          , object
                [ ( "Системные опции", string "System options" )
                , ( "Аккаунт", string "Account" )
                , ( "Язык", string "Language" )
                , ( "Настройки", string "Settings" )
                , ( "Выйти", string "Logout" )
                , ( "Выйти?", string "Logout?" )
                , ( "Вы действительно хотите выйти?", string "Do you really want to get out?" )
                , ( "Список Фениксов", string "List of Fenixes" )
                , ( "Карта", string "Map" )
                , ( "Управление", string "Control" )
                , ( "Настройки", string "Settings" )
                , ( "События", string "Events" )
                , ( "Иконка и название Феникса", string "Fenix icon and name" )
                , ( "Основные настройки", string "Basic settings" )
                , ( "Расширенные настройки", string "Advanced settings" )
                , ( "Обслуживание батареи", string "Battery service" )
                , ( "Детали о Фениксе", string "Details of the Fenix" )
                ]
          )
        , ( "login"
          , object
                [ ( "Добро пожаловать", string "Welcome" )
                , ( "Войдите, чтобы продолжить", string "Log in to continue" )
                , ( "Введите Ваш логин", string "Enter your username" )
                , ( "name_not_found", string "The username was not found. Please check and try again." )
                , ( "Введите Ваш пароль", string "Enter your password" )
                , ( "Войти в систему", string "Log in" )
                , ( "У вас нет аккаунта?", string "Don't have an account?" )
                , ( "Зарегистрироваться", string "Register" )
                , ( "Создать аккаунт", string "Create an account" )
                , ( "Чтобы начать работать", string "To get started" )
                , ( "Повторите Ваш пароль", string "Repeat your password" )
                , ( "Я прочитал и принимаю условия", string "I have read and accept the terms and conditions" )
                , ( "пользовательского соглашения", string "user agreement" )
                , ( "Уже есть аккаунт?", string "Already have an account?" )
                , ( "Введите имя пользователя", string "Enter user name" )
                , ( "Укажите пароль", string "Enter your password" )
                , ( "Укажите пароль повторно", string "Enter the password again" )
                , ( "Пароль указан неверно", string "The password is incorrect" )
                , ( "Вы должны принять условия", string "You have to accept the conditions" )
                ]
          )
        , ( "list"
          , object
                [ ( "Добавьте ещё один Феникс", string "Add another Fenix" )
                , ( "в список наблюдения", string "to the watch list" )
                , ( "Добавить", string "Add" )
                , ( "Режим Поиск:", string "Search mode:" )
                , ( "Режим Ожидание:", string "Standby mode:" )
                ]
          )
        , ( "master"
          , object
                [ ( "Далeе", string "Next" )
                , ( "Назад", string "Back" )
                , ( "Подготовка SIM-карты", string "Preparing the SIM card" )
                , ( "Установите SIM-карту в мобильный телефон.", string "Install the SIM card in your mobile phone." )
                , ( "Активируйте SIM-карту в соответствии с инструкциями GSM-оператора.", string "Activate the SIM card according to your GSM operator's instructions." )
                , ( "Убедитесь в том, что PIN-код при включении телефона выключен.", string "Ensure that the PIN code is switched off when the phone is switched on." )
                , ( "В случае необходимости зарегистрируйте SIM-карту на сайте GSM-оператора.", string "If necessary, register your SIM card on the GSM operator's website." )
                , ( "Выключите мобильный телефон и извлеките из него подготовленную SIM-карту.", string "Switch off your mobile phone and remove the prepared SIM card." )
                , ( "Установка подготовленной SIM-карты в Феникс", string "Installing a prepared SIM card in the Fenix" )
                , ( "Выкрутите 4 винта и снимите крышку корпуса.", string "Remove the 4 screws and enclosure cover." )
                , ( "Убедитесь в том, что Феникс выключен – светодиодный индикатор не горит и не мигает.", string "Make sure that the Phoenix is switched off - the LED is off and not flashing." )
                , ( "Установите подготовленную SIM-карту в Феникс.", string "Install the prepared SIM card in the Fenix." )
                , ( "В случае необходимости произведите привязку экзекуторов.", string "Bind the Executors if necessary." )
                , ( "Привязать экзекутор", string "Bind the Executor" )
                , ( "Экзекутор в наличии", string "Executor available" )
                , ( "Привязка экзекуторов и активация Феникса", string "Binding the Executors and activating the Fenix" )
                , ( "Исходное состояние: Феникс – выключен.", string "Initial status: Fenix - off." )
                , ( "Обесточьте все привязываемые экзекуторы и подготовьте их к подаче питания.", string "De-energise all tethered excecutors and prepare them for power supply." )
                , ( "Нажмите и удерживайте 3 секунды кнопку Фениска – загорится светодиод.", string "Press and hold the Fenix button for 3 seconds - the LED lights up." )
                , ( "Как только светодиод загорится – подайте питание на все привязываемые экзекуторы – светодиод отработает серию частых вспышек и начнёт отрабатывать редкие одиночные вспышки.", string "As soon as the LED lights up - apply power to all tethered exciters - the LED will flash a series of frequent flashes and begin to flash rare single flashes." )
                , ( "Закройте крышку корпуса Фениска и закрутите 4 винта.", string "Close the lid of the Fenisk housing and tighten the 4 screws." )
                , ( "Активация Феникса", string "Fenix activation" )
                , ( "Нажмите кнопку Феникса – светодиодный индикатор подтвердит включение.", string "Press the Fenix button - the LED will confirm activation." )
                , ( "Закройте крышку корпуса Феникса и закрутите 4 винта.", string "Close the lid of the Fenix housing and tighten the 4 screws." )
                , ( "Добавление Феникса в наблюдение", string "Adding Fenix to surveillance" )
                , ( "Отправьте на телефонный номер SIM-карты Феникса SMS: link", string "Send an SMS to the Fenix SIM card phone number: link" )
                , ( "В ответ придёт уникальный код – введите его в поле ниже:", string "You will receive a unique code - enter it in the box below:" )
                , ( "Введите уникальный код из SMS", string "Enter a unique code from the SMS" )
                , ( "Подтвердить", string "Confirm" )
                , ( "Мастер добавления Феникса", string "Fenix Addition Wizard" )
                , ( "Свериться с", string "Check with" )
                , ( "индикатором", string "indicator" )
                ]
          )
        , ( "config"
          , object
                [ ( "Основные настройки феникса", string "Basic Fenix settings" )
                , ( "Период выхода на связь", string "Period of communication" )
                , ( "Редко", string "Rarely" )
                , ( "Феникс будет выходить на связь один раз в сутки.", string "Fenix will be in contact once a day." )
                , ( "Ожидаемый срок службы батареи - 15 лет.", string "Expected battery life - 15 years." )
                , ( "Оптимально", string "Optimal" )
                , ( "Феникс будет выходить на связь каждые 6 часов.", string "Fenix will be in contact every six hours." )
                , ( "Ожидаемый срок службы батареи - 6 лет.", string "Expected battery life - 6 years." )
                , ( "Часто", string "Часто" )
                , ( "Феникс будет выходить на связь каждые 2 часа.", string "Fenix will be in touch every 2 hours." )
                , ( "Ожидаемый срок службы батареи - 2 года.", string "Expected battery life - 2 years." )
                , ( "Время работы в режиме Поиск", string "Working time in Search mode" )
                , ( "Продолжительно", string "Continuously" )
                , ( "Максимальное время работы в режиме Поиск - 12 часов.", string "Maximum operating time in Search mode - 12 hours." )
                , ( "Ёмкости батареи хватит на 15 активаций режима Поиск.", string "Battery capacity is sufficient for 15 Search mode activations." )
                , ( "Оптимально", string "Optimal" )
                , ( "Максимальное время работы в режиме Поиск - 6 часов.", string "Maximum operating time in Search mode - 6 hours." )
                , ( "Ёмкости батареи хватит на 30 активаций режима Поиск.", string "Battery capacity is sufficient for 30 Search mode activations." )
                , ( "Минимально", string "Minimum" )
                , ( "Максимальное время работы в режиме Поиск - 1 час.", string "Maximum operating time in Search mode - 1 hour." )
                , ( "Ёмкости батареи хватит на 100 активаций режима Поиск.", string "Battery capacity enough for 100 Search mode activations." )
                , ( "Информирование", string "Inform" )
                , ( "Когда происходят определенные события, Феникс может отправлять SMS на заданный номер", string "When certain events occur, Fenix can send an SMS to a given number" )
                , ( "Укажите номер телефона", string "Please give your phone number" )
                , ( "Выберите события", string "Select events" )
                , ( "Критический остаток средств", string "Critical balance of funds" )
                , ( "Низкий уровень заряда батареи", string "Low battery level" )
                , ( "Изменение режима (Поиск <-> Ожидание)", string "Changing mode ( Search) <-> Standby)" )
                , ( "Начало движения (в режиме Поиск)", string "Start driving (in Search mode)" )
                , ( "Включение и выключение Феникса", string "Switching Fenix on and off" )
                , ( "Вскрытие корпуса", string "Opening the enclosure" )
                , ( "Контроль баланса SIM-карты", string "Checking the SIM card balance" )
                , ( "USSD-запрос баланса SIM-карты", string "USSD request for SIM card balance" )
                , ( "Безопасность", string "Security" )
                , ( "Чтобы никто посторонний не смог получить управление Вашим Фениксом, вы можете привязать управление к конкретному телефону и установить свой код доступа.", string "To prevent anyone else from gaining control of your Fenix, you can link the control to a specific phone and set your own access code." )
                , ( "По умолчанию управление возможно с любого телефона.", string "By default, control is possible from any phone." )
                , ( "Управление возможно только с телефона:", string "Control is only possible from the phone:" )
                , ( "SMS-коды управления имеют вид:", string "The SMS control codes are as follows:" )
                , ( "Привязать к телефону", string "Tie it to the phone" )
                , ( "Установить пароль доступа", string "Set an access password" )
                , ( "Вводите только латинские буквы и цифры", string "Enter only Latin letters and numbers" )
                , ( "Далее", string "Next" )
                , ( "Назад", string "Back" )
                , ( "Применить", string "Apply" )
                , ( "Поздравляем!", string "Congratulations!" )
                , ( "Основные настройки применены", string "Basic settings applied" )
                , ( "Перейти к Фениксу", string "Go to the Fenix" )
                , ( "Удалить Феникс", string "Delete the Fenix" )
                , ( "Экзекутор в наличии", string "The Executor is available" )
                , ( "Не указан", string "Not indicated" )
                , ( "Номер телефона", string "Phone number" )
                , ( "IMEI", string "IMEI" )
                , ( "Версия ПО", string "Software version" )
                , ( "Модель", string "Model" )
                , ( "Детали о Фениксе", string "Details of the Fenix" )
                , ( "Удалить Феникс?", string "Delete Fenix?" )
                , ( "remove_fx", string "Are you sure you want to delete Fenix “{{title}}”? This action cannot be undone." )
                , ( "Да, удалить", string "Yes, delete" )
                , ( "Нет", string "Not" )
                , ( "Иконка и название", string "Icon and name" )
                , ( "Название Феникса", string "The title of the Fenix" )
                , ( "Иконка Феникса", string " Fenix icon" )
                , ( "Ведите новое либо измените старое название", string "Lead a new name or change the old one" )
                , ( "Введите название", string "Enter a name" )
                , ( "Отмена", string "Cancel" )
                , ( "Сохранить", string "Save" )
                , ( "Иконка Феникса", string "Fenix icon”" )
                , ( "Выберите подходящую иконку для вашего феникса", string "Choose a suitable icon for your fenix" )
                , ( "Обслуживание батареи", string "Battery service" )
                , ( "Предполагаемое время", string "Expected time" )
                , ( "работы батареи", string "battery life" )
                , ( "Статистика работы", string "Work statistics" )
                , ( "Начальная емкость батареи", string "Initial battery capacity" )
                , ( "Начало эксплуатации", string "Start of usage" )
                , ( "Общее время эксплуатации", string "Total operating time" )
                , ( "Израсходовано энергии батареи", string "Battery power consumed" )
                , ( "Замена батареи", string "Battery replacement" )
                , ( "Изменить начальную емкость", string "Change the initial capacity" )
                , ( "bat_replace_text", string "The battery must be replaced by an expert. Use the original SAFT LSH 14, 5800mAh battery. If you install a different type of battery, specify the initial capacity (mAh)." )
                , ( "Укажите начальную емкость батареи (мАч)", string "Specify the initial battery capacity (mAh)" )
                , ( "bat_ch_capacity", string "If you have a different battery type installed, specify the initial capacity (mAh)." )
                , ( "Предупреждение!", string "Warning!" )
                , ( "warning_custom", string "If you change the settings carelessly, the Fenix may become completely inoperable. Only change settings if you are absolutely sure about what you are doing." )
                , ( "error_custom", string "Download error or data not yet received from Fenix." )
                , ( "Отменить", string "Cancel" )
                , ( "Показать", string "Show" )
                , ( "изменения", string "changes" )
                ]
          )
        , ( "control"
          , object
                [ ( "Текущий режим", string "Current mode" )
                , ( "Включить режим Поиск", string "Activate Search mode" )
                , ( "Связь", string "Connection" )
                , ( "Последний сеанс связи:", string "Last session of connection:" )
                , ( "Следующий сеанс связи:", string "Next session of connection:" )
                , ( "Положение", string "Position" )
                , ( "Положение определено:", string "The position is defined as follows:" )
                , ( "Показать", string "Show" )
                , ( "Обновить", string "Update" )
                , ( "Предполагаемое время работы батареи", string "Estimated battery life" )
                , ( "Режим", string "Mode" )
                , ( "SIM-карта", string "SIM card" )
                , ( "Баланс:", string "Balance:" )
                , ( "Пополнить счет", string "Top up your account" )
                , ( "Заблокировать двигатель", string "Block the engine" )
                , ( "Данные о состоянии еще не получены", string "Status data not yet available" )
                , ( "идет определение...", string "determination..." )
                , ( "Феникс выключен.", string "Fenix is off." )
                , ( "Идет определение местоположения...", string "ocation determination in progress..." )
                , ( "Поиск", string "Search" )
                ]
          )
        , ( "params"
          , object
                [ ( "accel.count", string "Accelerometer pulse duration, ms" )
                , ( "accel.deb", string "Software debouncing, number of repetitions (2-6)" )
                , ( "accel.lvl", string "Sensitivity of accelerometer, mg" )
                , ( "accel.time", string "Accelerometer settling time, seconds (10-300)" )
                , ( "adc.fix.du", string "Backup voltage change threshold, V (?-?)" )
                , ( "adc.fix.dub", string "Main supply voltage change threshold, V (?-?)" )
                , ( "adc.fix.umax", string "Maximum permissible supply threshold, /29.528, V (350-1200)" )
                , ( "adc.in.1", string "Logic input voltage threshold 1, /?, V (?-?)" )
                , ( "adc.in.2", string "Logic input voltage threshold 2, /?, V (?-?)" )
                , ( "adc.photo", string "Photo sensor sensitivity, (100-2000; 2000-max)" )
                , ( "adc.photo.delay", string "Photo guard activation time, сек (1-32000)" )
                , ( "photo.delay", string "Photo guard activation time, сек (1-32000)" )
                , ( "adc.u.off", string "Main power-off threshold, /29.528, V (100-1000)" )
                , ( "adc.u.on", string "Main power on threshold, /29.528, V (100-1000)" )
                , ( "akkum.block.vbat", string "-- add description ---" )
                , ( "akkum.block.vdd", string "-- add description ---" )
                , ( "akkum.charge.0", string "Full battery discharge indication, /310.29, V (1050-1150)" )
                , ( "akkum.charge.30", string "Battery charge indication 30%, /310.29, V (1100-1200)" )
                , ( "akkum.charge.60", string "Battery charge indication 60%, /310.29, V (1150-1250)" )
                , ( "akkum.charge.temp", string "Maximum battery temperature, /?, градусов (?-?)" )
                , ( "akkum.i.0", string "?Initial battery charging current, х 20.408 mA (1-10)" )
                , ( "akkum.i.1", string "?Maximum battery charging current, х 20.408 mA (10-100)" )
                , ( "akkum.i.charge", string "-- add description ---" )
                , ( "akkum.u.0", string "?Minimum voltage for firmware update, /310.29, V (1100-1300)" )
                , ( "sleep", string "Sleep time in Standby and Search modes, min" )
                , ( "adc.vi.fix", string "Correcting the power backup reading." )
                , ( "admin", string "The receptionist's phone number." )
                , ( "alarm.balance", string "SMS about the critical balance" )
                , ( "alarm.case", string "SMS about opening the enclosure" )
                , ( "alarm.delay", string "SMS to activate standby mode" )
                , ( "alarm.low", string "SMS about low battery capacity" )
                , ( "alarm.error", string "SMS about not being able to locate" )
                , ( "alarm.gps", string "SMS about coordinate changes" )
                , ( "alarm.mode", string "SMS about mode change" )
                , ( "alarm.on", string "SMS about turning on the Fenix" )
                , ( "alarm.off", string "SMS about shutting down the Fenix" )
                , ( "alarm.stealth", string "SMS about Stealth mode activation" )
                , ( "admin", string "The receptionist's telephone number" )
                , ( "alarm1", string "First phone number to send an SMS" )
                , ( "alarm2", string "Second phone number to send an SMS" )
                , ( "alarm3", string "Third phone number to send an SMS" )
                , ( "alarm4", string "Fourth phone number to send an SMS" )
                , ( "auto.sleep", string "Automatically activate Standby mode, min" )
                , ( "balance.skip", string "Missing figures in the operator's balance report" )
                , ( "balance.ussd", string "USSD card balance enquiry" )
                , ( "config.send", string "Period of communication sessions in Configurator mode, min" )
                , ( "delay", string "GSM module shutdown delay, in communication cycles" )
                , ( "distance", string "Maximum permissible coordinate deviation, m" )
                , ( "gps.angle", string "Minimum detectable steering angle, degrees" )
                , ( "gps.aoff", string "Auto GPS off to save battery, min" )
                , ( "gps.delta", string "Forced registration of coordinates when moving, m" )
                , ( "gps.fail", string "Delayed GPS reset if satellites are lost, min" )
                , ( "gps.flush.move", string "Period of sending data to the server when moving, sec" )
                , ( "gps.flush.stop", string "Period of sending data to the server when parked, sec" )
                , ( "gps.flush", string "Period of sending data to the server, sec" )
                , ( "gps.tf.move", string "Forced registration of coordinates when moving, sec" )
                , ( "gps.tf.stop", string "Period of coordinate recording at standstill, sec" )
                , ( "gps.tf", string "Period of coordinate recording, sec" )
                , ( "gps.tf.stop.acc", string "Period of coordinate recording while parked, sec" )
                , ( "gps.valid.delay", string "Data from GPS is not taken first after fix, and the specified number is skipped" )
                , ( "gps.vignacc", string "Speed of forced motion detection (accelerometer is ignored) × 0,01852 km/h" )
                , ( "gps.vstart", string "Starting recording speed × 0,01852 km/h" )
                , ( "gps.vstop", string "Speed of registering an object stop × 0,01852 km/h" )
                , ( "gps.data.1", string "Assignment of an additional GPS data field" )
                , ( "gps.wait", string "Satellite detection waiting time, min" )
                , ( "gsm.apn", string "Programmable Internet Access Point - APN" )
                , ( "gsm.balance.period", string "Balance control period, hours" )
                , ( "gsm.flags", string "Working in roaming, including national roaming" )
                , ( "gsm.lagtime", string "GSM module check period for hang-up, min" )
                , ( "gsm.predelay", string "GSM repeater test time and SMS waiting time, min" )
                , ( "gsm.user", string "User name for GPRS access" )
                , ( "gsm.pwd", string "Password for GPRS access" )
                , ( "limit", string "Minimum allowable SIM card balance" )
                , ( "link.delay", string "Button hold time for tethering, sec" )
                , ( "mode", string "Mode of operation" )
                , ( "photo", string "Photo sensor" )
                , ( "secur.code", string "Security code for SMS commands" )
                , ( "sms.confirm", string "Mode change command notification." )
                , ( "timezone", string "Difference between the current time zone and the world time zone, h" )
                , ( "vin.low", string "Voltage for low battery message, V" )
                , ( "vin.off", string "Fenix automatic shutdown voltage, V" )
                ]
          )
        ]
