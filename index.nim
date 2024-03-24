import std / [strutils, algorithm, strformat]
import nimiSlides, nimib

nbInit(theme = revealTheme)

template nimConfTheme*() =
  setSlidesTheme(Black)
  let nimYellow = "#FFE953"
  nb.addStyle: """
:root {
  --r-background-color: #181922;
  --r-heading-color: $1;
  --r-link-color: $1;
  --r-main-font-size: 37px;
}
.reveal ul, .reveal ol {
  display: block;
  text-align: left;
}
li::marker {
  color: $1;
  content: "»";
}
li {
  padding-left: 12px;
}

.link-button {
  text-decoration: none;
  font-weight: bold;
  letter-spacing: 1px;
  color: $1;
  background-color: #181922;
  padding: 15px 50px;
  border-radius: 5px;
  border: 1px solid $1
}
""" % [nimYellow]

nimConfTheme()

slide(slideOptions(autoAnimate=true)):
  bigText: "Beräkningsvetenskap"
  fitImage: "handSlam.jpg"
  nbText: hlMd"""
Hugo Granström

Systemutvecklare - Sensebit  
"""

slide:
  slide:
    fitImage("https://sensebit.se/wp-content/uploads/logo_webb.png")
  slide:
    nbText: "## Trafikanalys med magnetism"
    fitImage("https://sensebit.se/wp-content/uploads/FLEX-large.png")
  slide:
    nbText: "## Trafikanalys med kamera"
    fitImage("https://sensebit.se/wp-content/uploads/vision_produt_photo.png")

  slide:
    nbText: "## Teknologi & Verktyg"
    columns:
      column:
        fragment(fadeInThenSemiOut):
          nbImage("https://git-scm.com/images/logos/downloads/Git-Icon-1788C.svg")
      column:
        fragment(fadeInThenSemiOut):
          nbImage("https://s3.dualstack.us-east-2.amazonaws.com/pythondotorg-assets/media/files/python-logo-only.svg")
      column:
        fragment(fadeInThenSemiOut):
          nbRawHtml: """<figure><img style="height: 18vh;" src="https://upload.wikimedia.org/wikipedia/commons/1/18/C_Programming_Language.svg"/></figure>"""
    columns:
      column:
        fragment(fadeInThenSemiOut):
          nbImage("docker-logo-blue.svg")
      column:
        fragment(fadeInThenSemiOut):
          nbImage("https://kubernetes.io/images/nav_logo.svg")
  # Jobbeskrivning
  # Logos för språk och verktyg? Ja!
  # Animera in dom en och en? Ja!
  discard
# 1RT720, 1MD042, 1MD041
let courses = [
  ("Högprestandaprogrammering", 1, 1),
  ("Databasteknik I", 1, 2),
  ("Informationsutvinning I", 0, 0),
  ("Avancerad probabilistisk maskininlärning", 0, 0),
  ("Tillämpad djupinlärning i fysik", 1, 0),
  ("Djup maskininlärning för bildanalys", 1, 4),
  ("Förstärkningsinlärning", 0, 5),
  ("Parallell och distribuerad programmering", 0, 0),
  ("Beräkningsfysik", 0, 0),
  ("Tillämpade finita elementmetoder", -1, 0),
  ("Datoriserad bildanalys I", 1, 3),
  ("Optimeringsmetoder", 0, 0),
  ("Halvledarelektronik", -1, 0),
  ("Programmeringsteknik II", 1, 0),
  ("Industriell projektledning", -1, 0)
].sortedByIt((it[1], -it[2])).reversed()

let colorTable = {
  -1: "red",
  0: "white",
  1: "green",
}.toTable

var uncoloredList = ""
var coloredList = ""
var censoredList = ""
var recommendedList = ""
var groupedCensored: array[-1..1, string]
for (c, i, rec) in courses:
  uncoloredList &= &"- {c}\n"
  let color = colorTable[i]
  coloredList &= &"- <span style=\"color: {color}\">{c}</span>\n"
  censoredList &= &"- <span style=\"color: {color}\">■■■■■■■■■■■■</span>\n"
  groupedCensored[i] &= &"- <span style=\"color: {color}\">■■■</span>\n"
  if rec > 0:
    recommendedList &= &"- {c}\n"

slide:
  slide:
    nbText: "## Kurser"
  #slide:
  #  nbText: uncoloredList
  slide:
    nbText: coloredList
  slide:
    nbText: censoredList
  slide:
    columns:
      for l in groupedCensored.reversed():
        column:
          nbText: l

slide:
  slide:
    nbText: "# Tips"
  slide:
    nbText: hlMd"""
## Kurstips
"""
    nbText: recommendedList
  slide:
    fitImage("road12.jpg")
  slide:
    nbText: "Engagera dig"

slide:
  nbText: hlMd"""
Lycka till med era studier!
"""
  fitImage("spiderPointing.jpg")


nbSave