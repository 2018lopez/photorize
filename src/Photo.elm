module Photo exposing (main)
import Html exposing (..)
import Html.Attributes exposing (class, src)

main : Html msg 
main = 
    div []
    [ div [ class "header"] 
        [ h1[] [ text "Photorize"] ]
    ,div [ class "content-flow" ]
        [ div [ class "detailed-photo" ]
            [ img [ src "elephants.jpg" ] []
            ,div [ class "photo-info" ]
            [ h2 [ class "caption" ] [ text "Elephant family"] ]
            ]
        ]
    ]


