library(tidyverse)
library(sf)
library(CODECtools)

# isochrones <- s3::s3_get("s3://geomarker/drivetime/isochrones_no_overlap.rds") |>
#   readRDS()
# 
# cchmc_isochrone <- isochrones[["cchmc"]]
# saveRDS(cchmc_isochrone, "cchmc_isochrone.rds")
# fs::dir_delete("s3_downloads")

cchmc_isochrone <- readRDS("cchmc_isochrone.rds")

tract_drivetime <- st_intersection(cincy::tract_tigris_2010, cchmc_isochrone) |>
  mutate(
    area = round(as.numeric(st_area(geometry))),
    drive_time = as.numeric(as.character(drive_time))) |>
  group_by(census_tract_id) |>
  mutate(wt_drive_time = drive_time * area/sum(area)) |>
  summarize(drive_time_avg = round(sum(wt_drive_time),1))

tract_drivetime <- st_drop_geometry(tract_drivetime)

tract_drivetime <- tract_drivetime |>
  add_attrs(
    name = "hamilton_drivetime",
    title = "Tract-Level Drivetime to CCHMC",
    version = "0.1.0",
    homepage = "https://geomarker.io/hamilton_drivetime"
  )

tract_drivetime <-
  tract_drivetime |>
  add_col_attrs(census_tract_id, title = "Census Tract Identifier") |>
  add_col_attrs(drive_time_avg, title = "Average Drive Time to CCHMC", description = "weighted average of overlapping drivetime isochrones") 
tract_drivetime <- add_type_attrs(tract_drivetime)

# write metadata.md
cat("#### Metadata\n\n", file = "metadata.md", append = FALSE)
CODECtools::glimpse_attr(tract_drivetime) |>
  knitr::kable() |>
  cat(file = "metadata.md", sep = "\n", append = TRUE)

cat("\n#### Schema\n\n", file = "metadata.md", append = TRUE)
tract_drivetime |>
  CODECtools::glimpse_schema() |>
  knitr::kable() |>
  cat(file = "metadata.md", sep = "\n", append = TRUE)

write_tdr_csv(tract_drivetime)
