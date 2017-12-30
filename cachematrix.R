## Put comments here that give an overall description of what your
## functions do

## create a matrix

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  ##inner function to set initial matrix and its inverse
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  ##inner function to get initial matrix
  get <- function() x
  ##set inverse matrix
  setsolve <- function(solve) s <<- solve
  ##get inverse matrix
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## get the inverse matrix from cache(if exist) or calculation

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
