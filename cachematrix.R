## 
## 
## R Programming Assignment 2: Lexical Scoping--caching the inverse of a matrix

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse,
## which is a list containing functions to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of the matrix
## 4. get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        i<-NULL
        set<-function(y){
                x<<-y
                i<<-NULL
        } 
        get<-function() x
        setinverse<-function(inverse) i<<-inverse
        getinverse<-function() i
        list(set=set, get=get,
                setinverse=setinverse,
                getinverse=getinverse)
}


## The cacheSolve function calculates the inverse of the special "matrix" returned
## by makeCacheMatrix above. If the inverse has already been calculated (and the matrix 
## has not changed), then the cachesolve retrieves the inverse from the cache.
## Otherwise, it calculates the inverse of the matrix and sets the value of the inverse
## in the cache via the setinverse function.


cacheSolve <- function(x, ...) {
        i<-x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data<-x$get()
        i<-solve(data, ...)
        x$setinverse(i)
        i
}
