module Triplet (tripletsWithSum) where

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum sum =
    [ (a, b, c)
    | c <- [1 .. sum]
    , b <- [1 .. c]
    , let a = sum - (b + c)
    , 0 < a
    , a < b
    , c ^ 2 == a ^ 2 + b ^ 2
    ]
