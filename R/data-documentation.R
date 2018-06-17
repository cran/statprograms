#' @title Graduate Statistics Program Data
#' @description This dataset contains various information from the majority of graduate statistics programs in the United States.
#' @format A \code{data.frame} with 490 observations and 16 columns. The columns are defined as follows:
#' \describe{
#'  \item{\code{school}}{The college}
#'  \item{\code{program}}{The program type as advertised by the department}
#'  \item{\code{program_category}}{The program type categorized as either "Statistics" or "Biostatistics"}
#'  \item{\code{degree}}{The degree given by the department}
#'  \item{\code{degree_category}}{The degree categorized as either "Master" or "Doctorate"}
#'  \item{\code{state}}{The state}
#'  \item{\code{city}}{The city}
#'  \item{\code{square_miles}}{The square miles of the city (or region) from \url{https://www.wikipedia.org/}}
#'  \item{\code{population}}{The population of the city (or region) from \url{https://www.wikipedia.org/} or \url{https://www.census.gov/programs-surveys/popest/data/data-sets.html}. Most are estimates from 2010 to 2014.}
#'  \item{\code{density}}{The population density}
#'  \item{\code{average_winter}}{The average winter temperature from \url{http://weatherdb.com}}
#'  \item{\code{average_summer}}{The average summer temperature from \url{http://weatherdb.com}}
#'  \item{\code{latitude}}{The latitude of the department's building (or as close as possible) from \url{http://www.gps-coordinates.net}}
#'  \item{\code{longitude}}{The longitude of the department's building (or as close as possible) from \url{http://www.gps-coordinates.net}}
#'  \item{\code{link}}{The URL of the department's website}
#'  \item{\code{date_collected}}{The date the information was recorded}
#' }
#' @author Brett Klamer
#' @examples
#' \dontrun{
#' data(statprograms)
#' summary(statprograms)
#'
#' #----------------------------------------------------------------------------
#' # Plot locations on a map
#' #----------------------------------------------------------------------------
#' library(maps)
#' library(ggplot2)
#' library(mapproj)
#'
#' us_states <- map_data("state")
#'
#' ggplot(
#'   data = statprograms[statprograms$state != "Alaska", ],
#'   mapping = aes(x = longitude, y = latitude)
#' ) +
#'   geom_polygon(
#'     data = us_states,
#'     aes(x = long, y = lat, group = group),
#'     fill = "white",
#'     color = "gray50",
#'     size = 0.5
#'   ) +
#'   geom_point() +
#'   guides(fill = FALSE) +
#'   coord_map(
#'     projection = "albers",
#'     lat0 = 39,
#'     lat1 = 45
#'   ) +
#'   theme_bw()
#' }
"statprograms"

#' @title Degrees Awarded by Year
#' @description This dataset contains the number of degrees awarded per year. It's based on data from the National Center for Education Statistics as retrieved by Steve Pierson. See  \url{http://community.amstat.org/blogs/steve-pierson/2014/07/28/categorization-of-statistics-degrees} for more information.
#' @format A \code{data.frame} with 4606 observations and 5 columns. The columns are defined as follows:
#' \describe{
#'  \item{\code{school}}{The college}
#'  \item{\code{program_category}}{The program type categorized as either "Statistics" or "Biostatistics"}
#'  \item{\code{degree_category}}{The degree categorized as either "Master" or "Doctorate"}
#'  \item{\code{year}}{The year the degrees were awarded}
#'  \item{\code{count}}{The number of degrees awarded}
#' }
#' @source "Statistics and Biostatistics Degree Data.", \url{www.amstat.org/asa/education/Statistics-and-Biostatistics-Degree-Data.aspx}
#' @examples
#' \dontrun{
#' data(degreesawarded)
#' summary(degreesawarded)
#'
#' # In wide format as provided by Steve Pierson
#' library(tidyr)
#' spread(degreesawarded, key = year, value = count)
#' }
"degreesawarded"
