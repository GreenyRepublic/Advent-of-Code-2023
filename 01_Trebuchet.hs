import System.IO
import System.Environment
import Data.List
import Data.Char

-- Day 1: Trebuchet
-- Part 1: Sum of the first and last digit in a sequence
-- Part 2: Same as part one but the string contains digits as strings as well 

getFirstDigit :: String -> Int
getFirstDigit [] = 0
getFirstDigit (c:chars)
    | isDigit c = digitToInt c
    | otherwise = getFirstDigit chars

getSumOfLineDigits :: String -> Int
getSumOfLineDigits input = (10 * getFirstDigit input) + (getFirstDigit (reverse input))

mapPrefixToDigit :: String -> [(String, Int)] -> String
mapPrefixToDigit str [] = ""
mapPrefixToDigit str (m:mapping) 
    | (fst m) `isPrefixOf` str = show (snd m)
    | isDigit (head str) = [head str] 
    | otherwise = mapPrefixToDigit str mapping

mapWordsToDigitChars :: String -> String
mapWordsToDigitChars [] = ""
mapWordsToDigitChars string = (mapPrefixToDigit string mapping) ++ (mapWordsToDigitChars (tail string))
    where mapping = zip ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"] [0..9]

partOne :: [String] -> Int
partOne values = sum (map getSumOfLineDigits values) 

partTwo :: [String] -> Int
partTwo values = partOne (map mapWordsToDigitChars values)

main :: IO ()
main = do
    args <- getArgs
    content <- readFile (args !! 0)
    let fileLines = lines content
    print "Part One"
    print (partOne fileLines)
    print "Part Two"
    print (partTwo fileLines)