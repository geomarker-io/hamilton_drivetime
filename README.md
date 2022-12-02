# Hamilton County Drive Time to CCHMC

## About

This R code generates the **Hamilton County Drive Time to CCHMC** (`hamilton_drivetime`) data resource. A census tract-level measure of drive time to Cincinnati Children's Hospital Medical Center is derived using drive time isochrones obtained from [openroute service](https://classic-maps.openrouteservice.org/reach?n1=38.393339&n2=-95.339355&n3=5&b=0&i=0&j1=30&j2=15&k1=en-US&k2=km). 

See [metadata.md](./metadata.md) for detailed metadata and schema information.

## Accessing Data

Read this CSV file into R directly from the [release](https://github.com/geomarker-io/hamilton_drivetime/releases) with:

```
readr::read_csv("https://github.com/geomarker-io/hamilton_drivetime/releases/download/v0.1.0/hh_acs_measures.csv")
```

Metadata can be imported from the accompanying `tabular-data-resource.yaml` file by using [{CODECtools}](https://geomarker.io/CODECtools/).

## Data Details

#### Creating Tract-Level Drive Time

Tract-level drive time is an area-weighted average of drive times (in 6-minute intervals) corresponding to isochrones that overlap each census tract. 
