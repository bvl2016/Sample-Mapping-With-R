# First of all, load the rgdal package
library(rgdal)
# readOGR is used to load the shapefile 
# mada_regions is the new spatial object which contains the shapefile
# in here, create a folder named data and put your shapefile inside
mada_regions <- readOGR(dsn = "data/mada_23_regions.shp") 
# check the structure of the data
str(mada_regions)
# check the attributes and their type
sapply(mada_regions@data, class)
# Plot all regions
plot(mada_regions, col = "lightgrey")
# Select region who has the largest area
big_r <- mada_regions$Shape_Area == max(mada_regions$Shape_Area)
# add selected zones to map
plot(mada_regions[big_r, ], col = "orange", add = TRUE) 
title("Madagascar, the 23 regions")
