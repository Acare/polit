library(readr)
library(readxl)
library(sf)
library(ggplot2)

# shape file at https://www.istat.it/it/archivio/222527

# ASSEMBLEA COSTITUENTE
d <- read_csv2("data/assemblea_costituente/assemblea_costituente-19460602.txt")
s_comuni <- st_read("data/basi_geo/Limiti_1991_ED50_g/Com1991_ED50_g/Com1991_ED50_g.shp")
s_regioni <- st_read("data/basi_geo/Limiti_1991_ED50_g/Reg1991_ED50 _g/Reg1991_ED50_g.shp")
s_prov <- st_read("data/basi_geo/Limiti_1991_ED50_g/Prov1991_ED50_g/Prov1991_ED50_g.shp")

ggplot(s_prov) +
    geom_sf() +
    theme_void()
