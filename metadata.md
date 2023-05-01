#### Metadata

|name     |value                                   |
|:--------|:---------------------------------------|
|name     |hamilton_drivetime                      |
|version  |0.1.0                                   |
|title    |Tract-Level Drivetime to CCHMC          |
|description | Average drivetime in 6-minute intervals for census tracts in Hamilton County |
|homepage |https://geomarker.io/hamilton_drivetime |

#### Schema

|name            |title                       |type   |description                                          |
|:---------------|:---------------------------|:------|:----------------------------------------------------|
|census_tract_id |Census Tract Identifier     |string |NA                                                   |
|drive_time_avg  |Average Drive Time to CCHMC |number |weighted average of overlapping drivetime isochrones |
