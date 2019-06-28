module API.System
    exposing
        ( SystemDocumentInfo
        , systemDocumentDecoder
        , LastPosition
        , SysState
        , State
          -- , SysId
        , stateAsString
        , stateAsCmdString
        , setSystemTitle
        , setSystemState
        , cancelSystemState
        )

import Json.Decode as JD
import Json.Decode.Pipeline exposing (hardcoded, optional, required)
import Json.Encode as Encode
import API.Document as Document


-- type alias SysId =
--     String


type alias SystemDocumentInfo =
    { id : String
    , title : String
    , lastPosition : Maybe LastPosition
    , state : Maybe SysState
    , waitState : Maybe State
    }


systemDocumentDecoder : JD.Decoder SystemDocumentInfo
systemDocumentDecoder =
    JD.succeed SystemDocumentInfo
        |> required "_id" JD.string
        |> required "title" JD.string
        |> optional "last_position" (JD.maybe lastPositionDecoder) Nothing
        |> optional "state" (JD.maybe sysStateDecoder) Nothing
        |> optional "wait_state" (JD.maybe stateDecoder) Nothing


type alias LastPosition =
    { lat : Float
    , lon : Float
    , dt : Int
    }


lastPositionDecoder : JD.Decoder LastPosition
lastPositionDecoder =
    JD.succeed LastPosition
        |> required "lat" JD.float
        |> required "lon" JD.float
        |> required "dt" JD.int


type State
    = Tracking
    | Sleep
    | Locked
    | Unknown


stateDecoder : JD.Decoder State
stateDecoder =
    JD.string
        |> JD.andThen
            (\t ->
                case t of
                    "tracking" ->
                        JD.succeed Tracking

                    "sleep" ->
                        JD.succeed Sleep

                    "locked" ->
                        JD.succeed Locked

                    _ ->
                        JD.succeed Unknown
            )


stateAsString : State -> String
stateAsString state =
    case state of
        Tracking ->
            "Слежение"

        Sleep ->
            "Сон"

        Locked ->
            "Блокировка"

        Unknown ->
            "Неизвестно"


stateAsCmdString : State -> String
stateAsCmdString state =
    case state of
        Tracking ->
            "Отследить"

        Sleep ->
            "Усыпить"

        Locked ->
            "Заблокировать"

        Unknown ->
            "В разработке..."


type alias SysState =
    { current : State
    , available : List State
    }


sysStateDecoder : JD.Decoder SysState
sysStateDecoder =
    JD.succeed SysState
        |> required "current" stateDecoder
        |> required "available" (JD.list stateDecoder)



-- JD.map AccountDocumentInfo
--     (JD.field "realname" JD.string)


setSystemTitle : String -> String -> Encode.Value
setSystemTitle sysId newTitle =
    Document.updateDocumentRequest "system" <|
        Encode.object
            [ ( "key", Encode.string sysId )
            , ( "path", Encode.string "title" )
            , ( "value", Encode.string newTitle )
            ]


setSystemState : String -> State -> Encode.Value
setSystemState sysId newState =
    -- "cmd" : "system_mode",
    -- "id" : "$SYS_ID1",
    -- "mode" : "main",
    -- "value" : "force"
    Encode.object
        [ ( "cmd", Encode.string "system_state" )
        , ( "id", Encode.string sysId )
        , ( "value"
          , Encode.string <|
                case newState of
                    Tracking ->
                        "tracking"

                    Sleep ->
                        "sleep"

                    Locked ->
                        "locked"

                    Unknown ->
                        "unknown"
          )
        ]


cancelSystemState : String -> Encode.Value
cancelSystemState sysId =
    Encode.object
        [ ( "cmd", Encode.string "system_state" )
        , ( "id", Encode.string sysId )
        , ( "value", Encode.string "" )
        ]
