module Main where

main :: IO ()
main = putStrLn "Review the block comment quiz in this file."

{-
Higher-Order Functions Quiz
Instructions:
- Answer without running GHCi; justify each response briefly.
- Include intermediate reasoning where a function returns another function.
- When prompted to rewrite code, preserve the original behavior.

Questions:
1. Currying in Context: In one or two sentences, explain how the type signature max :: (Ord a) => a -> (a -> a) demonstrates that max 4 5 is really two function applications.
2. Point-Free Practice: Fill in the blank to recreate the helper from the chapter — compareWithHundred = ______.
3. Sections Warm-Up: Evaluate divideByTen 35 given divideByTen = (/10), and describe why the sectioned operator acts as the desired function.
4. Partial Application Flow: Suppose multThree x y z = x * y * z and multTwoWithNine = multThree 9. Compute multTwoWithNine 2 3, and state the type of multTwoWithNine.
5. Applying Twice: Using applyTwice :: (a -> a) -> a -> a, determine the result of applyTwice (+3) 10 and interpret the role of the higher-order argument.
6. Zip Logic: What is the inferred type of zipWith' as implemented in the chapter, and why must the second and third arguments be lists?
7. Matrix Merge: Evaluate zipWith' (zipWith' (*)) [[1,2,3],[3,5,6]] [[3,2,2],[3,4,5]].
8. Mapping Squares: Give the result of map (map (^2)) [[1,2],[3,4,5]] and explain how nested mapping composes functions.
9. Filtering for Divisibility: In largestDivisible, what predicate does p enforce, and why does starting from [100000,99999..] ensure the first match is the largest?
10. Laziness Checkpoint: Explain why takeWhile (<10000) (filter odd (map (^2) [1..])) terminates even though the input list is infinite, and why filter alone would not suffice.
11. Anonymous Insight: Rewrite the helper inside numLongChains using a lambda expression and state what property it checks for each chain.
12. Scanning Ahead: Describe the purpose of scanl1 (+) within sqrtSums, and explain the reason for adding + 1 to the final length.
13. Function Composition Drill: Convert \xs -> negate (sum (tail xs)) into point-free style using function composition, as shown in the chapter.
14. Dollar Sign Discipline: Explain how Haskell's dollar operator lets you rewrite sum (filter (> 10) (map (*2) [2..10])) with fewer parentheses, and state its associativity.

-}

-- 1
-- due to currying, `max 4 5` also represented as `(max 4) 5`. latter signature is a -> a and whole
-- signature of max is `a -> (a -> a)`

-- 2
compareWithHundred = compare 100

-- 3
-- `divideByTen 35` is evaluated as 3.5. `(/10)` takes one argument as a first argument of original
-- `/` function. thus `(/10)` performs curried function of `/` with given 10 as second argument

-- 4
-- 54. signature is (Num a) => a -> a -> a

-- 5
-- 16. 1st arg of applyTwice is a -> a and there is (+3) in the example.

-- 6
-- (a -> b -> c) -> [a] -> [b] -> [c]. this function zips list given by 2nd and 3rd arg element by
-- element. the strategy to zip is given as an 1st arg.

-- 7
-- [[3,4,6],[9,20,30]]

-- 8
-- [[1,4],[9,16,25]]

-- 9
-- p enforces first arg as comparable with literal `3829` and by combinated with filter, p enforces
-- element that is multiple of 3829.

-- 10
-- because of lazy evaluation, elements of list that 2nd arg of takeWhile do not evaluated after
-- < 10_000. differ from takeWhile, filter do not recognize logical end. it always expect list's end
-- and do not stop evaluation whether 1st arg returns true

-- 13
-- negate . sum . tail

{-
Answer Key (fold this section away to self-check)
1. Currying means each arrow consumes one argument; max 4 returns a function awaiting a second a, so max 4 5 is (max 4) 5.
2. compare 100.
3. 3.5; the section (/10) fixes the right operand, yielding a unary function that divides its input by 10.
4. multTwoWithNine 2 3 equals 9 * 2 * 3 = 54; its type is (Num a) => a -> a -> a.
5. applyTwice (+3) 10 gives 16 because the function adds 3 twice in succession.
6. (a -> b -> c) -> [a] -> [b] -> [c]; the lists supply the two arguments consumed element-wise by the combining function.
7. [[3,4,6],[9,20,30]].
8. [[1,4],[9,16,25]]; the outer map applies the inner squaring map to each sublist.
9. p x = mod x 3829 == 0; iterating downward guarantees the head of the filtered list is the largest divisible number.
10. Laziness evaluates only as many squared odds as needed until the predicate fails; filter alone cannot decide to stop on an infinite source without takeWhile limiting it.
11. Use filter (\xs -> length xs > 15); it keeps chains whose length exceeds 15.
12. scanl1 (+) tracks cumulative sums so you can count how many partial totals stay under 1000; + 1 accounts for the next element that pushes the sum past 1000.
13. negate . sum . tail.
14. The dollar operator has the lowest precedence and is right-associative, so it lets function application nest without parentheses.
-}
