#import "@preview/polylux:0.4.0": *

#set text(font: "Inter")
#set par(leading: 0.3em)

#show raw: it => text(
  font: "Office Code Pro D",
  weight: 500,
  size: 1.2em,
it)

#set page(
  paper: "presentation-16-9",
  fill: tiling(image("assets/bg.png", width: 900pt))
)

#let box-slide(content) = {
  slide[
    #box(width: 100%)[
      #content
    ]
  ]
}

#let gray=rgb("#48413E")
#let blue=rgb("#0D6893")
#let orange=rgb("#B95738")
#let yellow=rgb("#DE9146")
#let turqoise=rgb("#1FA0A8");
#let green=rgb("#2C7128");

#let b(content) = {box[#text(blue)[#content]]}
#let o(content) = {box[#text(orange)[#content]]}
#let y(content) = {box[#text(yellow)[#content]]}
#let t(content) = {box[#text(turqoise)[#content]]}
#let g(content) = {box[#text(green)[#content]]}
#let x(content) = {box[#text(gray)[#content]]}

#box-slide[
  #pad(top: 8em)[
    #set text(blue, weight: 900, size: 196pt)
    Go 1.23
  ]
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 250, size: 67pt)
  #align(center + top)[
    \@peterhellberg
    #image("assets/gopher-brown-beard.png", height: 308pt)
  ]
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 250, size: 75pt)
  #align(top)[
    “We expect *almost all* Go programs to
    continue to compile and run as before.ˮ
  ]
]

#box-slide[
  #set text(orange, style: "italic", weight: 900, size: 128pt)
  #align(center + top)[Changes to the language]
]

#box-slide[
  #set text(fill: gray, style: "normal", weight: 400, size: 75pt)
  #align(top)[
    Go *1.23* makes the
    #text(orange)[“range-over-funcˮ experiment]
    a part of the language.
  ]
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Changes to the language

  #set text(fill: gray, style: "normal", weight: 200, size: 32pt)
  The *“rangeˮ* clause in a *“for-rangeˮ* loop now
  accepts iterator functions of the following types:

  #set text(fill: blue, font: "Office Code Pro D", weight: 500, size: 32pt)
  func(func() #y[bool])

  func(func(#y[K]) #y[bool])

  func(func(#y[K], #y[V]) #y[bool])
]

#box-slide[
  #set text(turqoise, style: "italic", weight: 900, size: 300pt)
  #align(center)[#pad(top: 40pt)[Tool]]
]

#box-slide[
  #align(top)[
    #set text(fill: gray, style: "italic", weight: 900, size: 146pt)
    Telemetry
    #set text(fill: gray, style: "normal", weight: 400, size: 57pt)
    Go telemetry is an #text(style: "italic")[*opt-in system*],
    controlled by the #o[go telemetry] command.
  ]
]

#box-slide[
  #place(dx: -71pt, dy: -110pt,
    image("assets/Go-Logo_Blue.svg", height: 457pt)
  )
  #place(dx: -44pt, dy: 182pt,
    pad(top: 10pt)[
      #set text(fill: blue, style: "normal", weight: 800, size: 108pt)
      command
    ]
  )
  #place(dx: 468pt, dy: 63pt,
    image("assets/viking-gopher.svg", height: 443pt)
  )
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 300, size: 34pt)
  #set par(leading: 0.7em)
  The new #o[`go env -changed`] flag causes the
  command to print only those settings whose
  effective value differs from the default value
  that would be obtained in an empty
  environment with no prior uses of the #o[`-w`] flag.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 300, size: 34pt)
  #set par(leading: 0.7em)
  The new #o[`go mod tidy -diff`] flag causes
  the command not to modify the files but
  instead print the necessary changes as a
  unified diff.

  #set text(fill: gray, style: "normal", weight: 300, size: 28pt)
  It exits with a *non-zero* code if updates are needed.
]

