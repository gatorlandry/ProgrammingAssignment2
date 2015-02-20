## Matrix inversion can be a costly computation. 
## The following 2 functons cache a matrix to avoid re-calcualting when not needed.

## The first function creates a list that contains the following functions:
## set matrix
## get matrix
## set inverse of matrix
## get inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL 
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## The following function will return the inverse of a matrix. 
## First it checks if the inverse has been calculated. 
## If so, it will use the cached matrix. 
## If not, it will calcualte the inverse matrix and store in the cache. 
cacheSolve <- function(x, ...) {

  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data.")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}  

  