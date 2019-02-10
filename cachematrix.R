# How to use:
# 1. Create inversible numeric matrix: Matrix 
# 2. Create a cache for inversed matrix via function makeCacheMatrix(Matrix)
# 3. Inverse Matrix or check for already existing solution in cache via function cacheSolve
# 4. Enjoy

#Example:
# Matrix <- matrix(c(1,4,6,3,4,5,6,7,9),3,3)
# cache <- makeCacheMatrix(Matrix)
# result <- cacheSolve(cache)
# result

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    
    x <<- y
    m <<- NULL
  }
  get <- function() x
  set_solve <- function(solve) m <<- solve
  get_solved <- function() m
  list(set = set, get = get,
       set_solve = set_solve,
       get_solved = get_solved)
  
}


## cacheSolve returns an inversed matrix, it can compute inversed
# matrix if this operation wasn't made earlier or loads from cache and returns inversed matrix 
#if it was computed earlier.

cacheSolve <- function(x, ...) {
  m <- x$get_solved()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$set_solve(m)
  m
}

