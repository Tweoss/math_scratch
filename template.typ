#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 10.00002pt
#let large-size = 11.74988pt

// This function gets your whole document as its `body` and formats
#let homework(
  class: none,
  // The article's title.
  number: 0,

  // An array of authors. For each author you can specify a name,
  // department, organization, location, and email. Everything but
  // but the name is optional.
  name: "Francis Chua",
  
  // The article's paper size. Also affects the margins.
  paper-size: "us-letter",


  // the current day
  date: none,
  
  // The document's content.
  body,
) = {
  let title = class + " Homework " + str(number)
  if date == none {
    date = strong(text(red, "NO DATE"))
  }

  // Set document metdata.
  set document(title: title, author: name)

  // Set the body font. AMS uses the LaTeX font.
  set text(size: normal-size, font: "New Computer Modern")

  // Configure the page.
  set page(
    paper: paper-size,
    // The margins depend on the paper size.
    margin: if paper-size != "a4-paper" {
      (
        top: (116pt / 279mm) * 100%,
        left: (126pt / 216mm) * 100%,
        right: (128pt / 216mm) * 100%,
        bottom: (94pt / 279mm) * 100%,
      )
    } else {
      (
        top: 117pt,
        left: 118pt,
        right: 119pt,
        bottom: 96pt,
      )
    },

    // The page header should show the page number and list of
    // authors, except on the first page. The page number is on
    // the left for even pages and on the right for odd pages.
    header-ascent: 14pt,
    header: locate(loc => {
      let i = counter(page).at(loc).first()
      if i == 1 { return }
      set text(size: script-size)
      grid(
        columns: (6em, 1fr, 6em),
        if calc.even(i) [#i],
        align(center, upper(
          if calc.odd(i) { title } else { name }
        )),
        if calc.odd(i) { align(right)[#i] }
      )
    }),

    // On the first page, the footer should contain the page number.
    footer-descent: 12pt,
    footer: locate(loc => {
      let i = counter(page).at(loc).first()
      if i == 1 {
        align(center, text(size: script-size, [#i]))
      }
    })
  )
  
  // Configure lists and links.
  set list(indent: 24pt, body-indent: 5pt)
  set enum(indent: 24pt, body-indent: 5pt)
  show link: set text(font: "New Computer Modern Mono")

  // Configure equations.
  show math.equation: set block(below: 8pt, above: 9pt)
  show math.equation: set text(weight: 400)

  show figure: it => {
    show: pad.with(x: 23pt)
    set align(center)

    v(12.5pt, weak: true)

    // Display the figure's body.
    it.body

    // Display the figure's caption.
    if it.has("caption") {
      // Gap defaults to 17pt.
      v(if it.has("gap") { it.gap } else { 17pt }, weak: true)
      smallcaps[Figure]
      if it.numbering != none {
        [ #counter(figure).display(it.numbering)]
      }
      [. ]
      it.caption
    }

    v(15pt, weak: true)
  }

  // Display the title and author. 
  v(35pt, weak: true)
  align(center, {
    upper(text(size: large-size, weight: 700, title))
    v(15pt, weak: true)
    text(size: normal-size, weight: 500, name)
    v(10pt, weak: true)
    text(size: small-size, date)
  })

  // Configure paragraph properties.
  set par(first-line-indent: 1.2em, justify: true, leading: 0.58em)
  show par: set block(spacing: 0.58em)
  
  // Display the article's contents.
  v(29pt, weak: true)
  body
}

#let problem_counter = counter("problem")

#let problem(body, number: none, format: "a.a)") = locate(location => {
  problem_counter.step()
  if number != none {
    problem_counter.update(number + 1)
  }
  show: block.with(spacing: 11.5pt)
  
  // Problem #
  {
    set text(size: 1.4em, weight: 800)
    v(11pt, weak: true)
    [Problem #problem_counter.display()]
  }
  {
    // body inside a block
    set enum(numbering: format, indent: 0pt)
    block(width: 100%, fill: rgb("#cccccc"), stroke: black, inset: 10pt, radius: 2pt)[#body]  
  }
})

#let solution(body, level: 1, format: "1.a") = locate(location => {
  // Only display Solution # for more nested solutions
  if level != 1 {
    problem_counter.step(level: level)
    let top_number = problem_counter.at(location).first()

    // Heading
    {
      set text(size: 1.2em, weight: 800)
      set par(first-line-indent: 0pt)
      emph([Solution #problem_counter.display((..nums) => numbering(format, ..nums))])
    }
    linebreak()
  }
  
  [#body]
  // should go to next page for a one part solution that is not the last one
  if level == 1 {
    if problem_counter.at(location) != problem_counter.final(location) {
      pagebreak(weak: true)
    }
  } else {
    linebreak()
  }
})

#let sq(a) = [$#a^2$]