# Rface

Facial recognition using the face.com API.
  
example usage: 
```r
example_face <- image_face_attributes("http://upload.wikimedia.org/wikipedia/en/c/c8/Alan_Turing_photo.jpg")

example_face$photos[[1]]$tags[[1]]$attributes
```
