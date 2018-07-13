{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
module Frontend where

import qualified Data.Text as T
import Control.Monad (void)
import Control.Lens
import Reflex.Dom.Core

import Reflex.Dom.Widget.SVG as S
import Reflex.Dom.Widget.SVG.Types as S

import Static

frontend :: (StaticWidget x (), Widget x ())
frontend = (head', body)
  where
    head' = el "title" $ text "Les Arts"
    body = do
      el "h1" $ text "Les Arts"
      demo

demo :: MonadWidget t m => m ()
demo = do
  let dSVGEl = pure $ SVG_El (Width 600.0) (Height 400) Nothing
  let attrs = mempty & at "id" ?~ "svg1" & at "class" ?~ "blue no-yellow"
  let dRect1 = pure $ S.SVG_Rect
          (S._PosX # 40.0)
          (S._PosY # 40.0)
          (S.Width 50.0)
          (S.Height 50.0)
          Nothing
          Nothing
  let shiftRect = fmap (S.svg_rect_pos_x . S._PosX +~ 3.0)
  void $ svg_ dSVGEl $ do
    S.svgBasicDyn S.Rectangle (mappend attrs . S.makeRectProps) (shiftRect dRect1) (pure mempty)
