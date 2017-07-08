module Lib
    ( ilos
    ) where


data Ilo = III | II | I deriving Show
 
ilos :: [Float] -> Ilo
ilos x
	|middle x < 0.50 = III
	|middle x < 0.75 = II
	|middle x <= 1.0 = I

middle :: [Float] -> Float 
middle y = sum y / (fromIntegral $ length y)

leng [] = 0
leng x = (leng $ tail x ) + 1

