import ArithParser
import Data.Char
import Control.Monad
import System.Environment

test1 :: (Int, Int)
test1 = (3, (eval $ run "1+2"))

test2 :: (Int, Int)
test2 = (3, (eval $ run "1 + 2    "))

test3 :: (Expr, Expr)
test3 = (Mul (Add (Lit 1) (Lit 2)) (Lit 3), (run "(1 + 2) * 3"))

test4 :: (Int, Int)
test4 = (200, (eval $ run "(3 + 2)^2 * 2 ^ 3"))

test5 :: (Int, Int)
test5 = (-2, (eval $ run "2 - 4"))

test6 :: (Expr, Expr)
test6 = (Add (Lit 1) (Add (Lit 1) (Lit 1)), (run "1 + (1 + 1)"))

test7 :: (Expr, Expr)
test7 = (Add (Add (Lit 1) (Lit 1)) (Lit 1), (run "(1 + 1) + 1"))

runTest :: (Show a, Eq a) => Int -> (a, a) -> IO ()
runTest n (ex, res) = do
    if (ex == res) then
        putStrLn $ "Test " ++ (show n) ++ " passed."
    else
        putStrLn $ "Test " ++ (show n) ++ " failed: expected " ++ (show ex) ++ ", got " ++ (show res) ++ "."

main :: IO ()
main = do
        runTest 1 test1
        runTest 2 test2
        runTest 3 test3
        runTest 4 test4
        runTest 5 test5
        runTest 6 test6
        runTest 7 test7