################################## KEY INDICATORS MAPPING ROUTINE ##################################################


## 00. Packages needed #######################################
library(rgdal)
library(rgeos)
library(maptools)
library(dplyr)
library(tidyr)
library(tmap)
library(sp)
library(plyr)
library(dplyr)
install.packages("data.table")
install.packages("ggplot2")
library(data.table)
library(gisfao)
library(sp)
install.packages("devtools")
devtools::install_github("UNFAOstatistics/gisfao")
data(fao_world)
plot(fao_world)
data(fao_world_centroids)
plot(fao_world_centroids)
data(graticule)
plot(graticule)
library(ggplot2)



## 01. Selection of variables we are interested in from the original KI (Key Indicators) file.
KIgraph <- KI[, c("Country", "Year", "GDP_percap_USD")]   





## 02. Sum of GDP values (the variable could be changed) according to Country and Year.
KIgraph <- aggregate(data=KIgraph, GDP_percap_USD ~ Country + Year, FUN=sum)    





## 03. Changing the name of variable "Country" into "ADM0_NAME" in order to rendere the two dataset (values and geo) mergeable.
setnames(KIgraph, "Country", "ADM0_NAME" )     





## 04. Chenging the Country names in order to render them alike in both datasets.
KIgraph$ADM0_NAME <- mapvalues(KIgraph$ADM0_NAME, from=c("China, People's Republic of",               
                                                         "Bolivia (Plurinational State of)",
                                                         "Democratic People's Republic of Korea",
                                                         "Republic of Moldova",
                                                         "United Kingdom",
                                                         "Venezuela (Bolivarian Republic of)",
                                                         "Iran (Islamic Republic of)",
                                                         "State of Palestine"),
                               to= c("China",
                                     "Bolivia",
                                     "Dem People's Rep of Korea",
                                     "Moldova, Republic of",
                                     "U.K. of Great Britain and Northern Ireland",
                                     "Venezuela",
                                     "Iran  (Islamic Republic of)",
                                     "West Bank"))

KIgraph$ADM0_NAME <- mapvalues(KIgraph$ADM0_NAME, from="China, Hong Kong SAR",
                               to="China")





## 05. Merging the two datasets through the common "ADM0_NAME" variable.
KIgraphMap <- merge(KIgraph, fao_world, by="ADM0_NAME", all=T)       





## 06. Merging data and FAOSTATgis package.
fao_world_Ilio  <- fao_world                                             
fao_world_Ilio <- spTransform(fao_world_Ilio, CRS("+proj=robin"))                               ## Assigning coordinates reference system (CRS)
fao_world_Ilio$id <- rownames(fao_world_Ilio@data)                                              ## Assigning row names.
map.points <- fortify(fao_world_Ilio, region="id")
fao_world_Ilio.df <- merge(map.points, fao_world_Ilio, by = "id")
KI_map <- KIgraphMap                                                                            ## Making a copy of KIgraphMap.
names(KI_map)[names(KI_map)=="Reporter_fao_world"]<- c("ADM0_NAME")                             ## turning KI_map "Reporter_fao_world"  variable into "ADM0_NAME" to render it mergeable.     

KI_map_select <- subset(KI_map, select=c(ADM0_NAME, Year, GDP_percap_USD))                      ## Subseting variables we are interested in.

library(tidyr)
KI_map_select$Year <- paste0("Year_",KI_map_select$Year)
KI_map_wide <- spread(KI_map_select, "Year", "GDP_percap_USD")

fao_world_Ilio.df <- merge(fao_world_Ilio.df, KI_map_wide, by="ADM0_NAME", all.x=T)

map.df <- fao_world_Ilio.df






## 07. Preparation of the map.
p <- ggplot(data=map.df, aes(long,lat,group=group))                                                                 

p <- p + geom_polygon(aes(fill = Year_2013),colour="white",size=.1)

p <- p + xlab("Longitude")                                                                               # Assigning names to x and y axes (optional)                                                                                            
p <- p + ylab("Latitude")


space <- function(x, ...) {                                                                              # Formatting number with '000  separator.
  format(x, ..., big.mark = ",", scientific = FALSE, trim = TRUE)
}

p <- p + scale_fill_gradient(low = "white" , high='#FF0000',                                             # Assigning map colour and interval  breaks=seq(minimum value, maximum value, breaks)         
                             labels = space, limits=c(0, 100000), breaks=seq(0, 100000, 10000))


## 08. Adding a grid and refining both map colors and legenda. 

library(scales)
library(grid)
                                                                                                          # Graticule
grat_robin <- spTransform(graticule, CRS("+proj=robin"))                                                  # Reprojecting graticule
grat_df_robin <- fortify(grat_robin)


p <- p + geom_path(data = grat_df_robin, aes(long, lat, group = group, fill = NULL),                     # Outlook of the grid. 
                   linetype = "solid", color = "Dim Grey", size = .5)
p <- p + geom_polygon(data = map.df, aes(long,lat),fill=NA,colour="white",size = .7)
p <- p + geom_polygon(aes(fill = Year_2013),colour="white",size=.2)
p <- p + scale_fill_gradient(values=c("Dim Grey","#edf8fb","#b2e2e2","#66c2a4","#2ca25f","#006d2c"))     # Legenda settings.  
p <- p + theme(legend.position = c(0.05,0.05), 
               legend.justification=c(0,0),
               legend.key.size=unit(6,'mm'),
               legend.direction = "vertical",
               legend.background=element_rect(colour=NA, fill=alpha("white", 2/3)),
               legend.text=element_text(size=12), 
               legend.title=element_text(size=12), 
               title=element_text(size=16), 
               panel.background = element_blank(), 
               plot.background = element_blank(),
               panel.grid.minor = element_blank(),
               panel.grid.major = element_blank(),
               axis.ticks = element_blank())

p <- p + guides(fill = guide_legend(title = "GDP per capita USD - Year: 2013",
                                    title.position = "top", 
                                    title.hjust=0))

p
