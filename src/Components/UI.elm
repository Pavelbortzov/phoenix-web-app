module Components.UI
    exposing
        ( button
        , formHeader
        , formInput
        , formPassword
        , formButton
        , column12
        , smallForm
        )

import Html exposing (Html, h1, h5, div, a, text, i, input)
import Html.Attributes exposing (class, href, placeholder, value, type_)
import Html.Events exposing (onInput)


button : String -> String -> Html a
button url label =
    a [ class "waves-effect waves-light btn", href url ]
        [ text label ]


formHeader : String -> Html m
formHeader title =
    h5 [] [ text title ]


formInput : String -> String -> (String -> msg) -> Html msg
formInput title value_ update =
    input
        [ onInput update
        , placeholder title
        , value value_
        ]
        []


formPassword : String -> String -> (String -> msg) -> Html msg
formPassword title value_ update =
    input
        [ onInput update
        , value value_
        , placeholder title
        ]
        []


formButton : String -> Maybe String -> Maybe msg -> Html msg
formButton title enabled update =
    case enabled of
        Nothing ->
            a
                [ class "waves-effect waves-light btn", href "" ]
                [ text title ]

        Just text_ ->
            text text_


column12 : List (Html a) -> Html a
column12 childrens =
    div [ class "col s12" ] childrens


smallForm : List (Html a) -> Html a
smallForm childrens =
    div [ class "row" ]
        [ div [ class "col s8 offset-s2" ] childrens
        ]
