module Menu exposing (view)

import Html exposing (Html, a, button, div, img, li, span, text, ul)
import Html.Attributes as HA exposing (alt, attribute, class, href, id, src)


view : Html a
view =
    div [ class "menu" ]
        [ div [ class "menu-header" ]
            [ div [ class "logo" ]
                [ img [ alt "Logo", src "images/logo.svg" ]
                    []
                ]
            , button [ class "menu-toggle-btn", id "toggleBtn" ]
                []
            ]
        , ul [ class "menu-items" ]
            [ li []
                [ a [ class "active", href "#" ]
                    [ span [ class "list-icon menu-icon" ]
                        []
                    , span [ class "menu-item-title" ]
                        [ text "Список Фениксов" ]
                    ]
                ]
            ]
        , div [ class "menu-options-wr" ]
            [ div [ class "menu-options" ]
                [ span [ class "menu-options-title" ]
                    [ text "Системные опции" ]
                , div [ class "dropdown" ]
                    [ div [ class "dropdown-title" ]
                        [ span [ class "mode-icon" ]
                            []
                        , span [ id "selectedTheme" ]
                            [ text "Темная" ]
                        , span [ class "dropdown-icon" ]
                            []
                        ]
                    , ul [ class "dropdown-list" ]
                        [ li [ class "title" ]
                            [ text "Тема\t\t\t\t\t\t\t" ]
                        , li [ attribute "onclick" "selectTheme('Темная')" ]
                            [ span [ class "item" ]
                                [ text "Темная\t\t\t\t\t\t\t\t" ]
                            ]
                        , li [ attribute "onclick" "selectTheme('Светлая')" ]
                            [ span [ class "item" ]
                                [ text "Светлая\t\t\t\t\t\t\t\t" ]
                            ]
                        ]
                    ]
                , div [ class "dropdown" ]
                    [ div [ class "dropdown-title" ]
                        [ span [ class "language-icon" ]
                            []
                        , span [ id "selectedLanguage" ]
                            [ text "Русский" ]
                        , span [ class "dropdown-icon" ]
                            []
                        ]
                    , ul [ class "dropdown-list" ]
                        [ li [ class "title" ]
                            [ text "Язык\t\t\t\t\t\t\t" ]
                        , li [ attribute "onclick" "selectLanguage('Українська')" ]
                            [ span [ class "item" ]
                                [ span [ class "flag uk" ]
                                    []
                                , text "Українська\t\t\t\t\t\t\t\t"
                                ]
                            ]
                        , li [ attribute "onclick" "selectLanguage('Русский')" ]
                            [ span [ class "item" ]
                                [ span [ class "flag ru" ]
                                    []
                                , text "Русский\t\t\t\t\t\t\t\t"
                                ]
                            ]
                        , li [ attribute "onclick" "selectLanguage('English')" ]
                            [ span [ class "item" ]
                                [ span [ class "flag en" ]
                                    []
                                , text "English\t\t\t\t\t\t\t\t"
                                ]
                            ]
                        ]
                    ]
                ]
            , div [ class "menu-options" ]
                [ span [ class "menu-options-title" ]
                    [ text "Аккаунт" ]
                , div [ class "dropdown" ]
                    [ div [ class "dropdown-title" ]
                        [ span [ class "accaunt-icon" ]
                            []
                        , span [ class "accaunt-title" ]
                            [ text "loginexample" ]
                        , span [ class "dropdown-icon" ]
                            []
                        ]
                    , ul [ class "dropdown-list" ]
                        [ li []
                            [ a [ href "#" ]
                                [ text "Настройки" ]
                            ]
                        , li []
                            [ a [ href "#" ]
                                [ text "Выйти" ]
                            ]
                        ]
                    ]
                ]
            ]
        , div [ class "submenu" ]
            [ span [ class "icon-car submenu-type" ]
                []
            , div [ class "submenu-header" ]
                [ a [ class "submenu-back", href "#" ]
                    [ span [ class "arrow" ]
                        []
                    , span [ class "title" ]
                        [ text "Список Фениксов" ]
                    ]
                , span [ class "submenu-name" ]
                    [ text "АА 1234 АС" ]
                , span [ class "submenu-status" ]
                    [ div [ class "fenix-status" ]
                        [ span [ class "status-icon wait-status" ]
                            []
                        , span [ class "status" ]
                            [ text "Ожидание" ]
                        , span [ class "icon sleep" ]
                            []
                        ]
                    ]
                ]
            , ul [ class "submenu-items" ]
                [ li []
                    [ a [ href "#" ]
                        [ span [ class "icon-map submenu-icon" ]
                            []
                        , span [ class "submenu-item-title" ]
                            [ text "Карта" ]
                        ]
                    ]
                , li []
                    [ a [ class "active", href "#" ]
                        [ span [ class "icon-manage submenu-icon" ]
                            []
                        , span [ class "submenu-item-title" ]
                            [ text "Управление" ]
                        ]
                    ]
                , li []
                    [ a [ href "#" ]
                        [ span [ class "icon-settings submenu-icon" ]
                            []
                        , span [ class "submenu-item-title" ]
                            [ text "Настройки" ]
                        ]
                    ]
                , li []
                    [ a [ href "#" ]
                        [ span [ class "icon-calendar submenu-icon" ]
                            []
                        , span [ class "submenu-item-title" ]
                            [ text "События" ]
                        ]
                    ]
                ]
            ]
        ]
