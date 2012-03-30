#' Facial recognition info from face.com
#'
#' Facial recognition using the face.com API
#' @docType package
#' @name Rface
#' @import XML
#' @author Matt Malin <\email{email@@mattmalin.co.uk}>
#' @aliases Rface facecom face.com
NULL

# example api call:
# http://api.face.com/faces/detect.json?api_key=083db39e47bd98cb8f6a8737bdb97fc2&api_secret=170298e8e133f775551f2c1de627591f&urls=http://upload.wikimedia.org/wikipedia/en/c/c8/Alan_Turing_photo.jpg&detector=Aggressive&attributes=all&
# using an Alan Turing pictures as a default example.
# TODO: face_detect_url_documentation

face_detect_url <- function(
  urls = "http://upload.wikimedia.org/wikipedia/en/c/c8/Alan_Turing_photo.jpg",
  api_key = "083db39e47bd98cb8f6a8737bdb97fc2",
  api_secret = "170298e8e133f775551f2c1de627591f",
  detector = "Aggressive",
  face_attributes = "all")
{
return(paste(
 "http://api.face.com/faces/detect.json?",
 "api_key=", api_key,
 "&api_secret=", api_secret,
 "&urls=", paste(urls, collapse = ","), 
 "&detector=", detector,
 "&attributes=", face_attributes,
 sep = ""))
}

# e.g. 
# image_face_attributes(c(
#  "http://upload.wikimedia.org/wikipedia/en/c/c8/Alan_Turing_photo.jpg", 
#  "http://upload.wikimedia.org/wikipedia/commons/c/c1/Jerry_Seinfeld_2011_Shankbone.JPG"))

image_face_attributes <- function(
  image_urls = "http://upload.wikimedia.org/wikipedia/en/c/c8/Alan_Turing_photo.jpg",
  api_key = "083db39e47bd98cb8f6a8737bdb97fc2",
  api_secret = "170298e8e133f775551f2c1de627591f",
  detector = "Aggressive",
  face_attributes = "all"
  ) 
{
  # suppressWarnings only because the json call has incomplete line at end, and 
  # readLines complains.
  json_text <- paste(
    suppressWarnings(readLines(
      face_detect_url(
	    urls = image_urls,
	    api_key = api_key,
	    api_secret = api_secret,
	    detector = detector,
	    face_attributes = face_attributes))), 
	collapse = "")
	
  detected_attributes <- fromJSON(json_text)
  message("number_of_photos: ", length(detected_attributes$photos))

  return(detected_attributes)
}
