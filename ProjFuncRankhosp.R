rankhospital <- function(state, outcome, rank) {
    
    datas <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    newd <- cbind(datas[,2], datas[,7], datas[,11], datas[,17], datas[,23]) 
    colnames(newd) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia") 
    
    if (!state %in% newd[,"state"]) {
        stop("Invalid State") }
    else if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
        stop("Invalid Outcome")
    }
    else if (is.numeric(rank)) {
        stat <- which(newd[,"state"] == state)
        reqdat <- newd[stat,]
        orderr <- order(reqdat[,outcome])
        reqdator <- reqdat[orderr,]
        output <- reqdator[rank,1]
    }
    else if (!is.numeric(rank)) {
        if (rank == "best") {
        stat <- which(newd[,"state"] == state)
        reqdat <- newd[stat,]
        orderr <- order(reqdat[,outcome])
        reqdator <- reqdat[orderr,]    
        output <- reqdator[1,1]}
        else if (rank == "worst") {
            stat <- which(newd[,"state"] == state)
            reqdat <- newd[stat,]
            orderr <- order(reqdat[,outcome], decreasing = TRUE)
            reqdator <- reqdat[orderr,]
            output <- reqdator[1,1]
        }
    }   
    return(output)
}

rankhospital("AZ","pneumonia", "worst")

