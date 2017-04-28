module Scanner
  ( scan
  ) where

import           Control.Applicative ((<$>))
import           Types               (Token (..))

scan :: String -> Maybe [Token]
-- Ein leerer String kann erfolgreich zu einer leeren Tokenliste gescannt werden.
-- Das ist auch der Abbruchfall für die Rekursion.
scan []         = Just []
-- Notwendige Schritte beim Lesen eines '+':
-- 1. Scannen des Restes: Rekursiver Aufruf `scan rest`
-- 2.1 Wenn das Scannen des Rests fehl schlug, d.h. das Ergebnis ist `Nothing`,
--     schlägt das Scannen insgesamt fehl, d.h. ist insgesamt `Nothing`:
--     `case scan rest of Nothing -> Nothing`
-- 2.2 Wenn das Scannen des Rests erfolgreich war, d.h. das Ergebnis ist
--     `Just tokens`, muss das Token `Add` vorne an die Tokens angefügt werden
--     und das gesamte Ergebnis in ein `Just` eingepackt werden:
--     `case scan rest of Just tokens -> Just (Add : tokens)`
-- also z.B.
-- scan ('+':rest) = case scan rest of
--                      Nothing     -> Nothing
--                      Just tokens -> Just (Add:tokens)
-- Mit der Funktion `fmap` können wir die Schreibweise mit `case-of` vereinfachen.
-- `fmap` hat zwei Parameter.
-- Der zweite Parameter `scan rest` wird berechnet, wenn dabei `Nothing`
-- heraus kommt, gibt `fmap` auch `Nothing` zurück. Wenn dabei `Just xs`
-- heraus kommt, wird der erste Parameter `(Add:)` auf `xs` angewendet.
-- `(Add:)` ist dabei die Kurzschreibweise für `(\list -> Add : list)`, also
-- das vorne anfügen von `Add` an eine Liste. Die Funktion `fmap` packt
-- dann das Ergebnis noch automatisch in ein `Just` ein.
--    scan ('+':rest) = fmap (Add:) $ scan rest
-- Die Funktion `fmap` gibt es auch als Operator `<$>`. Damit macht die
-- folgende Definition das selbe wie die drei Zeilen mit `case-of` oben:
scan ('+':rest) = (Add:) <$> scan rest
-- Scannen von (, ), -, *, /:

-- Scannen von Integer mit einem regulären Ausdruck:

-- Alles andere schlägt fehl.
scan _          = Nothing
