module API.System
    exposing
        ( SystemDocumentInfo
        , systemDocumentDecoder
        , dynamicDecoder
          -- , LastPosition
          -- , LastSession
        , Dynamic
          -- , SysState
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
import Types.Dt as DT


-- type alias SysId =
--     String


type alias SystemDocumentInfo =
    { id : String
    , title : String
    , imei : Maybe String
    , phone : Maybe String

    -- , lastPosition : Maybe LastPosition
    -- , lastSession : Maybe LastSession
    , dynamic : Maybe Dynamic
    }


systemDocumentDecoder : JD.Decoder SystemDocumentInfo
systemDocumentDecoder =
    JD.succeed SystemDocumentInfo
        |> required "id" JD.string
        |> required "title" JD.string
        |> optional "imei" (JD.maybe JD.string) Nothing
        |> optional "phone" (JD.maybe JD.string) Nothing
        -- |> optional "last_position" (JD.maybe lastPositionDecoder) Nothing
        -- |> optional "last_session" (JD.maybe lastSessionDecoder) Nothing
        |> optional "dynamic" (JD.maybe dynamicDecoder) Nothing


type alias Dynamic =
    { lastping : Maybe DT.Dt
    , method : Maybe String
    , next : Maybe DT.Offset
    , vin : Maybe Float
    , vout : Maybe Float
    , state : Maybe State
    , available : List State
    , waitState : Maybe State
    }


dynamicDecoder : JD.Decoder Dynamic
dynamicDecoder =
    JD.succeed Dynamic
        |> optional "lastping" (JD.maybe DT.decoder) Nothing
        |> optional "method" (JD.maybe JD.string) Nothing
        |> optional "next_session" (JD.maybe DT.offsetDecoder) Nothing
        |> optional "vin" (JD.maybe JD.float) Nothing
        |> optional "vout" (JD.maybe JD.float) Nothing
        -- |> optional "state" (JD.maybe sysStateDecoder) Nothing
        |> optional "state" (JD.maybe stateDecoder) Nothing
        -- |> optional "available" statesListDecoder []
        |> optional "available" (JD.list stateDecoder) []
        |> optional "wait_state" (JD.maybe stateDecoder) Nothing



-- type alias LastPosition =
--     { lat : Float
--     , lon : Float
--     , dt : DT.Dt
--     }
--
--
-- lastPositionDecoder : JD.Decoder LastPosition
-- lastPositionDecoder =
--     JD.succeed LastPosition
--         |> required "lat" JD.float
--         |> required "lon" JD.float
--         |> required "dt" DT.decoder
--
--
-- type alias LastSession =
--     { dt : DT.Dt
--     , event : String
--     , next : Maybe DT.Offset
--     }
--
--
-- lastSessionDecoder : JD.Decoder LastSession
-- lastSessionDecoder =
--     JD.succeed LastSession
--         |> required "dt" DT.decoder
--         |> required "event" JD.string
--         |> optional "next" (JD.maybe DT.offsetDecoder) Nothing


type State
    = Tracking
    | Sleep
    | Locked
    | Off
    | Unknown String


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

                    "off" ->
                        JD.succeed Off

                    other ->
                        JD.succeed (Unknown other)
            )



-- statesListDecoder : JD.Decoder (List State)
-- statesListDecoder =
--     JD.string
--         |> JD.andThen
--             (\t ->
--                 -- TBD
--                 let
--                     states =
--                         String.foldl
--                             (\c acc ->
--                                 (c |> String.fromChar |> stateFromChar) :: acc
--                             )
--                             []
--                             t
--                 in
--                     JD.succeed states
--             )


stateAsString : State -> String
stateAsString state =
    case state of
        Tracking ->
            "Слежение"

        Sleep ->
            "Сон"

        Locked ->
            "Блокировка"

        Off ->
            "Выключен"

        Unknown c ->
            "Неизвестно:" ++ c


stateAsCmdString : State -> String
stateAsCmdString state =
    case state of
        Tracking ->
            "Отследить"

        Sleep ->
            "Усыпить"

        Locked ->
            "Заблокировать"

        Off ->
            "Выключить"

        Unknown _ ->
            "В разработке..."



-- type alias SysState =
--     { current : State
--     , available : List State
--     }
--
--
--
-- -- type SysState
--
--
-- sysStateDecoder : JD.Decoder SysState
-- sysStateDecoder =
--     JD.succeed SysState
--         |> required "current" stateDecoder
--         |> required "available" (JD.list stateDecoder)
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

                    Off ->
                        "off"

                    Unknown c ->
                        c
          )
        ]


cancelSystemState : String -> Encode.Value
cancelSystemState sysId =
    Encode.object
        [ ( "cmd", Encode.string "system_state" )
        , ( "id", Encode.string sysId )
        , ( "value", Encode.string "" )
        ]
