#' ---
#' title: "Live code from purrr workshop at rstudio::conf 2020"
#' author: "Kara Woo"
#' date: "`r format(Sys.Date())`"
#' output: github_document
#' ---

#+ setup, include = FALSE, cache = FALSE
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", error = TRUE)

#' Use `rmarkdown::render()` on this or, in RStudio, click on the "Compile Report" spiral-notebook icon.
#'
#' ## Workshop material starts here

library("purrr")
library("repurrrsive")
#help(package  = "repurrrsive")

## How many elements are in got_chars?
length(got_chars)

## Who is the 9th person listed in got_chars?
## What information is given for this person?
got_chars[9]

## What is the difference between got_chars[9] and got_chars[[9]]?
got_chars[9]
got_chars[[9]]
str(got_chars[9])
str(got_chars[[9]])
View(got_chars[[9]])

## What is the length of each GoT character's aliases?
map(got_chars, ~ length(.x[["aliases"]]))


## How many x does each (GoT or SW) character have?
## (x = 3 titles, allegiances, vehicles, starships)
map(got_chars, ~ length(.x[["allegiances"]]))
map(sw_people, ~ length(.x[["vehicles"]]))



## Replace map() with type-specific
# What's each character's name?
map_chr(got_chars, ~.x[["name"]])
map_chr(sw_people, ~.x[["name"]])

# What color is each SW character's hair?
map_chr(sw_people, ~ .x[["hair_color"]])

# Is the GoT character alive?
map_lgl(got_chars, ~ .x[["alive"]])

# Is the SW character female?
map_lgl(sw_people, ~ .x[["gender"]] == "female")

# How heavy is each SW character?
map_dbl(sw_people, ~ .x[["mass"]])
map_dbl(sw_people, ~ readr::parse_number(.x[["mass"]]))

# hint to self: readr::parse_number

## Explore a GoT or SW list and find a new element to look at
## Extract it across the whole list with name and position shortcuts for .f
## Use map_TYPE() to get an atomic vector as output
got_chars[[1]]
map(got_chars, "playedBy")
which(names(got_chars[[1]]) == "playedBy")
map(got_chars, 18)
map_chr(got_chars, 18)

## What if the thing you are extracting is not there or
## length 0 or of lenght > 1?



## Names make life nicer!
got_chars_named <- set_names(got_chars, map_chr(got_chars, "name"))
View(got_chars_named)

got_chars_named %>%
  map_lgl("alive")

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

map(got_chars_named, "books")
which(names(got_chars_named[[1]]) == "books")
map(got_chars_named, 15)
map(got_chars_named, list("books", 1))
map_chr(got_chars_named, list("books", 1), .default = NA)

## Challenge (pick one or more):

##  Which SW film has the most characters?
#View(sw_films)

## I think it's Attack of the Clones?

##  Which SW species has the most possible eye colors?
library(tidyverse)

df <- tibble(
  who = map_chr(sw_people, "name"),
  eye_color = map_chr(sw_people, "eye_color"),
  species = map_chr(sw_people, "species", .default = NA)
)

df %>%
  group_by(species) %>%
  summarize(eye_color_n = n_distinct(eye_color)) %>%
  arrange(desc(eye_color_n))

species_urls <- map_chr(sw_species, "url")
most_colors <- which(species_urls == "http://swapi.co/api/species/1/")
sw_species[[most_colors]][["name"]]

##  Which GoT character has the most allegiances? Aliases? Titles?
##
##  Which GoT character has been played by multiple actors?

## walk

## doing the inverse
