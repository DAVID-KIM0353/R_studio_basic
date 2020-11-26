expression <- function(x){
  k <- 0
  for(i in 1:x){
    sum_ <- 0
    for(j in i:x){
      sum_ = sum_ + j
      
      if(sum_ == x){
        k <- k + 1
        break
      }
      if(sum_ > x){
        break
      }
    }
  }
  return(k)
}
expression(15)
