module Types exposing (..)

import Browser
import Browser.Navigation as Nav
import Url
import Page.Route as Route
import Page.Home as Home
import Page.Login as Login
import Page.LinkSys as LinkSys
import API.Account exposing (AccountDocumentInfo, fixSysListRequest)
import API.System exposing (SystemDocumentInfo, SystemDocumentLog)
import AppState
import Page.GlobalMap as GlobalMap
import Page.System.Info.Types as SystemInfoTypes
import Dict exposing (Dict)
import Page.System.Config.Types as SystemConfigTypes
import Page.System.Logs as SystemLogs
import Msg as MsgT exposing (..)
import Html exposing (Html)
import Time


type ConnectionState
    = NotConnected
    | Connected


type alias Model =
    { token : Maybe String
    , api_url : String
    , key : Nav.Key
    , url : Url.Url
    , page : Route.Page
    , home : Home.Model
    , login : Login.Model
    , linkSys : LinkSys.Model
    , info : SystemInfoTypes.Model
    , systemConfig : SystemConfigTypes.Model
    , systemLogs : SystemLogs.Model
    , globalMap : GlobalMap.Model
    , account : Maybe AccountDocumentInfo
    , systems : Dict String SystemDocumentInfo
    , logs : Dict String (List SystemDocumentLog)
    , errorMessage : Maybe String -- Надо бы расширить функцилнал
    , appState : AppState.AppState
    , connectionState : ConnectionState
    , showQrCode : Bool
    }


type Msg
    = NoOp
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | WebsocketIn String
    | OpenWebsocket String
    | WebsocketOpened Bool
      -- | HomeMsg Home.Msg
      -- | LoginMsg Login.Msg
      -- | SystemInfoMsg SystemInfoTypes.Msg
      -- | GlobalMapMsg GlobalMap.Msg
      -- | LinkSysMsg LinkSys.Msg
    | OnCloseModal
    | TimeZoneDetected Time.Zone
    | ReceiveNow Time.Posix
    | ShowQrCode
    | HideQrCode
    | OnPageMsg PageMsg



-- | PageMsg Page Msg


type PageMsg
    = HomeMsg Home.Msg
    | LoginMsg Login.Msg
    | SystemInfoMsg SystemInfoTypes.Msg
    | SystemConfigMsg SystemConfigTypes.Msg
    | SystemLogsMsg SystemLogs.Msg
    | GlobalMapMsg GlobalMap.Msg
    | LinkSysMsg LinkSys.Msg


type alias Flags =
    { token : Maybe String
    , api_url : String
    }


type PageType pageModel pageMsg
    = PT_System (AppState.AppState -> pageModel -> SystemDocumentInfo -> Html pageMsg)


type alias PageRec pageModel pageMsg =
    { get : Model -> pageModel
    , set : pageModel -> Model -> Model
    , update : pageMsg -> pageModel -> ( pageModel, Cmd pageMsg, Maybe UpMsg )

    -- , view : AppState.AppState -> pageModel -> SystemDocumentInfo -> Html pageMsg
    , view : PageType pageModel pageMsg

    -- , view : AppState.AppState -> pageModel -> Page.ViewInfo -> Html pageMsg
    , msg : pageMsg -> PageMsg
    }
