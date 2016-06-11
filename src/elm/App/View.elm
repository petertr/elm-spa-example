module App.View exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)
import App.Model exposing (..)
import App.Update exposing (..)
import Pages.Login.View exposing (view)


view : Model -> Html Msg
view model =
    div []
        [ viewHeader model
        , viewMainContent model
        ]


viewHeader : Model -> Html Msg
viewHeader model =
    div []
        [ text "Main app"
        , navbarLoggedIn model
        ]


navbarLoggedIn : Model -> Html Msg
navbarLoggedIn model =
    ul []
        [ li [ onClick <| SetActivePage Login ] [ text "Login" ]
        , li [ onClick <| SetActivePage PageNotFound ] [ text "Page not found (404)" ]
        , li [ onClick <| Logout ] [ text "Logout" ]
        ]


viewMainContent : Model -> Html Msg
viewMainContent model =
    case model.activePage of
        Article ->
            div [] [ text "Article page" ]

        Login ->
            Html.map App.Update.PageLogin (Pages.Login.View.view model.pageLogin)

        PageNotFound ->
            div [] [ text "PageNotFound page" ]