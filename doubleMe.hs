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
