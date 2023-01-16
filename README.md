# Sample-Mapping-With-R
Step by step on how to map with R.

# Prerequisite 
Basic knowledge in GIS.

# Installation
R and Rstudio <br>
For this tuto, R version 4.2.2 Patched (2022-11-10 r83330) is used.

# Package
R Package needed for this first tuto is rgdal which provides functions for reading and writing vector and raster spatial data.

FYI, here is the website for all spatial packages available : https://cran.r-project.org/web/views/Spatial.html 

PS : In this tuto, we use the Madagascar 23 regions shapefile from this link : https://www.unsalb.org/data/mdg?fbclid=IwAR0bVCV5CJdmKy833ESaY9bbERWo6AbI9Jdv5EasQFpnAkcl_IYoRZ6NeMQ 

# Codes

## First of all, load the rgdal package

```R
library(rgdal)
```

## Next, assign the new spatial object within a variable named mada_regions , and use the function readOGR in order to load the shapefile 

```R
mada_regions <- readOGR(dsn = "data/mada_23_regions.shp") 
```

## Check the structure of the data

```R
str(mada_regions)
```

## Check the attributes and their type

```R
sapply(mada_regions@data, class)

```
## Plot all regions

```R
plot(mada_regions, col = "lightgrey")
```
![mada_grey](https://user-images.githubusercontent.com/16953165/211030473-3824f4a1-e4ab-4ab9-911b-574d7c2a9dd8.png)

## Select region who has the largest area
In here, we use the Shape_Area column to check the value.
```R
big_r <- mada_regions$Shape_Area == max(mada_regions$Shape_Area)
```
## Add selected zones to map
```R
plot(mada_regions[big_r, ], col = "orange", add = TRUE) 
```
## Add a title to the map
```R
title("Madagascar, the 23 regions")
```
![mada_with_highest_r](https://user-images.githubusercontent.com/16953165/211030987-725bca3a-f2a3-473f-bc48-43f06f0732e6.png)


To conclude, this is just a simple manipulation to begin with. We will see for the next coming tuto, thematic maps with some spatial analysis!

If you would like to further your skills in mapping with R, there are lots of resources out there, not to mention https://github.com/Robinlovelace/Creating-maps-in-R

## Join more attributes from external source

In here, we load a csv which contains the statistic data related to number of habitants in Madagascar that I get from the internet (means it is not an official dataset, just for the practice) 

```R
stat_pop <- read.csv("pop_region.csv",
                       stringsAsFactors = FALSE)
```
Now, we compare the ADM2NM column in mada_regions to region column in stat_pop to see which rows match.
```R
mada_regions$ADM2NM %in% stat_pop$region
```
```R
[1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[20] TRUE TRUE TRUE TRUE

```

