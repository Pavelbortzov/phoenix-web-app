module Page.System.Config.ParamDesc exposing (..)

import Dict exposing (Dict)


type ParamDesc
    = PD_String
    | PD_Int Int Int
    | PD_Enum (List ( String, PDI_Enum ))


type alias PDI =
    { title : String
    , ptype : ParamDesc
    }


type PDI_Enum
    = PDIE_Desc String
    | PDIE_Link String -- TODO: Ссылка на другой параметр (например запрограммированные телефоны alarm1..4)


paramDesc : Dict String PDI
paramDesc =
    Dict.fromList
        [ ( "accel.count", PDI "Длительность импульса акселерометра, ms" PD_String )
        , ( "accel.deb", PDI "Программный антидребезг, число повторов (2-6)" (PD_Int 1 10) )
        , ( "accel.lvl", PDI "Чувствительность акселерометра, mg" (PD_Int 10 1000) )
        , ( "accel.time", PDI "Время успокоения акселерметра, секунды (10-300)" (PD_Int 1 600) )
        , ( "adc.fix.du", PDI "Порог изменения напряжения резервного питания, V (?-?)" PD_String )
        , ( "adc.fix.dub", PDI "Порог изменения напряжения основного питания, V (?-?)" PD_String )
        , ( "adc.fix.umax", PDI "Порог максимально допустимого питания, /29.528, V (350-1200)" (PD_Int 300 1240) )
        , ( "adc.in.1", PDI "Логический порог напряжения входа 1, /?, V (?-?)" PD_String )
        , ( "adc.in.2", PDI "Логический порог напряжения входа 2, /?, V (?-?)" PD_String )
        , ( "adc.photo", PDI "Чувствительность фотодатчика, (100-2000; 2000-max)" (PD_Int 10 2047) )
        , ( "adc.photo.delay", PDI "Время включения фотоохраны, сек (1-32000)" (PD_Int 1 32767) )
        , ( "photo.delay", PDI "Время включения фотоохраны, сек (1-32000)" (PD_Int 1 32767) )
        , ( "adc.u.off", PDI "Порог выключения основного питания, /29.528, V (100-1000)" (PD_Int 10 1240) )
        , ( "adc.u.on", PDI "Порог включения основного питания, /29.528, V (100-1000)" (PD_Int 10 1240) )
        , ( "akkum.block.vbat", PDI "-- добавить описание ---" PD_String )
        , ( "akkum.block.vdd", PDI "-- добавить описание ---" PD_String )
        , ( "akkum.charge.0", PDI "Индикация полного разряда батареи, /310.29, V (1050-1150)" (PD_Int 1050 1150) )
        , ( "akkum.charge.30", PDI "Индикация заряда батареи 30%, /310.29, V (1100-1200)" (PD_Int 1000 1300) )
        , ( "akkum.charge.60", PDI "Индикация заряда батареи 60%, /310.29, V (1150-1250)" (PD_Int 1000 1300) )
        , ( "akkum.charge.temp", PDI "Максимальная температура батареи, /?, градусов (?-?)" PD_String )
        , ( "akkum.i.0", PDI "?Начальный ток заряда батареи, х 20.408 mA (1-10)" (PD_Int 1 100) )
        , ( "akkum.i.1", PDI "?Максимальный ток заряда батареи, х 20.408 mA (10-100)" (PD_Int 10 100) )
        , ( "akkum.i.charge", PDI "-- добавить описание ---" PD_String )
        , ( "akkum.u.0", PDI "?Минимальное напряжение для обновления прошивки, /310.29, V (1100-1300)" (PD_Int 1000 1300) )
        , ( "sleep", PDI "Время сна в режимах Beacon и Tracker, мин" PD_String )
        , ( "adc.vi.fix", PDI "Коррекция показаний резервного питания." PD_String )
        , ( "admin", PDI "Телефон администратора." PD_String )
        , ( "alarm.balance"
          , PDI "SMS о критическом балансе"
                (PD_Enum
                    [ ( "0", PDIE_Desc "Выключено" )
                    , ( "1", PDIE_Link "alarm1" )
                    , ( "2", PDIE_Link "alarm2" )
                    , ( "3", PDIE_Link "alarm3" )
                    , ( "4", PDIE_Link "alarm4" )
                    ]
                )
          )
        , ( "alarm.case"
          , PDI "SMS о вскрытии корпуса"
                (PD_Enum
                    [ ( "0", PDIE_Desc "Выключено" )
                    , ( "1", PDIE_Link "alarm1" )
                    , ( "2", PDIE_Link "alarm2" )
                    , ( "3", PDIE_Link "alarm3" )
                    , ( "4", PDIE_Link "alarm4" )
                    ]
                )
          )
        , ( "alarm.delay"
          , PDI "SMS о включении дежурного режима"
                (PD_Enum
                    [ ( "0", PDIE_Desc "Выключено" )
                    , ( "1", PDIE_Link "alarm1" )
                    , ( "2", PDIE_Link "alarm2" )
                    , ( "3", PDIE_Link "alarm3" )
                    , ( "4", PDIE_Link "alarm4" )
                    ]
                )
          )
        , ( "alarm.error"
          , PDI "SMS о невозможности определения координат"
                (PD_Enum
                    [ ( "0", PDIE_Desc "Выключено" )
                    , ( "1", PDIE_Link "alarm1" )
                    , ( "2", PDIE_Link "alarm2" )
                    , ( "3", PDIE_Link "alarm3" )
                    , ( "4", PDIE_Link "alarm4" )
                    ]
                )
          )
        , ( "alarm.gps"
          , PDI "SMS об изменении координат"
                (PD_Enum
                    [ ( "0", PDIE_Desc "Выключено" )
                    , ( "1", PDIE_Link "alarm1" )
                    , ( "2", PDIE_Link "alarm2" )
                    , ( "3", PDIE_Link "alarm3" )
                    , ( "4", PDIE_Link "alarm4" )
                    ]
                )
          )
        ]



