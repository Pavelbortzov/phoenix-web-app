module Page.System.Config.Dialogs exposing (..)

import Page.System.Config.Types exposing (..)
import API.System as System exposing (SystemDocumentParams)
import Components.UI as UI exposing (..)
import Html exposing (Html, div, text, a, form, p, label, input, span)
import Html.Attributes as HA exposing (class, href, attribute, type_, checked)
import Html.Events as HE
import Dict exposing (Dict)


titleChangeDialogView : Model -> String -> List (UI Msg)
titleChangeDialogView model sysId =
    if model.showTitleChangeDialog then
        [ UI.modal
            "Название"
            [ UI.ModalText "Отображаемое имя системы:"
            , UI.ModalHtml <| UI.formInput "Имя" model.newTitle OnTitleChange
            ]
            [ UI.cmdButton "Применить" (OnTitleConfirm sysId model.newTitle)
            , UI.cmdButton "Отменить" (OnTitleCancel)
            ]
        , UI.modal_overlay OnTitleCancel
        ]
    else
        []


viewRemoveWidget : Model -> List (Html Msg)
viewRemoveWidget model =
    if model.showRemodeDialog then
        [ UI.modal
            "Удаление"
            [ UI.ModalText "Вы уверены что хотите удалить систему из списка наблюдения?"
            , UI.ModalText "Напоминаю, что вы не можете просто добавить систему в список наблюдения, необходимо проделать определенную процедуру."
            ]
            [ UI.cmdButton "Да" (OnConfirmRemove)
            , UI.cmdButton "Нет" (OnCancelRemove)
            ]
        , UI.modal_overlay OnCancelRemove
        ]
    else
        []


paramChangeDialogView : Model -> Maybe SystemDocumentParams -> List (UI Msg)
paramChangeDialogView model mparams =
    let
        oldQueue =
            case mparams of
                Nothing ->
                    Dict.empty

                Just { queue } ->
                    queue
    in
        case model.showParamChangeDialog of
            Nothing ->
                []

            Just { sysId, name, value, description } ->
                [ UI.modal
                    name
                    [ UI.ModalText description
                    , UI.ModalHtml <| UI.formInput "" value OnChangeParamValue
                    ]
                    [ UI.cmdButton "Применить" (OnConfirmParam sysId oldQueue name value)
                    , UI.cmdButton "Отменить" (OnCancelParam)
                    ]
                , UI.modal_overlay OnTitleCancel
                ]
