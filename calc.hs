import ArithParser
import Data.Char
import Control.Monad
import System.Environment

main :: IO ()
main = do
        [f] <- getArgs
        s <- readFile f
        let ex = run s
        print $ eval ex
        putStrLn $ show ex