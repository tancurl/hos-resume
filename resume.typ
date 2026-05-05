#import "vantage.typ": vantage, term, skill, cbox, styled-link
#let configuration = yaml("resume.yml")
#let contacts = configuration.contacts

#vantage(
  name: configuration.contacts.name,
  position: configuration.position,
  links: (
    // (name: "location-dot", link: "", display: contacts.address),
    // (name: "globe", link: contacts.links.at(4).url, display: contacts.links.at(4).text), // Blog
    // (name: "envelope", link: "mailto:" + contacts.email),
    // (name: "mobile-screen", link: "", display: contacts.phone),
    // (name: "github", link: contacts.links.at(2).url, display: contacts.links.at(2).text), // Github
    // (name: "gitlab", link: contacts.links.at(1).url, display: contacts.links.at(1).text), // Gitlab
    // (name: "linkedin", link: contacts.links.at(0).url, display: contacts.links.at(0).text) // LinkedIn
  ),
  tagline: (configuration.tagline),
  [
    == Experience
    #pad(
      left: 4pt,
      right: 4pt,
      for job in configuration.jobs [

        === #job.position \
        #if job.company.link == "" {
          text(size: 8pt)[
            #job.company.name - #styled-link(job.product.link)[
              #text(size: 7pt, job.product.name)
            ]
          ]
        } else {
          link(job.company.link)[
            #text(size: 8pt, job.company.name) - #styled-link(job.product.link)[
              #text(size: 7pt, job.product.name)
            ]
          ]
        } \
        #term[#job.from --- #job.to][#job.location]

        #for point in job.description [
          #text(size: 8pt, list.item(point))
        ]
        #v(6pt)
      ]
    )
    #v(5pt)
    
  ],
  [
    // == Objective
    //
    // #configuration.objective

    // == Technical Expertise
    //
    // #for item in configuration.technical_expertise [
    //   #skill(item.name, item.level)
    // ]

    == Skills
    #pad(
      left: 4pt,
      right: 4pt,
      for item in configuration.skills [
        #cbox(item)
      ]
    )
    #v(8pt)

    == Skills
    #pad(
      left: 4pt,
      right: 4pt,
      for item in configuration.skills [
        #cbox(item)
      ]
    )
    #v(8pt)

    == Tools
    #pad(
      left: 4pt,
      right: 4pt,
      for item in configuration.tools [
        #cbox(item)
      ]
    )
    #v(8pt)

    == Programming
    #pad(
      left: 4pt,
      right: 4pt,
      for item in configuration.programming [
        #cbox(item)
      ]
    )
    #v(8pt)

    == Languages
    #pad(
      left: 4pt,
      right: 4pt,
      for item in configuration.languages [
        #cbox(item)
        // #text(size: 9pt, list.item(item))
      ]
    )
    #v(8pt)

    == Certifications
    #pad(
      left: 4pt,
      right: 4pt,
      for achievement in configuration.achievements [
        === #text(size: 9pt, achievement.name)
        #h(2fr)
        #text(size: 8pt, achievement.description)

      ]
    )
    #v(8pt)

    == Education

    #pad(
      left: 4pt,
      right: 4pt,
      for edu in configuration.education [
        // === #if edu.place.link != "" [
        //   #link(edu.place.link)[#edu.place.name]\
        // ] else [
        //   #edu.place.name\
        // ]
        // #edu.from - #edu.to #h(1fr) #edu.location
        // #edu.degree in #edu.major

        === #edu.degree in #edu.major

        #edu.from - #edu.to #h(1fr) #edu.location #edu.place.name

      ]
    )

  ],
  [
    == Projects
  ],
  [
    #for item in configuration.projects [
      === #item.name
      #h(2fr)
      #link(item.url, text(size: 9pt, item.text))

      #for point in item.description [
        // #text(size: 9pt, pad(left: 10pt, right: 10pt, point))
        #pad(left: 10pt, right: 10pt, text(size: 9pt, list.item(point)))
      ]
      #v(10pt)
    ]
  ]
)
