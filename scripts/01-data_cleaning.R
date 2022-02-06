library(tidyverse)
library(kableExtra)
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("4bc5511d-0ecf-487a-9214-7b2359ad8f61")
package

# get all resources for this package
resources <- list_package_resources("4bc5511d-0ecf-487a-9214-7b2359ad8f61")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

data <- data%>% filter(!is.na(Time_Range))
         