#' Read in the current Whately data
#' Read in the current Orchard data
#' @importFrom magrittr %>%
#' @import macleish
#' @export
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
    read_csv()
  
  orchard <- mac %>%
    attr("load") %>%
    fs::dir_ls(regex = "orchard.csv$") %>%
    read_csv()
  
  return(list("whately" = whately, "orchard" = orchard))
}


refresh_macleish <- function() {
  mac <- etl::etl("macleish")
  mac %>%
    etl_extract() %>%
    etl_transform()
  
  return(mac)
}

