module Main where

import           Control.Monad (when)
import           Scanner       (scan)
import           System.IO     (BufferMode (NoBuffering), hSetBuffering, stdout)

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn $ "Geben Sie am Prompt einen Ausdruck zum Parsen\n"
              ++ "oder \":q\" zum Beenden ein."
    main'

main' :: IO ()
main' = do
    putStr "> "
    input <- getLine
    when (input /= ":q") $ do
      maybe (putStrLn "error") -- falls das Ergebnis vom dritten Parameter
                               -- `Nothing` ist, gebe "error" aus
            print              -- falls das Ergebnis vom dritten Parameter
                               -- `Just tokens` ist, gebe die tokens aus
            (scan input)       -- scanne die Eingabe
      main'
