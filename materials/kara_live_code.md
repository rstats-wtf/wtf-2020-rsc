Live code from purrr workshop at rstudio::conf 2020
================
Kara Woo
2020-01-29

Use `rmarkdown::render()` on this or, in RStudio, click on the “Compile
Report” spiral-notebook icon.

## Workshop material starts here

``` r
library("purrr")
#> 
#> Attaching package: 'purrr'
#> The following object is masked from 'package:testthat':
#> 
#>     is_null
library("repurrrsive")
#help(package  = "repurrrsive")

## How many elements are in got_chars?
length(got_chars)
#> [1] 30

## Who is the 9th person listed in got_chars?
## What information is given for this person?
got_chars[9]
#> [[1]]
#> [[1]]$url
#> [1] "https://www.anapioficeandfire.com/api/characters/1303"
#> 
#> [[1]]$id
#> [1] 1303
#> 
#> [[1]]$name
#> [1] "Daenerys Targaryen"
#> 
#> [[1]]$gender
#> [1] "Female"
#> 
#> [[1]]$culture
#> [1] "Valyrian"
#> 
#> [[1]]$born
#> [1] "In 284 AC, at Dragonstone"
#> 
#> [[1]]$died
#> [1] ""
#> 
#> [[1]]$alive
#> [1] TRUE
#> 
#> [[1]]$titles
#> [1] "Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms"
#> [2] "Khaleesi of the Great Grass Sea"                                                  
#> [3] "Breaker of Shackles/Chains"                                                       
#> [4] "Queen of Meereen"                                                                 
#> [5] "Princess of Dragonstone"                                                          
#> 
#> [[1]]$aliases
#>  [1] "Dany"                    "Daenerys Stormborn"     
#>  [3] "The Unburnt"             "Mother of Dragons"      
#>  [5] "Mother"                  "Mhysa"                  
#>  [7] "The Silver Queen"        "Silver Lady"            
#>  [9] "Dragonmother"            "The Dragon Queen"       
#> [11] "The Mad King's daughter"
#> 
#> [[1]]$father
#> [1] ""
#> 
#> [[1]]$mother
#> [1] ""
#> 
#> [[1]]$spouse
#> [1] "https://www.anapioficeandfire.com/api/characters/1346"
#> 
#> [[1]]$allegiances
#> [1] "House Targaryen of King's Landing"
#> 
#> [[1]]$books
#> [1] "A Feast for Crows"
#> 
#> [[1]]$povBooks
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Storm of Swords"   
#> [4] "A Dance with Dragons"
#> 
#> [[1]]$tvSeries
#> [1] "Season 1" "Season 2" "Season 3" "Season 4" "Season 5" "Season 6"
#> 
#> [[1]]$playedBy
#> [1] "Emilia Clarke"

## What is the difference between got_chars[9] and got_chars[[9]]?
got_chars[9]
#> [[1]]
#> [[1]]$url
#> [1] "https://www.anapioficeandfire.com/api/characters/1303"
#> 
#> [[1]]$id
#> [1] 1303
#> 
#> [[1]]$name
#> [1] "Daenerys Targaryen"
#> 
#> [[1]]$gender
#> [1] "Female"
#> 
#> [[1]]$culture
#> [1] "Valyrian"
#> 
#> [[1]]$born
#> [1] "In 284 AC, at Dragonstone"
#> 
#> [[1]]$died
#> [1] ""
#> 
#> [[1]]$alive
#> [1] TRUE
#> 
#> [[1]]$titles
#> [1] "Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms"
#> [2] "Khaleesi of the Great Grass Sea"                                                  
#> [3] "Breaker of Shackles/Chains"                                                       
#> [4] "Queen of Meereen"                                                                 
#> [5] "Princess of Dragonstone"                                                          
#> 
#> [[1]]$aliases
#>  [1] "Dany"                    "Daenerys Stormborn"     
#>  [3] "The Unburnt"             "Mother of Dragons"      
#>  [5] "Mother"                  "Mhysa"                  
#>  [7] "The Silver Queen"        "Silver Lady"            
#>  [9] "Dragonmother"            "The Dragon Queen"       
#> [11] "The Mad King's daughter"
#> 
#> [[1]]$father
#> [1] ""
#> 
#> [[1]]$mother
#> [1] ""
#> 
#> [[1]]$spouse
#> [1] "https://www.anapioficeandfire.com/api/characters/1346"
#> 
#> [[1]]$allegiances
#> [1] "House Targaryen of King's Landing"
#> 
#> [[1]]$books
#> [1] "A Feast for Crows"
#> 
#> [[1]]$povBooks
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Storm of Swords"   
#> [4] "A Dance with Dragons"
#> 
#> [[1]]$tvSeries
#> [1] "Season 1" "Season 2" "Season 3" "Season 4" "Season 5" "Season 6"
#> 
#> [[1]]$playedBy
#> [1] "Emilia Clarke"
got_chars[[9]]
#> $url
#> [1] "https://www.anapioficeandfire.com/api/characters/1303"
#> 
#> $id
#> [1] 1303
#> 
#> $name
#> [1] "Daenerys Targaryen"
#> 
#> $gender
#> [1] "Female"
#> 
#> $culture
#> [1] "Valyrian"
#> 
#> $born
#> [1] "In 284 AC, at Dragonstone"
#> 
#> $died
#> [1] ""
#> 
#> $alive
#> [1] TRUE
#> 
#> $titles
#> [1] "Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms"
#> [2] "Khaleesi of the Great Grass Sea"                                                  
#> [3] "Breaker of Shackles/Chains"                                                       
#> [4] "Queen of Meereen"                                                                 
#> [5] "Princess of Dragonstone"                                                          
#> 
#> $aliases
#>  [1] "Dany"                    "Daenerys Stormborn"     
#>  [3] "The Unburnt"             "Mother of Dragons"      
#>  [5] "Mother"                  "Mhysa"                  
#>  [7] "The Silver Queen"        "Silver Lady"            
#>  [9] "Dragonmother"            "The Dragon Queen"       
#> [11] "The Mad King's daughter"
#> 
#> $father
#> [1] ""
#> 
#> $mother
#> [1] ""
#> 
#> $spouse
#> [1] "https://www.anapioficeandfire.com/api/characters/1346"
#> 
#> $allegiances
#> [1] "House Targaryen of King's Landing"
#> 
#> $books
#> [1] "A Feast for Crows"
#> 
#> $povBooks
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Storm of Swords"   
#> [4] "A Dance with Dragons"
#> 
#> $tvSeries
#> [1] "Season 1" "Season 2" "Season 3" "Season 4" "Season 5" "Season 6"
#> 
#> $playedBy
#> [1] "Emilia Clarke"
str(got_chars[9])
#> List of 1
#>  $ :List of 18
#>   ..$ url        : chr "https://www.anapioficeandfire.com/api/characters/1303"
#>   ..$ id         : int 1303
#>   ..$ name       : chr "Daenerys Targaryen"
#>   ..$ gender     : chr "Female"
#>   ..$ culture    : chr "Valyrian"
#>   ..$ born       : chr "In 284 AC, at Dragonstone"
#>   ..$ died       : chr ""
#>   ..$ alive      : logi TRUE
#>   ..$ titles     : chr [1:5] "Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms" "Khaleesi of the Great Grass Sea" "Breaker of Shackles/Chains" "Queen of Meereen" ...
#>   ..$ aliases    : chr [1:11] "Dany" "Daenerys Stormborn" "The Unburnt" "Mother of Dragons" ...
#>   ..$ father     : chr ""
#>   ..$ mother     : chr ""
#>   ..$ spouse     : chr "https://www.anapioficeandfire.com/api/characters/1346"
#>   ..$ allegiances: chr "House Targaryen of King's Landing"
#>   ..$ books      : chr "A Feast for Crows"
#>   ..$ povBooks   : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
#>   ..$ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
#>   ..$ playedBy   : chr "Emilia Clarke"
str(got_chars[[9]])
#> List of 18
#>  $ url        : chr "https://www.anapioficeandfire.com/api/characters/1303"
#>  $ id         : int 1303
#>  $ name       : chr "Daenerys Targaryen"
#>  $ gender     : chr "Female"
#>  $ culture    : chr "Valyrian"
#>  $ born       : chr "In 284 AC, at Dragonstone"
#>  $ died       : chr ""
#>  $ alive      : logi TRUE
#>  $ titles     : chr [1:5] "Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms" "Khaleesi of the Great Grass Sea" "Breaker of Shackles/Chains" "Queen of Meereen" ...
#>  $ aliases    : chr [1:11] "Dany" "Daenerys Stormborn" "The Unburnt" "Mother of Dragons" ...
#>  $ father     : chr ""
#>  $ mother     : chr ""
#>  $ spouse     : chr "https://www.anapioficeandfire.com/api/characters/1346"
#>  $ allegiances: chr "House Targaryen of King's Landing"
#>  $ books      : chr "A Feast for Crows"
#>  $ povBooks   : chr [1:4] "A Game of Thrones" "A Clash of Kings" "A Storm of Swords" "A Dance with Dragons"
#>  $ tvSeries   : chr [1:6] "Season 1" "Season 2" "Season 3" "Season 4" ...
#>  $ playedBy   : chr "Emilia Clarke"
View(got_chars[[9]])
#> Error in (function (..., row.names = NULL, check.rows = FALSE, check.names = TRUE, : arguments imply differing number of rows: 1, 5, 11, 4, 6

## What is the length of each GoT character's aliases?
map(got_chars, ~ length(.x[["aliases"]]))
#> [[1]]
#> [1] 4
#> 
#> [[2]]
#> [1] 11
#> 
#> [[3]]
#> [1] 1
#> 
#> [[4]]
#> [1] 1
#> 
#> [[5]]
#> [1] 1
#> 
#> [[6]]
#> [1] 1
#> 
#> [[7]]
#> [1] 1
#> 
#> [[8]]
#> [1] 1
#> 
#> [[9]]
#> [1] 11
#> 
#> [[10]]
#> [1] 5
#> 
#> [[11]]
#> [1] 16
#> 
#> [[12]]
#> [1] 1
#> 
#> [[13]]
#> [1] 2
#> 
#> [[14]]
#> [1] 5
#> 
#> [[15]]
#> [1] 3
#> 
#> [[16]]
#> [1] 3
#> 
#> [[17]]
#> [1] 3
#> 
#> [[18]]
#> [1] 5
#> 
#> [[19]]
#> [1] 0
#> 
#> [[20]]
#> [1] 3
#> 
#> [[21]]
#> [1] 4
#> 
#> [[22]]
#> [1] 1
#> 
#> [[23]]
#> [1] 8
#> 
#> [[24]]
#> [1] 2
#> 
#> [[25]]
#> [1] 1
#> 
#> [[26]]
#> [1] 5
#> 
#> [[27]]
#> [1] 1
#> 
#> [[28]]
#> [1] 4
#> 
#> [[29]]
#> [1] 7
#> 
#> [[30]]
#> [1] 3


## How many x does each (GoT or SW) character have?
## (x = 3 titles, allegiances, vehicles, starships)
map(got_chars, ~ length(.x[["allegiances"]]))
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] 1
#> 
#> [[3]]
#> [1] 1
#> 
#> [[4]]
#> [1] 0
#> 
#> [[5]]
#> [1] 1
#> 
#> [[6]]
#> [1] 0
#> 
#> [[7]]
#> [1] 0
#> 
#> [[8]]
#> [1] 1
#> 
#> [[9]]
#> [1] 1
#> 
#> [[10]]
#> [1] 2
#> 
#> [[11]]
#> [1] 1
#> 
#> [[12]]
#> [1] 1
#> 
#> [[13]]
#> [1] 2
#> 
#> [[14]]
#> [1] 2
#> 
#> [[15]]
#> [1] 0
#> 
#> [[16]]
#> [1] 1
#> 
#> [[17]]
#> [1] 3
#> 
#> [[18]]
#> [1] 2
#> 
#> [[19]]
#> [1] 1
#> 
#> [[20]]
#> [1] 1
#> 
#> [[21]]
#> [1] 1
#> 
#> [[22]]
#> [1] 2
#> 
#> [[23]]
#> [1] 1
#> 
#> [[24]]
#> [1] 1
#> 
#> [[25]]
#> [1] 1
#> 
#> [[26]]
#> [1] 0
#> 
#> [[27]]
#> [1] 1
#> 
#> [[28]]
#> [1] 1
#> 
#> [[29]]
#> [1] 1
#> 
#> [[30]]
#> [1] 2
map(sw_people, ~ length(.x[["vehicles"]]))
#> [[1]]
#> [1] 2
#> 
#> [[2]]
#> [1] 0
#> 
#> [[3]]
#> [1] 0
#> 
#> [[4]]
#> [1] 0
#> 
#> [[5]]
#> [1] 1
#> 
#> [[6]]
#> [1] 0
#> 
#> [[7]]
#> [1] 0
#> 
#> [[8]]
#> [1] 0
#> 
#> [[9]]
#> [1] 0
#> 
#> [[10]]
#> [1] 1
#> 
#> [[11]]
#> [1] 2
#> 
#> [[12]]
#> [1] 0
#> 
#> [[13]]
#> [1] 1
#> 
#> [[14]]
#> [1] 0
#> 
#> [[15]]
#> [1] 0
#> 
#> [[16]]
#> [1] 0
#> 
#> [[17]]
#> [1] 1
#> 
#> [[18]]
#> [1] 0
#> 
#> [[19]]
#> [1] 0
#> 
#> [[20]]
#> [1] 0
#> 
#> [[21]]
#> [1] 0
#> 
#> [[22]]
#> [1] 0
#> 
#> [[23]]
#> [1] 0
#> 
#> [[24]]
#> [1] 0
#> 
#> [[25]]
#> [1] 0
#> 
#> [[26]]
#> [1] 0
#> 
#> [[27]]
#> [1] 0
#> 
#> [[28]]
#> [1] 0
#> 
#> [[29]]
#> [1] 0
#> 
#> [[30]]
#> [1] 0
#> 
#> [[31]]
#> [1] 1
#> 
#> [[32]]
#> [1] 0
#> 
#> [[33]]
#> [1] 0
#> 
#> [[34]]
#> [1] 0
#> 
#> [[35]]
#> [1] 0
#> 
#> [[36]]
#> [1] 0
#> 
#> [[37]]
#> [1] 0
#> 
#> [[38]]
#> [1] 0
#> 
#> [[39]]
#> [1] 0
#> 
#> [[40]]
#> [1] 0
#> 
#> [[41]]
#> [1] 0
#> 
#> [[42]]
#> [1] 1
#> 
#> [[43]]
#> [1] 0
#> 
#> [[44]]
#> [1] 0
#> 
#> [[45]]
#> [1] 0
#> 
#> [[46]]
#> [1] 0
#> 
#> [[47]]
#> [1] 0
#> 
#> [[48]]
#> [1] 0
#> 
#> [[49]]
#> [1] 0
#> 
#> [[50]]
#> [1] 0
#> 
#> [[51]]
#> [1] 0
#> 
#> [[52]]
#> [1] 0
#> 
#> [[53]]
#> [1] 0
#> 
#> [[54]]
#> [1] 0
#> 
#> [[55]]
#> [1] 0
#> 
#> [[56]]
#> [1] 0
#> 
#> [[57]]
#> [1] 0
#> 
#> [[58]]
#> [1] 0
#> 
#> [[59]]
#> [1] 0
#> 
#> [[60]]
#> [1] 0
#> 
#> [[61]]
#> [1] 0
#> 
#> [[62]]
#> [1] 0
#> 
#> [[63]]
#> [1] 0
#> 
#> [[64]]
#> [1] 1
#> 
#> [[65]]
#> [1] 0
#> 
#> [[66]]
#> [1] 0
#> 
#> [[67]]
#> [1] 1
#> 
#> [[68]]
#> [1] 0
#> 
#> [[69]]
#> [1] 0
#> 
#> [[70]]
#> [1] 0
#> 
#> [[71]]
#> [1] 0
#> 
#> [[72]]
#> [1] 0
#> 
#> [[73]]
#> [1] 0
#> 
#> [[74]]
#> [1] 0
#> 
#> [[75]]
#> [1] 0
#> 
#> [[76]]
#> [1] 0
#> 
#> [[77]]
#> [1] 1
#> 
#> [[78]]
#> [1] 0
#> 
#> [[79]]
#> [1] 0
#> 
#> [[80]]
#> [1] 0
#> 
#> [[81]]
#> [1] 0
#> 
#> [[82]]
#> [1] 0
#> 
#> [[83]]
#> [1] 0
#> 
#> [[84]]
#> [1] 0
#> 
#> [[85]]
#> [1] 0
#> 
#> [[86]]
#> [1] 0
#> 
#> [[87]]
#> [1] 0



## Replace map() with type-specific
# What's each character's name?
map_chr(got_chars, ~.x[["name"]])
#>  [1] "Theon Greyjoy"      "Tyrion Lannister"   "Victarion Greyjoy" 
#>  [4] "Will"               "Areo Hotah"         "Chett"             
#>  [7] "Cressen"            "Arianne Martell"    "Daenerys Targaryen"
#> [10] "Davos Seaworth"     "Arya Stark"         "Arys Oakheart"     
#> [13] "Asha Greyjoy"       "Barristan Selmy"    "Varamyr"           
#> [16] "Brandon Stark"      "Brienne of Tarth"   "Catelyn Stark"     
#> [19] "Cersei Lannister"   "Eddard Stark"       "Jaime Lannister"   
#> [22] "Jon Connington"     "Jon Snow"           "Aeron Greyjoy"     
#> [25] "Kevan Lannister"    "Melisandre"         "Merrett Frey"      
#> [28] "Quentyn Martell"    "Samwell Tarly"      "Sansa Stark"
map_chr(sw_people, ~.x[["name"]])
#>  [1] "Luke Skywalker"        "C-3PO"                 "R2-D2"                
#>  [4] "Darth Vader"           "Leia Organa"           "Owen Lars"            
#>  [7] "Beru Whitesun lars"    "R5-D4"                 "Biggs Darklighter"    
#> [10] "Obi-Wan Kenobi"        "Anakin Skywalker"      "Wilhuff Tarkin"       
#> [13] "Chewbacca"             "Han Solo"              "Greedo"               
#> [16] "Jabba Desilijic Tiure" "Wedge Antilles"        "Jek Tono Porkins"     
#> [19] "Yoda"                  "Palpatine"             "Boba Fett"            
#> [22] "IG-88"                 "Bossk"                 "Lando Calrissian"     
#> [25] "Lobot"                 "Ackbar"                "Mon Mothma"           
#> [28] "Arvel Crynyd"          "Wicket Systri Warrick" "Nien Nunb"            
#> [31] "Qui-Gon Jinn"          "Nute Gunray"           "Finis Valorum"        
#> [34] "Jar Jar Binks"         "Roos Tarpals"          "Rugor Nass"           
#> [37] "Ric Olié"              "Watto"                 "Sebulba"              
#> [40] "Quarsh Panaka"         "Shmi Skywalker"        "Darth Maul"           
#> [43] "Bib Fortuna"           "Ayla Secura"           "Dud Bolt"             
#> [46] "Gasgano"               "Ben Quadinaros"        "Mace Windu"           
#> [49] "Ki-Adi-Mundi"          "Kit Fisto"             "Eeth Koth"            
#> [52] "Adi Gallia"            "Saesee Tiin"           "Yarael Poof"          
#> [55] "Plo Koon"              "Mas Amedda"            "Gregar Typho"         
#> [58] "Cordé"                 "Cliegg Lars"           "Poggle the Lesser"    
#> [61] "Luminara Unduli"       "Barriss Offee"         "Dormé"                
#> [64] "Dooku"                 "Bail Prestor Organa"   "Jango Fett"           
#> [67] "Zam Wesell"            "Dexter Jettster"       "Lama Su"              
#> [70] "Taun We"               "Jocasta Nu"            "Ratts Tyerell"        
#> [73] "R4-P17"                "Wat Tambor"            "San Hill"             
#> [76] "Shaak Ti"              "Grievous"              "Tarfful"              
#> [79] "Raymus Antilles"       "Sly Moore"             "Tion Medon"           
#> [82] "Finn"                  "Rey"                   "Poe Dameron"          
#> [85] "BB8"                   "Captain Phasma"        "Padmé Amidala"

# What color is each SW character's hair?
map_chr(sw_people, ~ .x[["hair_color"]])
#>  [1] "blond"         "n/a"           "n/a"           "none"         
#>  [5] "brown"         "brown, grey"   "brown"         "n/a"          
#>  [9] "black"         "auburn, white" "blond"         "auburn, grey" 
#> [13] "brown"         "brown"         "n/a"           "n/a"          
#> [17] "brown"         "brown"         "white"         "grey"         
#> [21] "black"         "none"          "none"          "black"        
#> [25] "none"          "none"          "auburn"        "brown"        
#> [29] "brown"         "none"          "brown"         "none"         
#> [33] "blond"         "none"          "none"          "none"         
#> [37] "brown"         "black"         "none"          "black"        
#> [41] "black"         "none"          "none"          "none"         
#> [45] "none"          "none"          "none"          "none"         
#> [49] "white"         "none"          "black"         "none"         
#> [53] "none"          "none"          "none"          "none"         
#> [57] "black"         "brown"         "brown"         "none"         
#> [61] "black"         "black"         "brown"         "white"        
#> [65] "black"         "black"         "blonde"        "none"         
#> [69] "none"          "none"          "white"         "none"         
#> [73] "none"          "none"          "none"          "none"         
#> [77] "none"          "brown"         "brown"         "none"         
#> [81] "none"          "black"         "brown"         "brown"        
#> [85] "none"          "unknown"       "brown"

# Is the GoT character alive?
map_lgl(got_chars, ~ .x[["alive"]])
#>  [1]  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
#> [13]  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
#> [25] FALSE  TRUE FALSE FALSE  TRUE  TRUE

# Is the SW character female?
map_lgl(sw_people, ~ .x[["gender"]] == "female")
#>  [1] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [25] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [37] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
#> [49] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
#> [61]  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE
#> [73]  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
#> [85] FALSE  TRUE  TRUE

# How heavy is each SW character?
map_dbl(sw_people, ~ .x[["mass"]])
#> Error: Can't coerce element 1 from a character to a double
map_dbl(sw_people, ~ readr::parse_number(.x[["mass"]]))
#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown

#> Warning: 1 parsing failure.
#> row col expected  actual
#>   1  -- a number unknown
#>  [1]   77.0   75.0   32.0  136.0   49.0  120.0   75.0   32.0   84.0   77.0
#> [11]   84.0     NA  112.0   80.0   74.0 1358.0   77.0  110.0   17.0   75.0
#> [21]   78.2  140.0  113.0   79.0   79.0   83.0     NA     NA   20.0   68.0
#> [31]   89.0   90.0     NA   66.0   82.0     NA     NA     NA   40.0     NA
#> [41]     NA   80.0     NA   55.0   45.0     NA   65.0   84.0   82.0   87.0
#> [51]     NA   50.0     NA     NA   80.0     NA   85.0     NA     NA   80.0
#> [61]   56.2   50.0     NA   80.0     NA   79.0   55.0  102.0   88.0     NA
#> [71]     NA   15.0     NA   48.0     NA   57.0  159.0  136.0   79.0   48.0
#> [81]   80.0     NA     NA     NA     NA     NA   45.0

# hint to self: readr::parse_number

## Explore a GoT or SW list and find a new element to look at
## Extract it across the whole list with name and position shortcuts for .f
## Use map_TYPE() to get an atomic vector as output
got_chars[[1]]
#> $url
#> [1] "https://www.anapioficeandfire.com/api/characters/1022"
#> 
#> $id
#> [1] 1022
#> 
#> $name
#> [1] "Theon Greyjoy"
#> 
#> $gender
#> [1] "Male"
#> 
#> $culture
#> [1] "Ironborn"
#> 
#> $born
#> [1] "In 278 AC or 279 AC, at Pyke"
#> 
#> $died
#> [1] ""
#> 
#> $alive
#> [1] TRUE
#> 
#> $titles
#> [1] "Prince of Winterfell"                                
#> [2] "Captain of Sea Bitch"                                
#> [3] "Lord of the Iron Islands (by law of the green lands)"
#> 
#> $aliases
#> [1] "Prince of Fools" "Theon Turncloak" "Reek"            "Theon Kinslayer"
#> 
#> $father
#> [1] ""
#> 
#> $mother
#> [1] ""
#> 
#> $spouse
#> [1] ""
#> 
#> $allegiances
#> [1] "House Greyjoy of Pyke"
#> 
#> $books
#> [1] "A Game of Thrones" "A Storm of Swords" "A Feast for Crows"
#> 
#> $povBooks
#> [1] "A Clash of Kings"     "A Dance with Dragons"
#> 
#> $tvSeries
#> [1] "Season 1" "Season 2" "Season 3" "Season 4" "Season 5" "Season 6"
#> 
#> $playedBy
#> [1] "Alfie Allen"
map(got_chars, "playedBy")
#> [[1]]
#> [1] "Alfie Allen"
#> 
#> [[2]]
#> [1] "Peter Dinklage"
#> 
#> [[3]]
#> [1] ""
#> 
#> [[4]]
#> [1] "Bronson Webb"
#> 
#> [[5]]
#> [1] "DeObia Oparei"
#> 
#> [[6]]
#> [1] ""
#> 
#> [[7]]
#> [1] "Oliver Ford"
#> 
#> [[8]]
#> [1] ""
#> 
#> [[9]]
#> [1] "Emilia Clarke"
#> 
#> [[10]]
#> [1] "Liam Cunningham"
#> 
#> [[11]]
#> [1] "Maisie Williams"
#> 
#> [[12]]
#> [1] ""
#> 
#> [[13]]
#> [1] "Gemma Whelan"
#> 
#> [[14]]
#> [1] "Ian McElhinney"
#> 
#> [[15]]
#> [1] ""
#> 
#> [[16]]
#> [1] "Isaac Hempstead-Wright"
#> 
#> [[17]]
#> [1] "Gwendoline Christie"
#> 
#> [[18]]
#> [1] "Michelle Fairley"
#> 
#> [[19]]
#> [1] "Lena Headey"
#> 
#> [[20]]
#> [1] "Sean Bean"       "Sebastian Croft" "Robert Aramayo" 
#> 
#> [[21]]
#> [1] "Nikolaj Coster-Waldau"
#> 
#> [[22]]
#> [1] ""
#> 
#> [[23]]
#> [1] "Kit Harington"
#> 
#> [[24]]
#> [1] "Michael Feast"
#> 
#> [[25]]
#> [1] "Ian Gelder"
#> 
#> [[26]]
#> [1] "Carice van Houten"
#> 
#> [[27]]
#> [1] ""
#> 
#> [[28]]
#> [1] ""
#> 
#> [[29]]
#> [1] "John Bradley-West"
#> 
#> [[30]]
#> [1] "Sophie Turner"
which(names(got_chars[[1]]) == "playedBy")
#> [1] 18
map(got_chars, 18)
#> [[1]]
#> [1] "Alfie Allen"
#> 
#> [[2]]
#> [1] "Peter Dinklage"
#> 
#> [[3]]
#> [1] ""
#> 
#> [[4]]
#> [1] "Bronson Webb"
#> 
#> [[5]]
#> [1] "DeObia Oparei"
#> 
#> [[6]]
#> [1] ""
#> 
#> [[7]]
#> [1] "Oliver Ford"
#> 
#> [[8]]
#> [1] ""
#> 
#> [[9]]
#> [1] "Emilia Clarke"
#> 
#> [[10]]
#> [1] "Liam Cunningham"
#> 
#> [[11]]
#> [1] "Maisie Williams"
#> 
#> [[12]]
#> [1] ""
#> 
#> [[13]]
#> [1] "Gemma Whelan"
#> 
#> [[14]]
#> [1] "Ian McElhinney"
#> 
#> [[15]]
#> [1] ""
#> 
#> [[16]]
#> [1] "Isaac Hempstead-Wright"
#> 
#> [[17]]
#> [1] "Gwendoline Christie"
#> 
#> [[18]]
#> [1] "Michelle Fairley"
#> 
#> [[19]]
#> [1] "Lena Headey"
#> 
#> [[20]]
#> [1] "Sean Bean"       "Sebastian Croft" "Robert Aramayo" 
#> 
#> [[21]]
#> [1] "Nikolaj Coster-Waldau"
#> 
#> [[22]]
#> [1] ""
#> 
#> [[23]]
#> [1] "Kit Harington"
#> 
#> [[24]]
#> [1] "Michael Feast"
#> 
#> [[25]]
#> [1] "Ian Gelder"
#> 
#> [[26]]
#> [1] "Carice van Houten"
#> 
#> [[27]]
#> [1] ""
#> 
#> [[28]]
#> [1] ""
#> 
#> [[29]]
#> [1] "John Bradley-West"
#> 
#> [[30]]
#> [1] "Sophie Turner"
map_chr(got_chars, 18)
#> Error: Result 20 must be a single string, not a character vector of length 3

## What if the thing you are extracting is not there or
## length 0 or of lenght > 1?



## Names make life nicer!
got_chars_named <- set_names(got_chars, map_chr(got_chars, "name"))
View(got_chars_named)
#> Error in (function (..., row.names = NULL, check.rows = FALSE, check.names = TRUE, : arguments imply differing number of rows: 1, 3, 4, 2, 6

got_chars_named %>%
  map_lgl("alive")
#>      Theon Greyjoy   Tyrion Lannister  Victarion Greyjoy               Will 
#>               TRUE               TRUE               TRUE              FALSE 
#>         Areo Hotah              Chett            Cressen    Arianne Martell 
#>               TRUE              FALSE              FALSE               TRUE 
#> Daenerys Targaryen     Davos Seaworth         Arya Stark      Arys Oakheart 
#>               TRUE               TRUE               TRUE              FALSE 
#>       Asha Greyjoy    Barristan Selmy            Varamyr      Brandon Stark 
#>               TRUE               TRUE              FALSE               TRUE 
#>   Brienne of Tarth      Catelyn Stark   Cersei Lannister       Eddard Stark 
#>               TRUE              FALSE               TRUE              FALSE 
#>    Jaime Lannister     Jon Connington           Jon Snow      Aeron Greyjoy 
#>               TRUE               TRUE               TRUE               TRUE 
#>    Kevan Lannister         Melisandre       Merrett Frey    Quentyn Martell 
#>              FALSE               TRUE              FALSE              FALSE 
#>      Samwell Tarly        Sansa Stark 
#>               TRUE               TRUE

## Challenge:
## Create a named copy of a GoT or SW list with set_names().
## Find an element with tricky presence/absence or length.
##
## Extract it many ways:
## - by name
## - by position
## - by list("name", pos) or c(pos, pos)
## - use .default for missing data
## - use map_TYPE() to coerce output to atomic vector
got_chars_named %>%
  map("books") %>%
  map_int(length) %>%
  table()
#> .
#> 0 1 2 3 4 5 
#> 1 7 6 8 6 2

map(got_chars_named, "books")
#> $`Theon Greyjoy`
#> [1] "A Game of Thrones" "A Storm of Swords" "A Feast for Crows"
#> 
#> $`Tyrion Lannister`
#> [1] "A Feast for Crows"         "The World of Ice and Fire"
#> 
#> $`Victarion Greyjoy`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> 
#> $Will
#> [1] "A Clash of Kings"
#> 
#> $`Areo Hotah`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> 
#> $Chett
#> [1] "A Game of Thrones" "A Clash of Kings" 
#> 
#> $Cressen
#> [1] "A Storm of Swords" "A Feast for Crows"
#> 
#> $`Arianne Martell`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Storm of Swords"   
#> [4] "A Dance with Dragons"
#> 
#> $`Daenerys Targaryen`
#> [1] "A Feast for Crows"
#> 
#> $`Davos Seaworth`
#> [1] "A Feast for Crows"
#> 
#> $`Arya Stark`
#> NULL
#> 
#> $`Arys Oakheart`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Storm of Swords"   
#> [4] "A Dance with Dragons"
#> 
#> $`Asha Greyjoy`
#> [1] "A Game of Thrones" "A Clash of Kings" 
#> 
#> $`Barristan Selmy`
#> [1] "A Game of Thrones"         "A Clash of Kings"         
#> [3] "A Storm of Swords"         "A Feast for Crows"        
#> [5] "The World of Ice and Fire"
#> 
#> $Varamyr
#> [1] "A Storm of Swords"
#> 
#> $`Brandon Stark`
#> [1] "A Feast for Crows"
#> 
#> $`Brienne of Tarth`
#> [1] "A Clash of Kings"     "A Storm of Swords"    "A Dance with Dragons"
#> 
#> $`Catelyn Stark`
#> [1] "A Feast for Crows"    "A Dance with Dragons"
#> 
#> $`Cersei Lannister`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> 
#> $`Eddard Stark`
#> [1] "A Clash of Kings"          "A Storm of Swords"        
#> [3] "A Feast for Crows"         "A Dance with Dragons"     
#> [5] "The World of Ice and Fire"
#> 
#> $`Jaime Lannister`
#> [1] "A Game of Thrones" "A Clash of Kings" 
#> 
#> $`Jon Connington`
#> [1] "A Storm of Swords"         "A Feast for Crows"        
#> [3] "The World of Ice and Fire"
#> 
#> $`Jon Snow`
#> [1] "A Feast for Crows"
#> 
#> $`Aeron Greyjoy`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Storm of Swords"   
#> [4] "A Dance with Dragons"
#> 
#> $`Kevan Lannister`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> [4] "A Feast for Crows"
#> 
#> $Melisandre
#> [1] "A Clash of Kings"  "A Storm of Swords" "A Feast for Crows"
#> 
#> $`Merrett Frey`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Feast for Crows"   
#> [4] "A Dance with Dragons"
#> 
#> $`Quentyn Martell`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> [4] "A Feast for Crows"
#> 
#> $`Samwell Tarly`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Dance with Dragons"
#> 
#> $`Sansa Stark`
#> [1] "A Dance with Dragons"
which(names(got_chars_named[[1]]) == "books")
#> [1] 15
map(got_chars_named, 15)
#> $`Theon Greyjoy`
#> [1] "A Game of Thrones" "A Storm of Swords" "A Feast for Crows"
#> 
#> $`Tyrion Lannister`
#> [1] "A Feast for Crows"         "The World of Ice and Fire"
#> 
#> $`Victarion Greyjoy`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> 
#> $Will
#> [1] "A Clash of Kings"
#> 
#> $`Areo Hotah`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> 
#> $Chett
#> [1] "A Game of Thrones" "A Clash of Kings" 
#> 
#> $Cressen
#> [1] "A Storm of Swords" "A Feast for Crows"
#> 
#> $`Arianne Martell`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Storm of Swords"   
#> [4] "A Dance with Dragons"
#> 
#> $`Daenerys Targaryen`
#> [1] "A Feast for Crows"
#> 
#> $`Davos Seaworth`
#> [1] "A Feast for Crows"
#> 
#> $`Arya Stark`
#> NULL
#> 
#> $`Arys Oakheart`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Storm of Swords"   
#> [4] "A Dance with Dragons"
#> 
#> $`Asha Greyjoy`
#> [1] "A Game of Thrones" "A Clash of Kings" 
#> 
#> $`Barristan Selmy`
#> [1] "A Game of Thrones"         "A Clash of Kings"         
#> [3] "A Storm of Swords"         "A Feast for Crows"        
#> [5] "The World of Ice and Fire"
#> 
#> $Varamyr
#> [1] "A Storm of Swords"
#> 
#> $`Brandon Stark`
#> [1] "A Feast for Crows"
#> 
#> $`Brienne of Tarth`
#> [1] "A Clash of Kings"     "A Storm of Swords"    "A Dance with Dragons"
#> 
#> $`Catelyn Stark`
#> [1] "A Feast for Crows"    "A Dance with Dragons"
#> 
#> $`Cersei Lannister`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> 
#> $`Eddard Stark`
#> [1] "A Clash of Kings"          "A Storm of Swords"        
#> [3] "A Feast for Crows"         "A Dance with Dragons"     
#> [5] "The World of Ice and Fire"
#> 
#> $`Jaime Lannister`
#> [1] "A Game of Thrones" "A Clash of Kings" 
#> 
#> $`Jon Connington`
#> [1] "A Storm of Swords"         "A Feast for Crows"        
#> [3] "The World of Ice and Fire"
#> 
#> $`Jon Snow`
#> [1] "A Feast for Crows"
#> 
#> $`Aeron Greyjoy`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Storm of Swords"   
#> [4] "A Dance with Dragons"
#> 
#> $`Kevan Lannister`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> [4] "A Feast for Crows"
#> 
#> $Melisandre
#> [1] "A Clash of Kings"  "A Storm of Swords" "A Feast for Crows"
#> 
#> $`Merrett Frey`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Feast for Crows"   
#> [4] "A Dance with Dragons"
#> 
#> $`Quentyn Martell`
#> [1] "A Game of Thrones" "A Clash of Kings"  "A Storm of Swords"
#> [4] "A Feast for Crows"
#> 
#> $`Samwell Tarly`
#> [1] "A Game of Thrones"    "A Clash of Kings"     "A Dance with Dragons"
#> 
#> $`Sansa Stark`
#> [1] "A Dance with Dragons"
map(got_chars_named, list("books", 1))
#> $`Theon Greyjoy`
#> [1] "A Game of Thrones"
#> 
#> $`Tyrion Lannister`
#> [1] "A Feast for Crows"
#> 
#> $`Victarion Greyjoy`
#> [1] "A Game of Thrones"
#> 
#> $Will
#> [1] "A Clash of Kings"
#> 
#> $`Areo Hotah`
#> [1] "A Game of Thrones"
#> 
#> $Chett
#> [1] "A Game of Thrones"
#> 
#> $Cressen
#> [1] "A Storm of Swords"
#> 
#> $`Arianne Martell`
#> [1] "A Game of Thrones"
#> 
#> $`Daenerys Targaryen`
#> [1] "A Feast for Crows"
#> 
#> $`Davos Seaworth`
#> [1] "A Feast for Crows"
#> 
#> $`Arya Stark`
#> NULL
#> 
#> $`Arys Oakheart`
#> [1] "A Game of Thrones"
#> 
#> $`Asha Greyjoy`
#> [1] "A Game of Thrones"
#> 
#> $`Barristan Selmy`
#> [1] "A Game of Thrones"
#> 
#> $Varamyr
#> [1] "A Storm of Swords"
#> 
#> $`Brandon Stark`
#> [1] "A Feast for Crows"
#> 
#> $`Brienne of Tarth`
#> [1] "A Clash of Kings"
#> 
#> $`Catelyn Stark`
#> [1] "A Feast for Crows"
#> 
#> $`Cersei Lannister`
#> [1] "A Game of Thrones"
#> 
#> $`Eddard Stark`
#> [1] "A Clash of Kings"
#> 
#> $`Jaime Lannister`
#> [1] "A Game of Thrones"
#> 
#> $`Jon Connington`
#> [1] "A Storm of Swords"
#> 
#> $`Jon Snow`
#> [1] "A Feast for Crows"
#> 
#> $`Aeron Greyjoy`
#> [1] "A Game of Thrones"
#> 
#> $`Kevan Lannister`
#> [1] "A Game of Thrones"
#> 
#> $Melisandre
#> [1] "A Clash of Kings"
#> 
#> $`Merrett Frey`
#> [1] "A Game of Thrones"
#> 
#> $`Quentyn Martell`
#> [1] "A Game of Thrones"
#> 
#> $`Samwell Tarly`
#> [1] "A Game of Thrones"
#> 
#> $`Sansa Stark`
#> [1] "A Dance with Dragons"
map_chr(got_chars_named, list("books", 1), .default = NA)
#>          Theon Greyjoy       Tyrion Lannister      Victarion Greyjoy 
#>    "A Game of Thrones"    "A Feast for Crows"    "A Game of Thrones" 
#>                   Will             Areo Hotah                  Chett 
#>     "A Clash of Kings"    "A Game of Thrones"    "A Game of Thrones" 
#>                Cressen        Arianne Martell     Daenerys Targaryen 
#>    "A Storm of Swords"    "A Game of Thrones"    "A Feast for Crows" 
#>         Davos Seaworth             Arya Stark          Arys Oakheart 
#>    "A Feast for Crows"                     NA    "A Game of Thrones" 
#>           Asha Greyjoy        Barristan Selmy                Varamyr 
#>    "A Game of Thrones"    "A Game of Thrones"    "A Storm of Swords" 
#>          Brandon Stark       Brienne of Tarth          Catelyn Stark 
#>    "A Feast for Crows"     "A Clash of Kings"    "A Feast for Crows" 
#>       Cersei Lannister           Eddard Stark        Jaime Lannister 
#>    "A Game of Thrones"     "A Clash of Kings"    "A Game of Thrones" 
#>         Jon Connington               Jon Snow          Aeron Greyjoy 
#>    "A Storm of Swords"    "A Feast for Crows"    "A Game of Thrones" 
#>        Kevan Lannister             Melisandre           Merrett Frey 
#>    "A Game of Thrones"     "A Clash of Kings"    "A Game of Thrones" 
#>        Quentyn Martell          Samwell Tarly            Sansa Stark 
#>    "A Game of Thrones"    "A Game of Thrones" "A Dance with Dragons"

## Challenge (pick one or more):

##  Which SW film has the most characters?
#View(sw_films)

## I think it's Attack of the Clones?

##  Which SW species has the most possible eye colors?
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.2.1     ✔ readr   1.3.1
#> ✔ tibble  2.1.3     ✔ dplyr   0.8.3
#> ✔ tidyr   1.0.0     ✔ stringr 1.4.0
#> ✔ ggplot2 3.2.1     ✔ forcats 0.4.0
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter()  masks stats::filter()
#> ✖ purrr::is_null() masks testthat::is_null()
#> ✖ dplyr::lag()     masks stats::lag()
#> ✖ dplyr::matches() masks tidyr::matches(), testthat::matches()

df <- tibble(
  who = map_chr(sw_people, "name"),
  eye_color = map_chr(sw_people, "eye_color"),
  species = map_chr(sw_people, "species", .default = NA)
)

df %>%
  group_by(species) %>%
  summarize(eye_color_n = n_distinct(eye_color)) %>%
  arrange(desc(eye_color_n))
#> # A tibble: 38 x 2
#>    species                         eye_color_n
#>    <chr>                                 <int>
#>  1 http://swapi.co/api/species/1/            6
#>  2 <NA>                                      5
#>  3 http://swapi.co/api/species/2/            3
#>  4 http://swapi.co/api/species/15/           2
#>  5 http://swapi.co/api/species/22/           2
#>  6 http://swapi.co/api/species/10/           1
#>  7 http://swapi.co/api/species/11/           1
#>  8 http://swapi.co/api/species/12/           1
#>  9 http://swapi.co/api/species/13/           1
#> 10 http://swapi.co/api/species/14/           1
#> # … with 28 more rows

species_urls <- map_chr(sw_species, "url")
most_colors <- which(species_urls == "http://swapi.co/api/species/1/")
sw_species[[most_colors]][["name"]]
#> [1] "Human"

##  Which GoT character has the most allegiances? Aliases? Titles?
##
##  Which GoT character has been played by multiple actors?

## walk

## doing the inverse
```
