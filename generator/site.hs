{-# LANGUAGE OverloadedStrings #-}
module Main (main)
where

import Hakyll

main :: IO ()
main = do
  hakyll $ do
    match "templates/*" $ compile templateBodyCompiler
    match "posts/*.org" $ do
      route $ setExtension "html"
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/blogpost.html" defaultContext
        >>= relativizeUrls
