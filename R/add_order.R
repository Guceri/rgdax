function (api.key, secret, passphrase, product_id = "LTC-USD", 
  type = "limit", side = "b", 
  price = NULL, size, post_only = FALSE) 
{
  req.url <- "/orders"
  method <- "POST"
  product_id <- toupper(product_id)
  price <- as.character(price)
  size <- as.character(size)
  if (side == "b") {
    side <- "buy"
  }
  else if (side == "s") {
    side <- "sell"
  }
  else {
    stop("Unrecognized sell or buy side. Please select either 'b' or 's'.")
  }
 
if (postonly) {
    order_attribs <<- list(type = type, price = price, 
    size = size, side = side, product_id = product_id, 
    post_only = "true")
    } else {
    order_attribs <<- list(type = type, price = price, 
    size = size, side = side, product_id = product_id)
    }
  
  order <- toJSON(order_attribs, auto_unbox = TRUE)
  response <- auth(method = method, req.url = req.url, api.key = api.key, 
    secret = secret, passphrase = passphrase, order = order)
  response <<- as.data.frame(response)
}
