#' convert_bodymap
#' Helper function to convert a single bodymap
#' @param segments a character vector containing segment numbers as individual strings in the vector that need to be adjusted/standardized
#' @return a character vector containing standardized segment numbers as individual strings in the vector
#'
#' @examples
#' convert_bodymap(exampledata[2,2])
#' @export

convert_bodymap <- function(segments){
  if(length(segments) == 0){
    return("")
  }
  # print("preconverted: ")
  # print(segments)
  for(i in 1:length(segments)){
    # for each segment, check to see if it needs to be set to the male numbering
    if(segments[i] == "112"){
      segments[i] <- "116"
    } else if(segments[i] == "113"){
      segments[i] <- "117"
    } else if(segments[i] == "114"){
      segments[i] <- "112"
    } else if(segments[i] == "115"){
      segments[i] <- "113"
    } else if(segments[i] == "116"){
      segments[i] <- "114"
    } else if(segments[i] == "117"){
      segments[i] <- "115"
    }
  }
  # print("converted segments: ")
  # print(segments)
  return(segments)
}