-- , ( "alarm.ign"
--     , PDI "SMS о включении зажигания",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "alarm.low"
--     , PDI "SMS о низком уровне заряда батареи",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "alarm.mode"
--     , PDI "SMS о смене режима",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "alarm.on"
--     , PDI "SMS о включении трекера",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "alarm.off"
--     , PDI "SMS о выключении трекера",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "alarm.power"
--     , PDI "SMS о подаче или отключении внешнего питания",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "alarm.shleyf"
--     , PDI "SMS о повреждении или восстановлении шлейфа",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "alarm.sos"
--     , PDI "SMS о нажатии тревожной кнопки",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "alarm.overflow"
--     , PDI "SMS о превышении допустимого напряжения питания",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "alarm.stealth"
--     , PDI "SMS об активации режима Stealth",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Alarm1"},
--         {value: "2", , PDI "Alarm2"},
--         {value: "3", , PDI "Alarm3"},
--         {value: "4", , PDI "Alarm4"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "gps.A1.0"
--     , PDI "Минимальный регистрируемый угол поворота, градусы (1-10)",
--     primary: false,
--     "min": 1,
--     "max": 30
-- },
-- , ( "gps.A1.1"
--     "comment": " - INT 10 10"
-- },
-- , ( "gps.A1.2"
--     "comment": " - INT 5 5"
-- },
-- , ( "gps.A1.3"
--     "comment": " - INT 15 15"
-- },
-- , ( "gps.AOFF.0"
--     , PDI "Автовыключение GPS для экономии основного питания, мин (60-20160)",
--     primary: true,
--     "min": 1,
--     "max": 32767,
--     "comment": "INT 1440 1440"
-- },
-- , ( "gps.AOFF.1"
--     , PDI "Автовыключение GPS для экономии резервного питания, мин (1-2880)",
--     primary: true,
--     "min": 1,
--     "max": 32768,
--     "comment": "INT 30 30"
-- },
-- , ( "gps.B1.0"
--     "comment": " - INT 512 512"
-- },
-- , ( "gps.B1.1"
--     "comment": " - INT 512 512"
-- },
-- , ( "gps.B1.2"
--     "comment": " - INT 512 512"
-- },
-- , ( "gps.B1.3"
--     "comment": " - INT 512 512"
-- },
-- , ( "gps.FAIL"
--     "comment": " - INT 5 5"
-- },
-- , ( "gps.S1.0"
--     , PDI "?Принудительная регистрация координат при движении, метров (100-10000)",
--     "min": 1,
--     "max": 32767,
--     "comment": " - INT 1000 1000"
-- },
-- , ( "gps.S1.1"
--     "comment": " - INT 1000 1000"
-- },
-- , ( "gps.S1.2"
--     "comment": " - INT 500 500"
-- },
-- , ( "gps.S1.3"
--     "comment": " - INT 1000 1000"
-- },
-- , ( "gps.TF.MOVE"
--     , PDI "Принудительная регистрация координат при движении, сек (30-300)",
--     "min": 1,
--     "max": 600,
--     "comment": " INT 60 60"
-- },
-- , ( "gps.TF.STOP.0"
--     , PDI "Период регистрации координат при остановке / основное питание, сек (10-600)",
--     "min": 10,
--     "max": 600,
--     "comment": " INT 60 60"
-- },
-- , ( "gps.TF.STOP.1"
--     , PDI "Период регистрации координат при остановке / резервное питание, сек (10-600)",
--     "min": 10,
--     "max": 600,
--     "comment": " INT 60 60"
-- },
-- , ( "gps.TF.STOP.ACC.0"
--     , PDI "Период регистрации координат при стоянке / основное питание, сек (60-3600)",
--     primary: true,
--     "min": 10,
--     "max": 32768,
--     "comment": " INT 600 600"
-- },
-- , ( "gps.TF.STOP.ACC.1"
--     , PDI "Период регистрации координат при стоянке / резервное питание, сек (60-3600)",
--     primary: true,
--     "min": 10,
--     "max": 32768,
--     "comment": " INT 600 600"
-- },
-- , ( "gps.TM0.0"
--     "comment": " - INT 10 10"
-- },
-- , ( "gps.TM0.1"
--     "comment": " - INT 10 10"
-- },
-- , ( "gps.TM0.2"
--     "comment": " - INT 10 10"
-- },
-- , ( "gps.TM0.3"
--     "comment": " - INT 10 10"
-- },
-- , ( "gps.TP0.0"
--     "comment": " - INT 720 720"
-- },
-- , ( "gps.TP0.1"
--     "comment": " - INT 240 240"
-- },
-- , ( "gps.TP0.2"
--     "comment": " - INT 720 720"
-- },
-- , ( "gps.TP0.3"
--     "comment": " - INT 120 120"
-- },
-- , ( "gps.V0.0"
--     "comment": " - INT 3 3"
-- },
-- , ( "gps.V0.1"
--     "comment": " - INT 20 20"
-- },
-- , ( "gps.V0.2"
--     "comment": " - INT 10 10"
-- },
-- , ( "gps.V0.3"
--     "comment": " - INT 20 20"
-- },
-- , ( "gps.VIGNACC"
--     "comment": " - INT 4000 4000"
-- },
-- , ( "gps.VSTART"
--     , PDI "Скорость, выше которой регистрируется начало движения × 0.01852 км/ч",
--     primary: false,
--     multiplier: 0.01852,
--     "min": 50,
--     "max": 2700,
--     "comment": " INT 400 400"
-- },
-- , ( "gps.VSTOP"
--     , PDI "Скорость, ниже которой регистрируется остановка объекта × 0.01852 км/ч",
--     primary: false,
--     multiplier: 0.01852,
--     "min": 5,
--     "max": 270,
--     "comment": " INT 54 54"
-- },
-- , ( "gps.flush.move"
--     , PDI "Период отправки данных на сервер при движении, сек, (30-600)",
--     primary: false,
--     "min": 10,
--     "max": 3600,
--     "comment": " INT 60 60 180"
-- },
-- , ( "gps.flush.stop"
--     , PDI "Период отправки данных на сервер при стоянке, сек, (30-600)",
--     "min": 10,
--     "max": 3600,
--     "comment": " INT 60 60"
-- },
-- , ( "gps.maxsendfails"
--     "comment": " - INT 3 3"
-- },
-- , ( "gsm.admin"
--     , PDI "Телефон для SMS-администрирования",
--     "comment": " - STR16"
-- },
-- , ( "gsm.admin.2"
--     "comment": " - STR16"
-- },
-- , ( "gsm.admin.3"
--     "comment": " - STR16"
-- },
-- , ( "gsm.alarm"
--     , PDI "Телефон для отправки тревожных SMS",
--     "comment": " - STR16"
-- },
-- , ( "gsm.alarm.prop"
--     "comment": " - INT 7 7"
-- },
-- , ( "gsm.protbits"
--     "comment": " - INT 31 31"
-- },
-- , ( "gsm.reregtime"
--     "comment": " - INT 6 6"
-- },
-- , ( "gsm.server"
--     , PDI "Адрес сервера слежения и порт",
--     "comment": "Образец: point.newgps.navi.cc:80"
-- },
-- , ( "gsm.test"
--     , PDI "Период контроля трекера, мин (60-14400)",
--     "min": 10,
--     "max": 32768,
--     "comment": " - INT 1440 1440"
-- },
-- , ( "power.autooff"
--     "comment": " - INT 0 0"
-- },
-- , ( "secure.code"
--     , PDI "Код-расширение для скрытия IMEI трекера",
--     hidden: true,
--     "comment": " - INT 0 0"
-- },
-- , ( "accel.count"
--     , PDI "Длительность импульса акселерометра, ms",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "admin"
--     , PDI "Номер телефона администратора",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "alarm1"
--     , PDI "Первый номер телефона для отправки SMS",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "alarm2"
--     , PDI "Второй номер телефона для отправки SMS",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "alarm3"
--     , PDI "Третий номер телефона для отправки SMS",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "alarm4"
--     , PDI "Четвёртый номер телефона для отправки SMS",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "balance.skip"
--     , PDI "Пропуск цифр в отчёте оператора о балансе",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "balance.ussd"
--     , PDI "USSD-запрос остатка средств на карточке",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "chagre.min.v"
--     , PDI "Минимальное внешнее напряжение для разрешения заряда, V",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "charge.i.bot"
--     , PDI "Начальный ток заряда, A",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "charge.i.crit"
--     , PDI "Максимально допустимый ток заряда, A",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "charge.i.full"
--     , PDI "Финальный ток заряда, A",
--     primary: false,
--     "comment": "При падении тока до установленного уровня," +
--             " при ограниченни напряжения 4.2В, зарядка считается" +
--             " законченной."
-- },
-- , ( "charge.i.low"
--     , PDI "Ток поддержания заряда, A",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "charge.i.top"
--     , PDI "Максимальный ток заряда, A",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "charge.v"
--     , PDI "Максимальное напряжение заряда, V",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "delay"
--     , PDI "Задержка выключения GSM-модуля, в циклах связи",
--     primary: true,
--     "comment": " INT 1 1"
-- },
-- , ( "distance"
--     , PDI "Максимально допустимое отклонение координат, метров",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "fwupdate.path"
--     , PDI "Может лучше скрыть, чтобы не портили?",
--     primary: false,
--     hidden: true,
--     "comment": " INT 1 1"
-- },
-- , ( "fwupdate.port"
--     , PDI "Может лучше скрыть, чтобы не портили?",
--     primary: false,
--     hidden: true,
--     "comment": " INT 1 1"
-- },
-- , ( "fwupdate.server"
--     , PDI "Может лучше скрыть, чтобы не портили?",
--     primary: false,
--     hidden: true,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.angle"
--     , PDI "Минимальный регистрируемый угол поворота, градусов",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.aoff.main"
--     , PDI "Автовыключение GPS при питании от бортовой сети, мин",
--     primary: true,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.aoff.res"
--     , PDI "Автовыключение GPS при питании от встроенного аккумулятора, мин",
--     primary: true,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.data.1"
--     , PDI "Назначение дополнительного поля данных GPS",
--     primary: false,
--     hidden: false,
--     enum: [
--         {value: "1", , PDI "Датчик топлива"},
--         {value: "2", , PDI "Погрешность"},
--         {value: "3", , PDI "Фотодатчик"},
--         {value: "4", , PDI "Температура"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "gps.delta"
--     , PDI "Принудительная регистрация координат при перемещении, м",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.fail"
--     , PDI "Задержка перезапуска GPS-модуля при пропадании спутников, мин",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.tf.move"
--     , PDI "Принудительная регистрация координат при движении, сек (30-120)",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.tf.stop"
--     , PDI "Период регистрации координат при остановке, сек (30-600)",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.tf.stop.acc"
--     , PDI "Период регистрации координат при стоянке, сек (60-3600)",
--     primary: true,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.vignacc"
--     , PDI "Скорость регистрации движения без акселерометра × 0,01852 км/ч",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.vstart"
--     , PDI "Скорость регистрируется начало движения × 0,01852 км/ч",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.vstop"
--     , PDI "Скорость регистрируется остановка объекта × 0,01852 км/ч",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gps.wait"
--     , PDI "Время ожидания обнаружения спутников, минут",
--     primary: false,
--     "comment": "В Sleep-режимах, при периодических просыпаниях, " +
--             "если определить местоположение по сотовым вышкам " +
--             "не удалось, то в течении установленношо времени " +
--             "производится попытка определить положение по GPS"
-- },
-- , ( "gsm.apn"
--     , PDI "Программируеная точка входа в Интернет - APN",
--     primary: false,
--     "comment": "См также gsm.user и gsm.pwd"
-- },
-- , ( "gsm.balance.period"
--     , PDI "Период контроля баланса, часов",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gsm.extra"
--     , PDI "Аналогичен secure.code, но может содержать любые символы",
--     primary: false,
--     hidden: true,
--     "comment": " INT 1 1"
-- },
-- , ( "gsm.flags"
--     , PDI "Работа в роуминге, в том числе, в национальном",
--     "primary": false,
--     "comment": " INT 1 1"
-- },
-- , ( "gsm.lagtime"
--     , PDI "Период проверки GSM-модуля на предмет зависания (минут)",
--     "primary": false,
-- },
-- , ( "gsm.predelay"
--     , PDI "Время проверки GSM-ретрансляторов и ожидания SMS, мин",
--     primary: true,
--     "comment": " INT 1 1"
-- },
-- , ( "gsm.user"
--     , PDI "Имя пользователя для GPRS-доступа",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gsm.pwd"
--     , PDI "Пароль для GPRS-доступа",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "gsm.track.time"
--     , PDI "???",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "in.foo.1"
--     , PDI "Конфигурация входа 1",
--     primary: true,
--     enum: [
--         {value: "0", , PDI "Выключен"},
--         {value: "1", , PDI "Тревога"},
--         {value: "2", , PDI "Шлейф"},
--         {value: "3", , PDI "Зажигание"}
--     ],
--     "comment": " INT 0 0"
-- },
-- , ( "in.foo.2"
--     , PDI "Конфигурация входа 2",
--     primary: true,
--     enum: [
--         {value: "0", , PDI "Выключен"},
--         {value: "1", , PDI "Тревога"},
--         {value: "2", , PDI "Шлейф"},
--         {value: "3", , PDI "Зажигание"}
--     ],
--     "comment": " INT 0 0"
-- },
-- , ( "in.foo.3"
--     , PDI "Конфигурация входа 3",
--     primary: true,
--     enum: [
--         {value: "0", , PDI "Выключен"},
--         {value: "1", , PDI "Тревога"},
--         {value: "2", , PDI "Шлейф"},
--         {value: "3", , PDI "Зажигание"}
--     ],
--     "comment": " INT 0 0"
-- },
-- , ( "input1"
--     , PDI "Программирование входа 1",
--     primary: true,
--     enum: [
--         {value: "0", , PDI "Выключен"},
--         {value: "1", , PDI "Тревога"},
--         {value: "2", , PDI "Шлейф"},
--         {value: "3", , PDI "Зажигание"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "input2"
--     , PDI "Программирование входа 2",
--     primary: true,
--     enum: [
--         {value: "0", , PDI "Выключен"},
--         {value: "1", , PDI "Тревога"},
--         {value: "2", , PDI "Шлейф"},
--         {value: "3", , PDI "Зажигание"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "limit"
--     , PDI "Минимально допустимый баланс SIM-карты",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "main.param.long.name.very.long.name.real.looooong.name.not.joke.real.fucking.long.name.2"
--     , PDI "???",
--     primary: false,
--     hidden: true,
--     "comment": " INT 1 1"
-- },
-- , ( "main.param1"
--     , PDI "???",
--     primary: false,
--     hidden: true,
--     "comment": " INT 1 1"
-- },
-- , ( "main.param3"
--     , PDI "???",
--     primary: false,
--     hidden: true,
--     "comment": " INT 1 1"
-- },
-- , ( "mode"
--     , PDI "Режим работы",
--     enum: [
--         {value: "1", , PDI "Beacon"},
--         {value: "3", , PDI "Tracker"},
--         {value: "4", , PDI "Wait"}
--     ],
--     primary: true,
--     "comment": " INT 1 1"
-- },
-- , ( "out.1"
--     , PDI "Состояние выхода 1 (активный уровень - низкий)",
--     primary: true,
--     enum: [
--         {value: "0", , PDI "Выключен"},
--         {value: "1", , PDI "Включен"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "out.2"
--     , PDI "Состояние выхода 2 (активный уровень - низкий)",
--     primary: true,
--     enum: [
--         {value: "0", , PDI "Выключен"},
--         {value: "1", , PDI "Включен"}
--     ],
--     "comment": " INT 1 1"
-- },
-- , ( "power.max"
--     , PDI "Максимально допустимое напряжение бортового питания, V",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "power.off"
--     , PDI "Напряжение выключения трекера, V",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "power.on"
--     , PDI "Напряжение включения трекера, V",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "secur.code"
--     , PDI "Код безопасности для SMS-команд",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "service.lock"
--     , PDI "Запретить режим проверки входов-выходов",
--     "primary": false,
--     "hidden": true,
--     "comment": " INT 1 1"
-- },
-- , ( "sim900.init"
--     , PDI "Дополнительная строка инициализации GSM-модуля.",
--     primary: false,
--     hidden: true,
--     "comment": "Не изменяйте этот параметр если не знаете что он делает."
-- },
-- , ( "sleep"
--     , PDI "Время сна в режимах Beacon и Tracker, мин",
--     primary: true,
--     "comment": " INT 1 1"
-- },
-- , ( "sms.confirm"
--     , PDI "Оповещение о выполнении команды смены режима.",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключено"},
--         {value: "1", , PDI "Включено"}
--     ],
--     "comment": "Используется если СМС отправляется заблаговременно, пока "+
--                 "трекер находится в режиме сна (GSM выключен    )"
-- },
-- , ( "stealth.dist"
--     , PDI "Максимально допустимое отклонение координат, м",
--     primary: true,
--     "comment": " INT 1 1"
-- },
-- , ( "stealth.wait.gps"
--     , PDI "Устаревший параметр?",
--     primary: false,
--     hidden: true,
--     "comment": " INT 1 1"
-- },
-- , ( "timezone"
--     , PDI "Разница между текущим и мировым часовыми поясами, часов",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "vin.low"
--     , PDI "Напряжение для сообщения о разряде аккумулятора, V",
--     primary: false,
--     "comment": " INT 1 1"
-- },
-- , ( "vin.off"
--     , PDI "Напряжение автоматического выключения трекера, V",
--     primary: false,
--     "comment": " INT 1 1"
-- },
--
-- , ( "off.save"
--     , PDI "Запоминание состояния "Трекер выключен"",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Нет/Автовключение"},
--         {value: "1", , PDI "Да/Только заряд"}
--     ],
--     "comment": " INT 1 1"
-- },
--
-- , ( "off.state"
--     , PDI "Для внутреннего использования",
--     primary: false,
--     hidden: true
-- },
--
-- , ( "photo"
--     , PDI "Фотодатчик",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключен"},
--         {value: "1", , PDI "Включен"},
--     ],
--     "comment": " INT 1 1"
-- },
--
-- , ( "wake.off"
--     , PDI "Автоактивация режима Tracker при отключении внешнего питания",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключена"},
--         {value: "1", , PDI "Включена"}
--     ],
--     "comment": " INT 1 1"
-- },
--
-- , ( "wake.on"
--     , PDI "Автоактивация режима Tracker при подключении внешнего питания",
--     primary: false,
--     enum: [
--         {value: "0", , PDI "Выключена"},
--         {value: "1", , PDI "Включена"}
--     ],
--     "comment": " INT 1 1"
-- },
--
--     ]


description : String -> String
description name =
    case Dict.get name paramDesc of
        Nothing ->
            ""

        Just { title } ->
            title


disabled : String -> Bool
disabled name =
    not <|
        List.member name
            [ "executor.id"
            , "executor.key"
            , "factory.reset"
            , "fwupdate.path"
            , "fwupdate.port"
            , "fwupdate.server"
            , "gsm.server"
            , "sim900.init"
            ]
