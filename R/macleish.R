#' Read in the current Whately and Orchard data
#' @importFrom magrittr %>%
#' @importFrom etl etl_extract etl_transform
#' @import macleish
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

