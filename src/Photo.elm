module Photo exposing (main)
import Html exposing (..)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Browser
import Dict exposing (update)

baseUrl : String
baseUrl =
    "images/"

viewDetailedPhoto : { url : String, caption : String, liked : Bool } -> Html Msg
viewDetailedPhoto  model =
    let 
        buttonType =
            if model.liked then
                "favorite"
            else
                "favorite_border"
        msg =
            if model.liked then
                Unlike
            else
                Like
    in
        div [ class "detailed-photo" ]
            [ img [ src model.url ] []
            ,div [ class "photo-info" ]
                [ div [ class "like-button" ]
                    [ span 
                        [ class "material-icons md-48"
                        , onClick msg
                        ]
                        [ text buttonType ]
                    ]
                    , h2 [ class "caption" ] [ text model.caption ] 
                ]
            ]

-- Model

initialModel : { url : String, caption : String, liked : Bool }
initialModel =
    {
        url = baseUrl ++ "cats.jpg"
        ,caption = "Cat Family"
        ,liked = False
    }

type Msg = Like | Unlike

update : Msg -> { url : String, caption : String, liked : Bool } -> { url : String, caption : String, liked : Bool}
update msg model =
    case msg of
        Like ->
            { model | liked = True }
        Unlike ->
            { model | liked = False }
view : { url : String, caption : String, liked : Bool} -> Html Msg
view model =
    div []
    [ div [ class "header" ]
        [ h1[] [ text "Photorize" ] ]
    ,div [ class "content-flow" ]
        [ viewDetailedPhoto model]
    
    ]
-- Main
main : Program () { url : String, caption : String, liked : Bool} Msg
main =
    Browser.sandbox{
        init = initialModel
        ,view = view
        ,update = update
    }