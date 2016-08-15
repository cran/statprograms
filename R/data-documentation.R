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
#'  \item{\code{population}}{The population of the city (or region) from \url{https://www.wikipedia.org/} or \url{http://www.census.gov/popest/data/index.html}. Most are estimates from 2010 to 2014.}
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
#' # load the required packages
#' library(ggplot2)
#' library(ggmap)
#'
#' # get the map
#' map <- get_map(
#'   location = c(
#'     lon = mean(statprograms$longitude),
#'     lat = mean(statprograms$latitude)
#'   ),
#'   zoom = 3,
#'   maptype = "roadmap",
#'   scale = 2
#' )
#'
#' # plot the map with points
#' ## Alaska is cut off :(
#' ggmap(map) +
#'   geom_point(
#'     data = statprograms,
#'     aes(x = longitude, y = latitude, fill = "red", alpha = 0.5),
#'     size = 2,
#'     shape = 21
#'   ) +
#'   guides(fill = FALSE, alpha = FALSE, size = FALSE)
#' }
"statprograms"

#' @title Degrees Awarded by Year
#' @description This dataset contains the number of degrees awarded per year. It's based on data from the National Center for Education Statistics as retrieved by Steve Pierson. See  \url{http://community.amstat.org/blogs/steve-pierson/2014/07/28/categorization-of-statistics-degrees} for more information.
#' @format A \code{data.frame} with 4147 observations and 5 columns. The columns are defined as follows:
#' \describe{
#'  \item{\code{school}}{The college}
#'  \item{\code{program_category}}{The program type categorized as either "Statistics" or "Biostatistics"}
#'  \item{\code{degree_category}}{The degree categorized as either "Master" or "Doctorate"}
#'  \item{\code{year}}{The year the degrees were awarded}
#'  \item{\code{count}}{The number of degrees awarded}
#' }
#' @source Pierson, Steve. Largest U.S. Doctorate Programs in Statistics and Biostatistics. 25 July 2016.  \url{http://community.amstat.org/blogs/steve-pierson/2014/02/09/largest-doctorate-programs-in-statistics-and-biostatistics} and Pierson, Steve. Largest U.S. Master's Programs in Statistics and Biostatistics. 25 July 2016.  \url{http://community.amstat.org/blogs/steve-pierson/2014/02/09/largest-graduate-programs-in-statistics}
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
