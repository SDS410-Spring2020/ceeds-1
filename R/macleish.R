#' Read in the current Whately data
#' @importFrom magrittr %>%
#' @export
#' @examples 
#' \dontrun{
#' whately <- read_whately()
#' nrow(whately)
#' head(whately)
#' }

read_whately <- function() {
  macleish <- etl::etl("macleish")
  macleish %>%
    etl::etl_update()
  whately <- macleish %>%
    dplyr::tbl("whately") %>%
    dplyr::collect()
  return(whately)
}