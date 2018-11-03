## Provides functions for caching the inverse of arbitrary matrix

## Creates wrapper around specified matrix that has the ability to
## cache inverse of stored matrix. Returns a list containing access
## methods for stored matrix and it's inverse.

makeCacheMatrix <- function(x = matrix()) {
    # Init inverse
    inv <- NULL

    # Matrix accessors
    get <- function() x
    set <- function(y) {
        x <<- y
        m <<- NULL
    }

    # Inverse accessors
    getinverse <- function() inv
    setinverse <- function(inverse) inv <<- inverse

    # Return wrapper functions
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
}
