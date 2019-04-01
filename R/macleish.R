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
  mac <- refresh_macleish()
  
  whately <- mac %>%
    attr("load") %>%
    fs::dir_ls(regex = "whately.csv$") %>%
    readr::read_csv()
  
  orchard <- mac %>%
    attr("load") %>%
    fs::dir_ls(regex = "orchard.csv$") %>%
    readr::read_csv()
  
  return(list("whately" = whately, "orchard" = orchard))
}

refresh_macleish <- function() {
  mac <- etl::etl("macleish")
  mac %>%
    etl_extract() %>%
    etl_transform()
  
  return(mac)
}

#' @export
#' @rdname read_whately
get_daily <- function(x) {
  daily <- x %>%
    mutate(the_date = lubridate::date(when)) %>%
    group_by(the_date)%>% 
    summarise(N=n(), avgTemp=mean(temperature), precipitation=sum(rainfall), 
              avgWindSpeed=mean(wind_speed), avghumidity=mean(rel_humidity),
              maxtemp= max(temperature), 
              mintemp = min(temperature),
              maxwind= max(wind_speed), 
              minwind = min(wind_speed),
              avgwind_direction = mean(wind_dir)) %>%
    mutate(avgTemp = round(avgTemp,digits=2)) %>%
    mutate(avgF = (avgTemp * 1.8)+32) %>%
    mutate(MaxF = (maxtemp * 1.8)+32) %>%
    mutate(minF = (mintemp * 1.8)+32)
  return(daily)
}
#' @export
#' @rdname read_whately
get_lastyear <- function(y) {
This_year <- y%>%
  filter(between(the_date, lubridate::today() - lubridate::days(365), lubridate::today()))
return(This_year)
}
