module Page.Route exposing (routeParser, Page(..))

import Url.Parser as Parser exposing (Parser, oneOf, s, string, map, top, (</>))


type alias SysId =
    String


type Page
    = Home
    | Auth
    | Login
    | User
    | Properties
    | GlobalMap
    | SystemOnMap SysId
    | Config
    | SystemInfo String
    | SystemConfig String
    | SystemLogs String
    | BouncePage
    | LinkSys


routeParser : Parser (Page -> a) a
routeParser =
    oneOf
        [ map Home top
        , map Home (s "home")
        , map User (s "user")
        , map Properties (s "properties")
        , map GlobalMap (s "map")
        , map SystemOnMap (s "map" </> string)
        , map Config (s "config")
        , map SystemInfo (s "system" </> string)
        , map SystemConfig (s "system" </> string </> s "config")
        , map SystemLogs (s "system" </> string </> s "logs")
        , map Auth (s "auth")
        , map Login (s "login")
        , map BouncePage (s "logout")
        , map LinkSys (s "linksys")
        ]
