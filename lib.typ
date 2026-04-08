#import "@preview/touying:0.6.1": *
#import "@preview/touying:0.6.1" as touyingpkg
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/gentle-clues:1.3.0": *
#import "@preview/lovelace:0.3.0": *
#import "@preview/pinit:0.2.2": *
#import "@preview/cuti:0.4.0": show-cn-fakebold, show-cn-fakeitalic

#let sdu-content-top-gap = 1.5em

#let _get-last-heading-label(current-headings) = {
  if current-headings != () and current-headings.at(-1).has("label") {
    str(current-headings.at(-1).label)
  }
}

#let _display-page-heading(self) = {
  let last-heading-label = _get-last-heading-label(self.headings)
  touyingpkg.utils.display-current-heading(
    depth: if last-heading-label == "touying:hidden" { self.slide-level - 1 } else { self.slide-level },
    style: none,
  )
}

#let _sdu-background(self) = align(
  left + bottom,
  image(
    "image/sdu_bg.png",
    width: if self.show-notes-on-second-screen == right { 50% } else { 100% },
  ),
)

#let sdu-header(self) = {
  set align(top)
  grid(
    inset: (top: 0.85em, x: 1.7em),
    rows: (auto, auto),
    row-gutter: -0.25em,
    grid(
      columns: (1fr, auto),
      column-gutter: 1.2em,
      align(left + horizon, text(
        size: 1.18em,
        weight: "bold",
        fill: self.colors.neutral-darkest,
        _display-page-heading(self),
      )),
      align(right + horizon, image("image/sdu_around_logo.jpg", height: 2.52cm)),
    ),
    align(left, line(length: 100%, stroke: (paint: self.colors.primary, thickness: 1.05pt))),
  )
}

#let sdu-footer(self) = {
  set align(bottom)
  set text(size: 0.72em, fill: self.colors.neutral-dark.lighten(30%))
  show: pad.with(x: 0.8em, bottom: 0.45em)
  align(right, context touyingpkg.utils.slide-counter.display() + " / " + touyingpkg.utils.last-slide-number)
}

#let slide(
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  let self = touyingpkg.utils.merge-dicts(
    self,
    config-page(header: sdu-header, footer: sdu-footer, margin: (top: 4.4em, bottom: 2.1em, left: 1.72cm, right: 1.45cm)),
  )
  touying-slide(
    self: self,
    config: config,
    repeat: repeat,
    setting: body => {
      set page(background: _sdu-background(self))
      pad(top: sdu-content-top-gap, setting(body))
    },
    composer: composer,
    ..bodies,
  )
})

#let title-slide(
  config: (:),
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  self = touyingpkg.utils.merge-dicts(
    self,
    config,
    config-common(freeze-slide-counter: true),
    config-page(margin: (top: 1.2cm, bottom: 1.2cm, x: 1.6cm)),
  )
  let info = self.info + args.named()
  let body = {
    set page(background: _sdu-background(self))
    place(top + right, dx: -0.2cm, dy: 0.15cm, image("image/sdu_around_logo.jpg", height: 2.6cm))
    set align(center + horizon)
    block(width: 130%, height: 100%, {
      v(0.9fr)
      block(
        width: 63%,
        inset: (x: 1.2cm, y: 0.95cm),
        fill: rgb("#6E1A1A"),
        radius: 8pt,
        text(
          size: if info.subtitle == none { 2.05em } else { 1.78em },
          fill: self.colors.neutral-lightest,
          weight: "bold",
          info.title,
        )
          + (
            if info.subtitle != none {
              linebreak()
              v(0.25em)
              text(size: 1.02em, fill: self.colors.neutral-lightest, info.subtitle)
            }
          ),
      )
      v(0.65cm)
      set text(size: 1.12em, fill: self.colors.neutral-darkest)
      if info.author != none {
        block(spacing: 0.5em, info.author)
      }
      if info.institution != none {
        block(spacing: 1.2em, info.institution)
      }
      if info.date != none {
        block(spacing: 1.2em, touyingpkg.utils.display-info-date(self))
      }
      if extra != none {
        block(spacing: 0.6em, extra)
      }
      v(1fr)
    })
  }
  touying-slide(self: self, body)
})

