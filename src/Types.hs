module Types
  ( Token(..)
  ) where

data Token =
      NatNum Integer     -- ^ represents Integer
    | OpeningParenthesis -- ^ '('
    | ClosingParenthesis -- ^ ')'
    | Add                -- ^ '+'
    | Minus              -- ^ '-'
    | Mult               -- ^ '*'
    | Div                -- ^ '/'
  deriving (Show, Eq)
