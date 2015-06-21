## Put comments here that give an overall description of what your
## functions do

## This function is object constructor

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinvmatrix <- function(solve) m <<- solve
  getinvmatrix <- function() m
  list(set =set,
       get = get,
       setinvmatrix = setinvmatrix,
       getinvmatrix = getinvmatrix
      )
}


## This function returns the inverted version of the 
## matrix passed to the function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinvmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix <- x$get()
  m <- solve(matrix, ...)
  x$setinvmatrix(m)
  m
}
