outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

best <- function(state, outcome) {
  ## Read outcome data
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  #select columns we want
  causedata <- subset(outcomes,select=c(7,2,11,17,23))
  # clean up data a bit
  causedata <- apply(causedata,2, function(x) gsub("Not Available","NA",x))
  #label
  colnames(causedata) <- make.names(c("statename","hostpital","heart attack","heart failure","pneumonia"))

  
  causes <- c("heart attack","heart failure","pneumonia")
  states <- unique(causedata[,1])
  if (is.element(outcome,causes) == 0 ) {
    stop("invalid outcome")
  }
  if (is.element(state,states) == 0 ) {
      stop("invalid state")
  }
  outcome <- make.names(outcome)
  statedata <- subset(causedata,statename == state)
    
}

# 6 city

# "heart attack 11 ","heart failure 17","pneumonia 23"