context("test-macleish")

test_that("refresh works", {
  mac_data <- read_whately()
  expect_is(mac_data, "list")
  expect_length(mac_data, 2)
})
