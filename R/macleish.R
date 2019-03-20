#' Read in the current Whately data
#' Read in the current Orchard data
#' @importFrom magrittr %>%
#' @export
#' @examples 
#' \dontrun{
#' whately <- read_whately()
#' nrow(whately)
#' head(whately)
#' }
#' #' \dontrun{
#' orchard <- read_orchard()
#' nrow(orchard)
#' head(orchard)
#' }

read_whately <- function() {
  macleish <- etl::etl("macleish")
  macleish %>%
    etl_extract() %>%
    etl_transform()
  whately<- macleish %>%
    dplyr::tbl("whately") %>%
    dplyr::collect() 
  return(whately)
}

read_orchard <- function() {
  macleish <- etl::etl("macleish")
  macleish %>%
    etl_extract() %>%
    etl_transform()
  orchard <- macleish %>%
    dplyr::tbl("orchard") %>%
    dplyr::collect()
  return(orchard)
}
DailyWhately <- function() {
  whately<-read_whately()
  daily_whately <- whately %>%
    mutate(the_date = date(when)) %>%
    group_by(the_date)%>% 
    summarise(N=n(), avgTemp=mean(temperature), precipitation=sum(rainfall), avgWindSpeed=mean(wind_speed), avghumidity=mean(rel_humidity),
              maxtemp= max(temperature), 
              mintemp = min(temperature),
              maxwind= max(wind_speed), 
              minwind = min(wind_speed))
  return(daily_whately)
}

DailyOrchard <- function() {
  orchard<-read_orchard()
  daily_orchard <- orchard %>%
    mutate(the_date = date(when)) %>%
    group_by(the_date)%>% 
    summarise(N=n(), avgTemp=mean(temperature), precipitation=sum(rainfall), avgWindSpeed=mean(wind_speed), avghumidity=mean(rel_humidity),
              maxtemp= max(temperature), 
              mintemp = min(temperature),
              maxwind= max(wind_speed), 
              minwind = min(wind_speed))
  return(daily_orchard)
} 


