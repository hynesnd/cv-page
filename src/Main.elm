module Main exposing (..)

import Browser
import Colors
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)



-- MODEL


type alias Model =
    { state : State
    }


type State
    = ViewingAbout
    | ViewingCV
    | ViewingPortfolio


init : Model
init =
    { state = ViewingAbout
    }



-- UPDATE


type Msg
    = ViewAbout
    | ViewCV
    | ViewPortfolio


update : Msg -> Model -> Model
update msg model =
    case msg of
        ViewCV ->
            { model | state = ViewingCV }

        ViewAbout ->
            { model | state = ViewingAbout }

        ViewPortfolio ->
            { model | state = ViewingPortfolio }



-- VIEW


view : Model -> Html Msg
view model =
    layout [ Background.gradient { angle = 2.14, steps = [ Colors.black, Colors.darkGrey ] }, inFront menuColumn ] <|
        ffMenu model


menuColumn =
    column [ alignRight, padding 10, height fill ]
        [ column
            [ Border.solid
            , Border.width 2
            , Border.rounded 5
            , Background.gradient { angle = 2.14, steps = [ Colors.ffUlBlue, Colors.ffLrBlue ] }
            , alignRight
            , height (px 330)
            , width (px 200)
            , spacing 4
            , paddingXY 30 10
            , Font.color Colors.offWhite
            , Font.size 25
            ]
            [ el [] (text "Item")
            , el [] (text "Magic")
            , el [] (text "Materia")
            , el [] (text "Equip")
            , el [] (text "Status")
            , el [] (text "Order")
            , el [] (text "Limit")
            , el [] (text "Config")
            , el [] (text " ")
            , el [] (text " ")
            , el [] (text "Save")
            ]
        , column
            [ Border.solid
            , Border.width 2
            , Border.rounded 5
            , Background.gradient { angle = 2.14, steps = [ Colors.ffUlBlue, Colors.ffLrBlue ] }
            , alignRight
            , alignBottom
            , width (px 200)
            , spacing 4
            , paddingXY 5 10
            , Font.color Colors.offWhite
            , Font.size 25
            ]
            [ row [ width fill ] [ el [ alignLeft ] (text "Time"), el [ alignRight ] (text "00:44:37") ]
            , row [ width fill ] [ el [ alignLeft ] (text "Gil"), el [ alignRight ] (text "350") ]
            ]
        , row
            [ Border.solid
            , Border.width 2
            , Border.rounded 5
            , Background.gradient { angle = 2.14, steps = [ Colors.ffUlBlue, Colors.ffLrBlue ] }
            , alignRight
            , alignBottom
            , width (px 375)
            , spacing 4
            , paddingXY 5 10
            , Font.color Colors.offWhite
            , Font.size 25
            ]
            [ el [ alignLeft ] (text "7th Heaven") ]
        ]


mainPanel =
    column
        [ Border.solid
        , Border.width 2
        , Border.rounded 5
        , Background.gradient { angle = 2.14, steps = [ Colors.ffUlBlue, Colors.ffLrBlue ] }
        , alignLeft
        , height (px 810)
        , width (px 700)
        , spacing 4
        , paddingXY 30 10
        , Font.color Colors.offWhite
        , Font.size 25
        ]
        [ el [] (text "Hi")
        ]


ffMenu model =
    row [ width fill, height fill, alignLeft ]
        [ mainPanel
        ]


main =
    Browser.sandbox { init = init, update = update, view = view }
