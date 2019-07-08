module MaterialUI.TestUtils exposing (colorStory, onPressStory, themeStory, wrapView)

import Bibliopola exposing (IntoBook, Story, addStory)
import Bibliopola.Story as Story
import Element
import Element.Background as Background
import Element.Font as Font
import MaterialUI.Theme as Theme exposing (Theme)


onPressStory : String -> Story (Maybe String)
onPressStory name =
    Story "onPress" []
        |> Story.addOption "Something" (Just <| name ++ " pressed")
        |> Story.addOption "Nothing" Nothing


colorStory : Story (Theme.Color a)
colorStory =
    Story "Color" []
        |> Story.addOption "OnError" Theme.OnError
        |> Story.addOption "Error" Theme.Error
        |> Story.addOption "OnSurface" Theme.OnSurface
        |> Story.addOption "Surface" Theme.Surface
        |> Story.addOption "OnBackground" Theme.Background
        |> Story.addOption "Background" Theme.Background
        |> Story.addOption "OnSecondary" Theme.OnSecondary
        |> Story.addOption "SecondaryVariant" Theme.SecondaryVariant
        |> Story.addOption "Secondary" Theme.Secondary
        |> Story.addOption "PrimaryVariant" Theme.PrimaryVariant
        |> Story.addOption "Primary" Theme.Primary


themeStory : List ( String, Theme a ) -> Story (Theme a)
themeStory themes =
    List.foldr
        (\( name, theme ) ->
            Story.addOption name theme
        )
        (Story "Theme" [])
        themes
        |> Story.addOption "Default" Theme.defaultTheme


wrapView theme view =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.fill
        , Background.color theme.color.background
        , Font.color theme.color.onBackground
        ]
        [ Element.el
            [ Element.width Element.fill
            , Element.height Element.fill
            ]
            (Element.el
                [ Element.centerX
                , Element.centerY
                ]
                view
            )
        , Element.el
            [ Element.width Element.fill
            , Element.height Element.fill
            ]
            (Element.el
                [ Element.centerX
                , Element.centerY
                , Element.explain Debug.todo
                ]
                view
            )
        ]
