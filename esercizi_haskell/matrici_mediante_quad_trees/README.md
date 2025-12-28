Es 1.
```
ghci 01.hs -e "lowertriangular $ Mat 0 (C 2)"
ghci 01.hs -e "lowertriangular $ Mat 1 (C 2)"
```

Es 3.
```
ghci 03.hs -e "diagonal $ Mat 1 (C 2)"
```

Es 4.
```
ghci 04.hs -e "matSum m1 m2"
```

Es 8.
```
ghci 08.hs -e "let z = C 0; u = C 1; d = C 2 in colSums $ Mat 3 $ Q ( Q u d d u ) z u d"
```

Es 13.
```
ghci 13.hs -e "transpose m"
```

Es 15.
```
ghci 15.hs -e ""
```
