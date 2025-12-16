Es 1.
```
ghci 01.hs -e "buildNSimplify (C 1) (C 1) (C 1) (C 1)"
```

Es 2.
```
ghci 02.hs -e "simplify t"
```

Es 3.
```
ghci 03.hs -e "mapQT (\x -> x+1) t"
```

Es 4.
```
ghci 04.hs -e "let z = C 0; u = C 1; q = Q z u u u in howManyPixels ( Q q ( C 0) ( C 2) q )"
```

Es 5.
```
ghci 05.hs -e "limitAll 7 [q1]"
```

Es 6.
```
ghci 06.hs -e "let z = C 0; u = C 1; q = Q z u u u in occurrencies ( Q q ( C 0) ( C 2) q ) 0"
```

Es 7.
```
ghci 07.hs -e "let d = C 2; u = C 1; q = Q d u u u in difference 1 ( Q q ( C 0) ( C 3) q )"
```

Es 8.
```
ghci 08.hs -e "let d = C 2; u = C 1; q = Q d u u u in overColor 1 ( Q q ( C 0) ( C 3) q )"
```

Es 9.
```
ghci 09.hs -e ""
```

Es 10.
```
ghci 10.hs -e "height q1"
```

Es 11.
```
ghci 11.hs -e "lengthQT q1"
```

Es 12.
```
ghci 12.hs -e "simplify t"
```

Es 13.
```
ghci 13.hs -e "mapQT (\x -> x+1) t"
```

Es 14.
```
ghci 14.hs -e "flipHorizontal t"
ghci 14.hs -e "flipVertical t"
```

Es 15.
```
ghci 15.hs -e "rotate90Right t"
ghci 15.hs -e "rotate90Left t"
ghci 15.hs -e "rotate180 t"
```

Es 16.
```
ghci 16.hs -e "isCenterSymmetric t"
```

Es 19.
```
ghci 19.hs -e "let z = C 0; u = C 1; q = Q z u u u in howManyPixels ( Q q ( C 0) ( C 2) q )"
```

Es 21.
```
ghci 21.hs -e "zipWithQT (\x y -> x+y) t1 t2"
```
