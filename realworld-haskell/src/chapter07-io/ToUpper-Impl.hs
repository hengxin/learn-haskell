-- file: chapter07-io/ToUpper-Impl.hs

import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do
  inh <- openFile "input.txt" ReadMode
  outh <- openFile "output.txt" WriteMode
  mainLoop inh outh
  hClose inh
  hClose outh

mainLoop :: Handle -> Handle -> IO ()
mainLoop inh outh =
  do ineof <- hIsEOF inh
     if ineof
     then  return ()
     else  do inputStr <- hGetLine inh
              hPutStrLn outh (map toUpper inputStr)
              mainLoop inh outh
