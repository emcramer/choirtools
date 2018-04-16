# Function convert_bodymap
#   Converts the different male/female CHOIR BodyMap numberings to the male numberings as a standard
#   Author: Eric Cramer <emcramer@stanford.edu>

## prep_bodymaps
# converts a single charcter vector of bodymaps into a list of character vectors, each a bodymap
# Parameters:
#   maps: a character vector containing the endorsed bodymap segments of patients in csv form
# Return Values:
#   segment.list: a list of character vectors, where each vector contains the patient's endorsed segments

prep_bodymaps <- function(maps){
  # list containing all of the bodymap regions indicated by each patient, by each patient
  segment.list <- str_split(maps, ",") 
  return(segment.list)
}

## convert_bodymaps
# function to convert multiple bodymaps
# Parameters:
#   f_maps: a list of character vectors where each character vector is a CHOIR bodymap. Each element in the vector is a segment identification number.
# Return Values:
#   maps: a list of character vectors of bodymaps using the male CHOIR bodymap numberings as a standard

convert_bodymaps <- function(f_maps){
  ret_maps <- list()
  # iterate through each of the bodymaps in the vector
  for(i in 1:length(f_maps)){
    curr_map <- f_maps[[i]]
    # print("Curr map")
    # print(curr_map)
    ret_maps[[i]] <- convert_bodymap(curr_map)
  }
  return(ret_maps)
}

## convert_bodymap
# Helper function to convert a single bodymap
# Parameters: 
#   segments: a character vector containing segment numbers as individual strings in the vector that need to be adjusted/standardized
# Return Values:
#   segments: a character vector containing standardized segment numbers as individual strings in the vector
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