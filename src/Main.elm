module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)



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
    div []
        [ heading
        , case model.state of
            ViewingAbout ->
                p [] [ text "This is the about" ]

            ViewingCV ->
                p [] [ text "This is the CV" ]

            ViewingPortfolio ->
                p [] [ text "This is the Portfolio" ]
        ]


heading =
    div [ class "heading" ]
        [ h1 [ class "header-text" ] [ text "Neil Hynes" ]
        , p [ class "header-subtext" ] [ text "Junior Software Engineer" ]
        , p [ class "header-subtext", onClick ViewAbout ] [ text "About" ]
        , p [ class "header-subtext", onClick ViewCV ] [ text "CV" ]
        , p [ class "header-subtext", onClick ViewPortfolio ] [ text "Portfolio" ]
        ]


main =
    Browser.sandbox { init = init, update = update, view = view }
