#import "@preview/fontawesome:0.6.0": *

// #let primary_colour = rgb("#295340")
#let link_colour = rgb("#111111")
#let primary_colour = rgb("#12348e")
// #let primary_colour = rgb("#38bdf8")

#let icon(name, shift: 1.5pt) = {
  box(
    // baseline: shift,
    // height: 1pt,
    // image("icons/" + name + ".svg")
    fa-icon(name, solid: false)
  )
  h(3pt)
}

#let findMe(services) = {
  set text(8pt)
  let icon = icon.with(shift: 2.5pt)

  services.map(service => {
      icon(service.name)

      if service.link == "" {
        service.link = "#"
      }
      if "display" in service.keys() {
        link(service.link)[#{service.display}]
      } else {
        link(service.link)
      }
    }).join(h(10pt))
  [ ]
}

#let term(period, location) = {
  text(7pt)[#icon("calendar") #period #h(1fr) #icon("location-dot") #location]
}

#let cbox(name) = {
  box(
    // inset: 1pt,
    // outset: 1pt,
    outset: (x: 1pt, y: 1.5pt),
    inset: (x: 1pt, y: 1.0pt),
    clip: true,
    radius: 2pt,
    stroke: 0.2pt + gradient.linear(rgb("#eee"), rgb("#ddd"), angle: 90deg),
    fill: gradient.linear(rgb("#fff"), rgb("#ddd"), angle: 90deg),
  )[
    #text(
      // top-edge: 10pt,
      // font: "Liberation Sans",
      // weight: "medium",
      size: 8pt,
      // baseline: 4pt,
      spacing: 2pt,
    )[
      #name
    ]

    // #highlight(
    //   radius: 1pt,
    //   stroke: none,
    //   fill: none,
    //   // stroke: rgb("#eee"),
    //   // fill: gradient.linear(rgb("#fff"), rgb("#ddd"), angle: 90deg),
    //   extent: 2pt,
    //   text(
    //     // top-edge: 10pt,
    //     // font: "Liberation Sans",
    //     // weight: "medium",
    //     size: 8pt,
    //     // baseline: 4pt,
    //     spacing: 2pt,
    //     name
    //   )
    // )
  ]
    h(2pt)
}


#let max_rating = 50
#let skill(name, rating) = {

  let done = false
  let i = 1
  h(2fr)
  while (not done){
    let colour = rgb("#c0c0c0")
    let strokeColor = rgb("#c0c0c0")
    let radiusValue = (left: 0em, right: 0em)

    if (i <= rating){
      colour = primary_colour
      strokeColor = primary_colour
    }

    // Add rounded corners for the first and last boxes
    if (i == 1) {
      radiusValue = (left: 2em, right: 0em)  
    } else if (i == max_rating) {
      radiusValue = (left: 0em, right: 2em) 
    }

    box(rect(
      height: 0.3em, 
      width: 1.5em, 
      stroke: strokeColor,
      fill: colour,
      radius: radiusValue
    ))

    if (max_rating == i){
      done = true
    }

    i += 1
  }

  [\ ]

}


#let styled-link(dest, content) = text(
    fill: link_colour,
    link(dest, content)
  )

#let vantage(
  name: "",
  position: "",
  links: (),
  tagline: [],
  leftSide,
  rightSide,
  breakSide,
  nextSide,
) = {
  set document(
    title: name + "'s CV",
    author: name,
  )
  set text(9.8pt, font: "Source Sans Pro")
  set page(
    margin: (x: 1.2cm, y: 1.2cm),
  )

  show heading.where(level: 1) : it => text(font: "Liberation Sans", size: 16pt,[#{it.body} #v(10pt)])

  show heading.where(
    level: 2,
  ): it => text(
      font: "Liberation Sans",
      fill: primary_colour,
    [
      #{it.body}
      #v(-7pt)
      #line(length: 100%, stroke: 0.5pt + primary_colour)
    ]
  )

  show heading.where(
    level: 3
  ): it => text(
    font: "Liberation Sans",
    it.body
  )
  
  show heading.where(
    level: 4
  ): it => text(
    font: "Liberation Sans",
    fill: primary_colour,
    it.body
  )

  text(font: "Liberation Sans", size: 18pt, weight: "bold", name)
  v(-5pt)
  text(font: "Liberation Sans", size: 15pt, weight: "medium",[#position])
  v(2pt)
  findMe(links)
  v(0pt)
  // pad(
  //   left: 10pt,
  //   right: 10pt,
  //   text(size: 9pt, tagline)
  // )
  v(-5pt)
  pad(
    left: 10pt,
    right: 10pt,
    text(
      size: 9pt,
      // join all tagline items with a separator
      tagline.map(t => t).join(" ")
    )
  )


  v(4pt)

  grid(
    columns: (7fr, 4fr),
    column-gutter: 2em,
    leftSide,
    rightSide,
  )
  v(2pt)

  // grid(
  //   columns: 1,
  //   column-gutter: 1em,
  //   nextside,
  // )

  breakSide
  v(2pt)
  pad(
    left: 10pt,
    right: 10pt,
    nextSide
  )

}