#box-slide[
  #set text(turqoise, style: "italic", weight: 900, size: 230pt)
  #align(center)[#pad(top: 40pt)[Vet]]
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Vet

  #set text(fill: gray, style: "normal", weight: 300, size: 39pt)
  #set par(leading: 0.7em)
  The #o[`go vet`] subcommand now includes
  the #b[stdversion] analyzer, which flags
  references to symbols that are too new
  for the version of Go in effect in the
  referring file.
]

#box-slide[
  #set text(green, style: "italic", weight: 900, size: 200pt)
  #align(center)[#pad(top: 80pt)[Trace]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Trace

  #set text(fill: gray, style: "normal", weight: 300, size: 29pt)
  #set par(leading: 0.7em)
  The #o[`trace`] tool now better tolerates *partially broken*
  traces by attempting to recover what trace data it
  can. This functionality is particularly helpful when
  viewing a trace that was collected during a program
  crash, since the trace data leading up to the crash
  will now be _recoverable_ under *most* circumstances.
]

#box-slide[
  #place(dx: -53pt, dy: 100pt,
    pad[
      #set text(fill: orange, style: "normal", weight: 900, size: 135pt)
      Runtime
    ]
  )
  #place(dx: 468pt, dy: 63pt,
    image("assets/viking-gopher.svg", height: 443pt)
  )
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Runtime

  #set text(fill: gray, style: "normal", weight: 300, size: 31pt)
  #set par(leading: 0.7em)
  The traceback printed by the runtime after an
  *_unhandled panic_* or *_other fatal error_* now indents
  the second and subsequent lines of the error
  message _(for example, the argument to panic)_ by a
  single tab, so that it can be unambiguously
  distinguished from the stack trace of the first
  goroutine.
]

#box-slide[
  #set text(blue, style: "italic", weight: 900, size: 162pt)
  #align(center)[#pad(top: 100pt)[Compiler]]
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Compiler

  #set text(fill: gray, style: "normal", weight: 200, size:28pt)
  #set par(leading: 0.7em)
  #list(tight: false, marker: [#pad(top: 4pt)[#text(size: 15pt)[#b[●]]]],
    [
      The build time overhead to building with *Profile
      Guided Optimization* has been reduced significantly.
    ],
    [
      The compiler in Go 1.23 can now *overlap* the *stack*
      *frame slots* of local variables accessed in disjoint
      regions of a function, which reduces stack usage for
      Go applications.
    ],
  )
]


#box-slide[
  #set text(green, style: "italic", weight: 900, size: 169pt)
  #align(center)[#pad(top: 90pt)[Linker]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Linker

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 300, size: 22pt)
  The linker now disallows using a `//go:linkname` directive to refer to
  #underline[internal] symbols in the standard library _(including the runtime)_
  that are not marked with `//go:linkname` on their definitions. Similarly,
  the linker disallows references to such symbols from assembly code.

  #pad(top: 20pt)[
    #set text(fill: gray, style: "normal", weight: 300, size: 17pt)
    For backward compatibility, existing usages of `//go:linkname` found in a large open-source
    code corpus remain supported. Any new references to standard library internal symbols will be
    disallowed.
  ]
]

