The SVGStar.hs file generates descriptions of starts in Scalar Vector Graphic (SVG) format. The function showStar is used to calculate the descriptions for the SVG format. The writeStar function can be called to show the SVG stars in HTML. A Tests.hs file is provided




The inputs to the showStar function consist of the following:
- tx: amount along the x-axis to translate the star, where the top left corner of a page is
coordinate (0,0).
- ty: amount in the y-axis to translate the star.
- r: the radius of the star (distance from the center to each point of the star)
- sep: the “separation” (my term, not sure if there is a standard one), which controls how thick the points of the star are
- n: the number of points of the star
