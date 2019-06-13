module SvgStar where

import Data.List

type Point = (Int,Int)

htmlStart :: String
htmlStart = "<!DOCTYPE html>\n"++
           "<html>\n"++
           "<body>\n\n"++
           "<svg width=\"1000\" height=\"1000\">\n\n"

htmlEnd :: String
htmlEnd = "</svg>\n</body>\n</html>\n"

showStar :: Int -> Int -> Int -> Int -> Int -> String
showStar tx ty r sep n = showSVGLine(generateEdges tx ty r sep n n)

writeStar :: String -> Int -> Int -> Int -> Int -> Int -> IO ()
writeStar filename tx ty r sep n =
  writeFile filename (htmlStart ++ showStar tx ty r sep n ++ htmlEnd)

showSVGLine :: [(Point, Point)] -> String
showSVGLine [] = []
showSVGLine (x:xs) = "<line x1 = \"" ++ show (fst (fst x)) ++ "\" y1 = \"" ++ show (snd (fst x)) ++ "\" x2 = \""++ show (fst (snd x)) ++  "\" y2 = \"" ++ show (snd (snd x)) ++   "\" style=\"fill:none;stroke:black\"/>\n" ++ showSVGLine xs
  
  


generateEdges :: Int -> Int -> Int -> Int -> Int -> Int -> [(Point, Point)]
generateEdges tx ty r sep n 0 = []
generateEdges tx ty r sep n k = if (k - sep > 0 ) then (generatePoint tx ty r n k, generatePoint tx ty r n (mod (abs (k-sep)) n)) : generateEdges tx ty r sep n (k-1)
                                else (generatePoint tx ty r n k, generatePoint tx ty r n (mod (n - abs (k-sep)) n)) : generateEdges tx ty r sep n (k-1)
generateAllPoints :: Int -> Int -> Int -> Int -> Int-> [Point]
generateAllPoints tx ty r n 0 = []
generateAllPoints tx ty r n k = generatePoint tx ty r n k: generateAllPoints tx ty r n (k-1)

generatePoint :: Int -> Int -> Int -> Int-> Int -> Point
generatePoint tx ty r n k =
                        (
                          tx + round(
                            (fromIntegral r) *
                                  ( cos 
                                      ( 
                                        ((fromIntegral k)*2*pi) / (fromIntegral n) 
                                      )
                                  )
                          )
                                      
                                      
                        ,
                        (
                          ty +round(
                            (fromIntegral r) *
                                  ( sin 
                                      ( 
                                        ((fromIntegral k)*2*pi) / (fromIntegral n) 
                                      )
                                  )
                          )
                        )
                        )
        