#box-slide[
  #set text(gray, style: "italic", weight: 900, size: 153pt)
  #align(center)[#pad(top: 6pt)[Standard library]]
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  Timer changes

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:25pt)
  #list(tight: false, marker: [#pad(top: 4pt)[#text(size: 15pt)[●]]],
    [
      #b[`Timers`] and #b[`Tickers`] that are no longer referred
      to by the program become eligible for garbage collection
      #underline[immediately], even if their #b[`Stop`]
      methods have not been called
    ],
    [
      The timer channel associated with a #b[`Timer`] or #b[`Ticker`] is now
      *unbuffered*, with capacity *0*.
      #set text(size:21pt)
      _The main effect of this change is that
      Go now guarantees that for any call to a #b[`Reset`] or #b[`Stop`] method, no stale
      values prepared before that call will be sent or received after the call._

      #pad(top: 32pt)[
        #set text(fill: gray, style: "normal", weight: 300, size:11pt)
        These new behaviors are only enabled when the main Go program
        is in a module with a #g[go.mod go] line using Go *1.23.0* or later.
      ]
    ],
  )
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New unique package

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:34pt)
  #list(tight: false, marker: [#pad(top: 7pt)[#text(size: 15pt)[●]]],
    [
      The new #b[`unique`] package provides facilities
      for *canonicalizing* values #v(-22pt)
      #set text(fill: gray, style: "normal", weight: 200, size:28pt)
      _(like “interningˮ or “hash-consingˮ)._
    ],
  )
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  Iterators

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:28pt)
  #list(tight: false, spacing: 47pt, marker: [#pad(top: 5pt)[#text(size: 15pt)[●]]],
    [
      The new #b[`iter`] package provides the basic definitions
      for working with user-defined iterators.
    ],
    [
      The #b[`slices`] package adds several functions that work
      with iterators
    ],
    [
      The #b[`maps`] package adds several functions that work
      with iterators
    ],
  )
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New structs package

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:33pt)
  #list(tight: false, marker: [#pad(top: 7pt)[#text(size: 15pt)[●]]],
    [
      The new #b[`structs`] package provides types
      for struct fields that modify properties of the
      containing struct type such as memory
      layout.

      #set text(fill: gray, style: "normal", weight: 200, size:20pt)
      In this release, the only such type is *HostLayout* which indicates that a
      structure with a field of that type has a layout that conforms to host platform
      expectations.
    ],
  )
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  Minor changes to the library

  #set par(leading: 0.4em)
  #set text(fill: gray, style: "normal", weight: 500, size:52pt)
  As usual, there has been
  *minor* changes to a #underline[number]
  of standard library packages,
  those packages are:
]

#box-slide[
  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 700, size: 33pt)

  #align(center)[
    #y[runtime/pprof] #t[archive/tar] #b[time] #g[path/filepath]
    #o[crypto/x509] #y[runtime/trace] #b[database/sql] #t[net/http/httptest]
    #g[debug/elf] #b[slices] #t[net/http] #b[sync] #t[net/netip] #x[os]
    #y[syscall] #t[net] #g[go/ast] #b[encoding/binary] #o[crypto/tls]
    #b[sync/atomic] #y[reflect] #g[go/types] #y[runtime/debug]
    #x[text/template] #b[math/rand/v2] #g[testing/fstest] #t[unicode/utf8]
  ]
]

#box-slide[
  #set text(green,style: "italic", weight: 900, size: 280pt)
  #align(center)[#pad(top: 66pt)[Ports]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Ports

  #set text(fill: gray, style: "normal", weight: 300, size:17pt)
  #list(tight: false, marker: [#pad(top: 4pt)[#text(size: 16pt)[#g[●]]]],
    [*Darwin*:  Requires macOS 11 Big Sur or later;
                support for previous versions has been discontinued.],

    [*Linux*:   Go 1.24 will require Linux kernel version 3.17 or later,
                with an exception that systems running 3.10 or later will
                continue to be supported if the kernel has been patched
                to support the getrandom system call.],

    [*OpenBSD*: Experimental support for OpenBSD
                on 64-bit RISC-V (`GOOS=openbsd`, `GOARCH=riscv64`)],

    [*ARM64*:   New `GOARM64` environment variable, which specifies the minimum
                target version of the ARM64 architecture at compile time.],

    [*RISC-V*:  New `GORISCV64` environment variable, which selects the
                RISC-V user-mode application profile for which to compile.],

    [*WASM*:    The `go_wasip1_wasm_exec` script in `GOROOT/misc/wasm`
                has dropped support for versions of `wasmtime < 14.0.0`.],
  )
]

#box-slide[
  #set text(blue, style: "normal", weight: 900, size: 129pt)
  #pad(top: 66pt)[
    Learn more
    #set text(fill: gray, style: "normal", weight: 400, size: 39pt)
    Please read the Go 1.23 Release Notes #t[https://go.dev/doc/go1.23]
  ]
]