#let outline-slide(config: (:), title: [目录], ..args) = touying-slide-wrapper(self => {
  self = touyingpkg.utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(margin: (top: 2.4cm, bottom: 1.1cm, left: 1.2cm, right: 1.45cm), footer: sdu-footer),
  )
  let body = {
    set page(background: [
      #place(
        top + left,
        block(
          width: 4.2cm,
          height: 100%,
          fill: rgb("#C91F25"),
          radius: 8pt,
          inset: 0pt,
          clip: true,
          [
            #place(center + horizon, dx: 0.28cm, image("image/sdu_slide_logo_trans.svg", width: 2.55cm, height: 94%))
          ],
        ),
      )
    ])
    grid(
    columns: (2.55cm, 0.75cm, 1fr),
    column-gutter: 8pt,
    [],
    [],
    block(
      width: 100%,
      [
        #v(3.45em)
        #set text(fill: self.colors.neutral-darkest, size: 1.12em)
        #set par(leading: 2.18em)
        #show outline.entry.where(level: 1): set block(above: 0.42em, below: 0.84em)
        #show outline.entry.where(level: 2): set block(above: 0.14em, below: 0.58em)
        #columns(1)[
          #outline(
            title: none,
            depth: self.slide-level,
            indent: 0.75em,
            ..args,
          )
        ]
      ],
    ),
    )
  }
  touying-slide(self: self, config: config, body)
})

#let new-section-slide(config: (:), body) = touying-slide-wrapper(self => {
  self = touyingpkg.utils.merge-dicts(
    self,
    config-page(margin: (top: 1.1cm, bottom: 1.1cm, x: 1.6cm)),
  )
  let body = {
    set page(background: _sdu-background(self))
    set align(left + horizon)
    block(width: 100%, height: 100%, {
      v(0.95fr)
      text(size: 1.45em, weight: "bold", fill: self.colors.neutral-darkest, _display-page-heading(self))
      v(0.28cm)
      line(length: 100%, stroke: (paint: self.colors.primary, thickness: 2pt))
      v(1fr)
    })
  }
  touying-slide(self: self, config: config, body)
})

#let end-slide(config: (:), body: auto) = touying-slide-wrapper(self => {
  self = touyingpkg.utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true, new-section-slide-fn: none),
    config-page(margin: (top: 1.4cm, bottom: 1.4cm, x: 1.6cm)),
  )
  let final-body = if body == auto {
    [
      #set align(center + horizon)
      #set text(fill: self.colors.primary)
      #text(size: 2.45em, weight: "bold")[感谢聆听]
      #linebreak()
      #v(0.25em)
      #text(font: "Libertinus Serif", size: 1.89em)[Thanks for Listening]
    ]
  } else {
    body
  }
  let layout = {
    set page(background: _sdu-background(self))
    block(
      width: 75%,
      grid(
        columns: (42%, 1fr),
        column-gutter: 1.42cm,
        align(center + horizon, image("image/sdu_ud_logo.png", width: 122%)),
        align(center + horizon, block(width: 100%, align(center + horizon, final-body))),
      ),
    )
  }
  touying-slide(self: self, config: config, align(center + horizon, layout))
})

#let sdu-theme(
  aspect-ratio: "16-9",
  font: ("Libertinus Serif", "KaiTi"),
  footer-right: context touyingpkg.utils.slide-counter.display() + " / " + touyingpkg.utils.last-slide-number,
  primary: rgb("#8C1D1D"),
  ..args,
  body,
) = {
  set text(size: 18pt)
  set par(justify: true, leading: 1.2em)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (top: 4.1em, bottom: 2.1em, x: 1.45cm),
      header-ascent: 1.2em,
      footer-descent: 0em,
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      init: (self: none, body) => {
        set text(font: font)
        show: codly-init.with()
        show: show-cn-fakebold
        show: show-cn-fakeitalic
        show heading: set text(self.colors.primary)
        codly(languages: codly-languages)
        body
      },
      alert: touyingpkg.utils.alert-with-primary-color,
    ),
    config-colors(
      neutral-darkest: rgb("#1F1F1F"),
      neutral-dark: rgb("#555555"),
      neutral-light: rgb("#F6F4F2"),
      neutral-lightest: rgb("#FFFFFF"),
      primary: primary,
    ),
    config-store(
      footer-right: footer-right,
    ),
    ..args,
  )

  body
}
