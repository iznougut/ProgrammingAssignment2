## The first function creates a list of functions that get and set the inversed matrix


## Returns a list

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x<<-y
                m<<-NULL
        }
        get <- function() {
                x
        }
        setInv <- function(inv) {
                m<<-inv
        }
        getInv <- function() {
                m
        }
        list(set=set, get=get, setInv=setInv, getInv=getInv)

}


## The second function checks if the inversed matrix exists, then returns it, otherwise it creates a new 
## inversed matrix and stores it inside the first list

cacheSolve <- function(x, ...) {
        m <- x$getInv()
        if (!is.null(m)) {
                message("getting inverse matrix")
                return(m)
        }
        data<- x$get()
        m <- solve(data)
        x$setInv(m)
        m
}
