module Main where

import Lib

main :: IO ()
main = do
	x <- getLine
	let y = read x :: [[Float]]
--exsample: y = [[0.5,0.3,0.2],[1.0,0.75,0.6,0.8],[0.6,0.8,0.55]]
	let x = map ilos y
	let y = show' x
	putStr y

show' x = concat $ map (\ y -> "- " ++ show y ++ "\n" ) x
	
	
