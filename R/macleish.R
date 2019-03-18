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
    dplyr::collect() %>%
    read_csv()
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

