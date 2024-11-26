{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}

{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Redundant return" #-}

module Tutorial where

import Control.Monad
import Keelung
import GHC.Generics (Generic)

-- | A program that outputs whatever number is given.
echo :: Comp Field
echo = do
  x <- input Private -- request for a private input and bind it to 'x'
  return x -- return 'x'

-- | A program that requests for 2 inputs and add them together
add :: Comp Field
add = do
  x <- input Public -- request for a public input and bind it to 'x'
  y <- input Private -- request for a private input and bind it to 'y'
  return (x + y)

-- | Crunch some numbers
arithmetics :: Comp Field
arithmetics = do
  x <- input Public :: Comp Field
  y <- input Private
  let temp = x * (3 - y)
  return (temp * temp + 42)

-- | A program that requests for 2 Boolean inputs and returns the conjunction of them
conjunct :: Comp Boolean
conjunct = do
  x <- input Public
  y <- input Private
  return (x .&. y)

-- | A program that requests for 2 Field inputs and see if they are equal
equalField :: Comp Boolean
equalField = do
  x <- inputField Private
  y <- inputField Private
  return (x `eq` y)

-- | A program that asserts 2 Field inputs to be equal
assertEqualField :: Comp ()
assertEqualField = do
  x <- inputField Private
  y <- inputField Private
  assert (x `eq` y)

assertEqualFieldTest :: Field -> Field -> Comp ()
assertEqualFieldTest x y = do
  assert (x `eq` y)

-- | Returns either the first Field or the second Field base on the Boolean
choose :: Comp Field
choose = do
  xOrY <- input Public
  x <- input Public
  y <- input Public
  return $
    cond
      xOrY -- predicate
      x -- then branch
      y -- else branch

-- | Request for 4 public inputs
get4Field :: Comp [Field]
get4Field = do
  x0 <- input Public
  x1 <- input Public
  x2 <- input Public
  x3 <- input Public
  return [x0, x1, x2, x3]

-- | Request for 8 public inputs
get8Field :: Comp [Field]
get8Field = replicateM 8 (input Public)

-- | Request for 10 public inputs
get10Field :: Comp [Field]
get10Field = inputList Public 10

-- | A program that asserts all 10 inputs to be 42
allBe42 :: Comp ()
allBe42 = do
  xs <- inputList Public 4 :: Comp [Field]
  -- access elements of `xs` with indices from 0 to 9
  forM_ [0 .. 3] $ \i -> do
    assert (xs !! i `eq` 42)
  -- access elements of `xs` directly
  forM_ xs $ \x -> do
    assert (x `eq` 42)

-- | Request for 4 public inputs and sum them up
sumOf4Fields :: Comp Field
sumOf4Fields = do
  xs <- inputList Public 4
  return (sum xs)

-- | Request for a certain number of public inputs and sum them up
sumOfFields :: Int -> Comp Field
sumOfFields n = do
  xs <- inputList Public n
  return (sum xs)

-- | `caller` intantiates `sumOfFields` with different numbers
caller :: Comp Field
caller = do
  sum1 <- sumOfFields 2
  sum2 <- sumOfFields 3
  return (sum1 + sum2)

newtype KEither a b = KEither (a, b)
  deriving (Generic)

instance (Encode a, Encode b) => (Encode (KEither a b))