module Page.System.Info.Dialogs exposing (..)

import Page.System.Info.Types exposing (Model, Msg, Msg(..))
import Html exposing (Html, div, text, a)
import Html.Attributes exposing (class, href)
import Components.UI as UI


prolongSleepDialogView : Model -> String -> List (Html Msg)
prolongSleepDialogView model sysId =
    if model.showSleepProlongDialog then
        [ UI.modal
            ""
            [ UI.ModalText "Продлить работу в режиме Поиск"
            , UI.ModalHtml <| UI.cmdButton "На 4 часа" (OnProlongSleep sysId 4)
            , UI.ModalHtml <| UI.cmdButton "На сутки" (OnProlongSleep sysId 24)
            , UI.ModalHtml <| UI.cmdButton "Навсегда" (OnProlongSleep sysId 100)
            ]
            [ UI.cmdButton "Отменить" (OnHideProlongSleepDialog)
            ]
        , UI.modal_overlay OnHideProlongSleepDialog
        ]
    else
        []


viewModalDialogs : Model -> List (Html Msg)
viewModalDialogs model =
    if model.showConfirmOffDialog then
        [ UI.modal
            "Внимание!"
            [ UI.ModalText "Это действие необратимо."
            , UI.ModalText "Для включения потребуется доступ к Фениксу."
            , UI.ModalText "Вы действительно хотите выключить Феникс?"
            ]
            [ UI.cmdButton "Да" (OnConfirmOff)
            , UI.cmdButton "Нет" (OnCancelOff)
            ]
        , UI.modal_overlay OnCancelOff
        ]
    else
        []
