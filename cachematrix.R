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


## Checks if matrix has cached inverse:
## If it is cached it returns it
## Otherwise it computes the inverse and caches it

cacheSolve <- function(x, ...) {
    # Check if inverse is already computed
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }

    # Compute inverse
    matrix <- x$get()
    inv <- solve(matrix, ...)

    # Cache and return result
    x$setinverse(inv)
    inv
}
