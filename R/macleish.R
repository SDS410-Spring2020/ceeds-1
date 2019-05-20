#' Read in the current Whately and Orchard data
#' @importFrom magrittr %>%
#' @importFrom etl etl_extract etl_transform
#' @import macleish
#' @import dplyr
#' @export
#' @seealso \code{\link[macleish]{whately_2015}}
#' @examples 
#' \dontrun{
#' mac_data <- read_whately()
#' names(mac_data)
#' lapply(mac_data, dim)
#' lapply(mac_data, head)
#' }
read_whately <- function() {

  mac <- etl::etl("macleish")
  out <- mac %>%
    etl_extract() %>%
    macleish::etl_transform_help()
  
  return(out)
}

#' @export
#' @param x a tibble from WhatelyMet or OrchardMet
#' @rdname read_whately
get_daily <- function(x) {
  daily <- x %>%
    mutate(the_date = lubridate::date(when)) %>%
    group_by(the_date ) %>% 
    summarise(avgTemp = mean(temperature), 
              precipitation = sum(rainfall, na.rm = TRUE), 
              avgWindSpeed = mean(wind_speed), 
              avghumidity = mean(rel_humidity),
              maxtemp = max(temperature), 
              mintemp = min(temperature),
              maxwind = max(wind_speed), 
              minwind = min(wind_speed),
              dir = mean(wind_dir)) %>%
    mutate(avgTemp = round(avgTemp, digits = 2),
           avgF = round(((avgTemp * 1.8) + 32), digits = 2),
           MaxF = round(((maxtemp * 1.8) + 32), digits = 2),
           minF = round(((mintemp * 1.8) + 32), digits = 2))
  return(daily)
}
#' @export
#' @rdname read_whately
get_lastyear <- function(x) {
  x %>%
    filter(between(the_date, 
                   lubridate::today() - lubridate::days(365), 
                   lubridate::today()
                   )
           )
}
#' @export
#' @rdname read_whately
get_last5weeks <- function(x) {
  x %>%
    filter(between(the_date, 
                   lubridate::today() - lubridate::days(35), 
                   lubridate::today()
                   )
           )
}

#' Run the CEEDS bashboard Shiny app
#' @export
#' @examples 
#' run_dashboard()

run_dashboard <- function() {
  dir <- system.file("shiny-macleish", package = "ceeds")
  if (!fs::is_dir(dir)) {
    stop("Could not find Shiny directory. Try re-installing `ceeds`.", call. = FALSE)
  }
  shiny::runApp(dir, display.mode = "normal")
}

