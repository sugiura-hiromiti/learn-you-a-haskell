import Data.Bifunctor qualified
import Distribution.Compat.Prelude

doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100 then x else x * 2

doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

misoSoupe'Introduction = "aka miso"

-- list
-- >>> firstMulOf13 3
numbers = [1, 2, 3, 4, 5]

firstMulOf13 x = x `take` [13, 26 ..]

complexListComprehension = [x * 10 | x <- [x * 10 | x <- 100 `take` cycle [1, 3 .. 37], x `mod` 3 == 0], x `mod` 50 == 0]

boomBangs xs = [if x `mod` 3 == 1 then "0w0" else "^w^" | x <- xs, odd x && x `mod` 7 /= 1]

productCombMoreThan50 xs ys = [x * y | x <- xs, y <- ys, combIsMoreThan50 x y]

combIsMoreThan50 x y = x * y > 50

pcmt50WithSpecificList limit = productCombMoreThan50 [1, 5 .. 20] (limit `take` [2, 5 ..])

length' xs = sum [1 | _ <- xs]

removeUpperCase st = [c | c <- st, c `notElem` ['A' .. 'Z']]

oddFilter xxs = [[x | x <- xs, odd x] | xs <- xxs]

rightTriangles :: Int -> [(Int, Int, Int)]
rightTriangles limit = [(a, b, c) | c <- [1 .. limit], b <- [1 .. c], a <- [1 .. b], a ^ 2 + b ^ 2 == c ^ 2]

len' :: (Num a) => [b] -> a
len' [] = 0
len' (_ : xs) = 1 + len' xs

cap' :: String -> String
cap' "" = "empty"
cap' bind@(x : xs) = "the first letter of " ++ bind ++ " is " ++ [x]

densityTell :: (RealFloat a) => a -> String
densityTell dnsty
   | dnsty < 1.2 = "light"
   | dnsty <= 1000.0 = "med"
   | otherwise = "sink"

densityTell' :: (RealFloat a) => a -> a -> String
densityTell' mass vol
   | density < air = densityTell (1 / density)
   | density <= water = densityTell vol
   | otherwise = densityTell density
  where
   density = mass / vol
   air = 1.2
   water = 1000.0

compare' :: (Ord a) => a -> a -> Ordering
a `compare'` b
   | a > b = GT
   | a == b = EQ
   | otherwise = LT

densityTell'' :: String -> String
densityTell'' input
   | Just density <- readMaybe input, density < air = "flow"
   | otherwise = "sink"
  where
   air = 1.2

initials' :: String -> String -> String
initials' firstname lastname = f : [l]
  where
   (f : _) = firstname
   (l : _) = lastname

densityTell''' :: (RealFloat a) => [(a, a)] -> [a]
densityTell''' xs = [density mass vol | (mass, vol) <- xs]
  where
   density mass vol = mass / vol

cvlinder :: (RealFloat a) => a -> a -> a
cvlinder r h =
   let
      vertSide = 2 * r * h * pi
      horSide = r ^ 2 * pi
    in
      vertSide + 2 * horSide

squares :: (Num a) => [a] -> [a]
squares [] = []
squares (x : y) = let square x = x * x in square x : squares y

take' :: (Num a, Ord a) => a -> [i] -> [i]
take' n _ | n <= 0 = []
take' n [] = []
take' n (x : xs) = x : take' (n - 1) xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
   let smallerSorted = quicksort (filter' (x >=) xs)
       largerSorted = quicksort (filter' (> x) xs)
    in smallerSorted ++ [x] ++ largerSorted

divideByTen :: (Floating a) => a -> a
divideByTen = (/ 10)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where
   g x y = f y x

flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x : xs)
   --    let remain = filter' f xs
   --     in if f x then x : remain else remain
   --
   -- pattern matching is better than procedualistic implementation above
   | f x = x : remain
   | otherwise = remain
  where
   remain = filter' f xs

largestDivisible :: (Integral a) => a
largestDivisible = Prelude.head (filter' p [100_000, 99_999 ..])
  where
   p x = x `mod` 3829 == 0

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (x : xs)
   | f x = x : remnant
   | otherwise = []
  where
   remnant = takeWhile' f xs
