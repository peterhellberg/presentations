#import "@preview/polylux:0.4.0": *

#set text(font: "Inter")
#set par(leading: 0.3em)
#set raw(theme: "assets/themes/Bean.tmTheme")

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
    Go 1.25
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
  #set text(fill: gray, style: "italic", weight: 200, size: 65pt)
  #align(top)[
    There are #underline[no] language changes that affect Go programs in *Go 1.25*. 
  ]

  #set text(fill: gray, style: "italic", weight: 200, size: 32pt)
  #align(top)[
    However, in the language specification the notion of core types has been removed in favor of dedicated prose.
  ]
]

#box-slide[
  #set text(turqoise, style: "italic", weight: 900, size: 300pt)
  #align(center)[#pad(top: 40pt)[Tools]]
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

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The #o[`go build -asan`] option now defaults to doing leak detection at program exit. 

  #set text(fill: gray, style: "italic", weight: 300, size: 30pt)
  This will report an error if memory allocated by *C* is not freed and is not referenced by any other memory allocated by either C or Go.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The Go distribution will include #underline[fewer] prebuilt tool binaries.

  #set text(fill: gray, style: "italic", weight: 300, size: 30pt)
  Core toolchain binaries such as the compiler and linker will still be included, 
  but tools not invoked by *build* or *test* operations will be built and run by #o[`go tool`] as needed.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The new `go.mod` *ignore* directive can be used to specify directories the go command should ignore.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  Files in these directories and their subdirectories will be ignored by 
  the go command when matching package patterns, such as all or #o[`./...`], 
  but will still be included in module zip files.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The new #o[`go doc -http`] option will start a documentation server 
  showing documentation for the requested object, 
  and open the documentation in a browser window.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The new #o[`go version -m -json`] option will print the *JSON* encodings 
  of the `runtime/debug.BuildInfo` structures embedded in the given Go #underline[binary] files.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The #o[`go`] command now supports using a #underline[subdirectory]
  of a repository as the path for a module root
  
  #set text(fill: gray, style: "italic", weight: 300, size: 22pt)
  when resolving a module path using the syntax 
  `<meta name="go-import" content="root-path vcs repo-url subdir">` 
  to indicate that the root-path corresponds to the subdir 
  of the repo-url with version control system vcs.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The new `work` package *pattern* matches #underline[all] 
  packages in the work _(formerly called `main`)_ modules: 

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  - either the single work module in module mode 
  - #underline[or] the set of workspace modules in workspace mode
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  When the #o[`go`] command updates the *`go`* line in a `go.mod` or `go.work` file, 
  it no longer adds a *`toolchain`* line specifying the command’s current version.
]

#box-slide[
  #set text(turqoise, style: "italic", weight: 900, size: 230pt)
  #align(center)[#pad(top: 40pt)[Vet]]
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Vet

  #set text(fill: gray, style: "normal", weight: 400, size: 30pt)
  #set par(leading: 0.7em)
  The #o[`go vet`] command includes #underline[new] analyzers:
  
  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  - #t[*waitgroup*]
    #set text(fill: gray, style: "italic", weight: 300, size: 24pt)
    - Reports misplaced calls to `sync.WaitGroup.Add`

  - #t[*hostport*]
    #set text(fill: gray, style: "italic", weight: 300, size: 24pt)
    - Reports uses of `fmt.Sprintf("%s:%d", host, port)` 
      to construct addresses for `net.Dial`, as these will not work with IPv6; 
      instead it suggests using `net.JoinHostPort`.
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
  Container-aware GOMAXPROCS

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The default behavior of the `GOMAXPROCS` has changed. 
  
  #set text(fill: gray, style: "normal", weight: 300, size: 24pt)
  In prior versions of *Go*, `GOMAXPROCS` defaults to the 
  #underline[number of logical CPUs] available at startup (`runtime.NumCPU`).

  #set text(fill: gray, style: "normal", weight: 300, size: 20pt)
  1. On Linux, the runtime considers the CPU bandwidth limit of the cgroup containing the process, #underline[if any]. 

  2. On all OSes, the runtime periodically #underline[updates] `GOMAXPROCS` if the number of logical CPUs available or the cgroup CPU bandwidth limit change.
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  New experimental garbage collector  

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  A new garbage collector is now available as an *experiment*.

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  The new garbage collector may be enabled by setting 
  #o[`GOEXPERIMENT=greenteagc`] at #underline[build time].
  We expect the design to continue to evolve and improve.
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Trace flight recorder

  #set text(fill: gray, style: "normal", weight: 400, size: 32pt)
  #set par(leading: 0.7em)
  Runtime execution traces have long provided a powerful, 
  but *expensive* way to understand and debug the low-level behavior of an application.
  
  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  The new `runtime/trace.FlightRecorder` API provides a lightweight way to capture 
  a runtime execution trace by continuously recording the trace into an #underline[in-memory] ring buffer.
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Change to unhandled panic output

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The message printed when a program exits due to an 
  *unhandled* panic that was recovered and repanicked 
  #underline[no longer] repeats the text of the panic value.
]

#box-slide[
  #set text(blue, style: "italic", weight: 900, size: 162pt)
  #align(center)[#pad(top: 100pt)[Compiler]]
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  nil pointer bug

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  This release fixes a compiler bug, introduced in *Go 1.21*, 
  that could incorrectly #underline[delay] nil pointer checks.

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  The following program is #underline[incorrect] because it uses 
  the result of `os.Open` before checking the error.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  nil pointer bug

  #set text(fill: gray, style: "normal", size:24pt)
  #set par(leading: 0.6em)
  ```go
  package main
  
  import "os"

  func main() {
      f, err := os.Open("nonExistentFile")
      name := f.Name()
      if err != nil {
          return
      }
      println(name)
    }
  ```
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  DWARF5 support

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  The compiler and linker in *Go 1.25* now generate 
  #underline[debug information] using *DWARF version 5*.

  #set text(fill: gray, style: "normal", weight: 300, size: 24pt)
  The newer DWARF version reduces the space required for debugging information 
  in Go binaries, and reduces the time for linking, especially for large Go binaries. 

  #set text(fill: gray, style: "normal", weight: 300, size: 16pt)
  Can be disabled by setting the environment variable 
  #o[`GOEXPERIMENT=nodwarf5`] at #underline[build time].
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Faster slices

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  The compiler can now allocate the backing store for slices 
  #underline[on the stack] in more situations, 
  which *improves* performance.

  #set text(fill: gray, style: "normal", weight: 300, size: 24pt)
  This change has the _potential_ to amplify the effects of 
  incorrect `unsafe.Pointer` usage.
]

#box-slide[
  #set text(green, style: "italic", weight: 900, size: 169pt)
  #align(center)[#pad(top: 90pt)[Linker]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Linker

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The linker now accepts a #o[`-funcalign=N`] command line option, 
  which specifies the alignment of function entries.

  #set text(fill: gray, style: "normal", weight: 300, size: 28pt)
  The #underline[default value] is platform-dependent, and is *unchanged* in this release.
]

#box-slide[
  #set text(gray, style: "italic", weight: 900, size: 153pt)
  #align(center)[#pad(top: 6pt)[Standard library]]
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New testing/synctest package 

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  The new `testing/synctest` package provides support for testing concurrent code:

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  - `Test` function runs a test function in an isolated #g[“bubble”]. 
    - Within the bubble, `time` is virtualized.

  - `Wait` function waits for #underline[all] goroutines in the current bubble to block.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New experimental encoding/json/v2 package

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  *Go 1.25* includes a new, *experimental* JSON implementation, 
  which can be enabled by setting the environment variable 
  #o[`GOEXPERIMENT=jsonv2`] at #underline[build time].
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New experimental encoding/json/v2 package

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  When enabled, two new packages are available:

  #set text(fill: gray, style: "normal", weight: 300, size: 28pt)
  - `encoding/json/v2`
    - A major revision of the `encoding/json` package.

  - `encoding/json/jsontext`
    - Provides lower-level processing of JSON syntax.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New experimental encoding/json/v2 package

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  In addition, when the #g[“jsonv2”] #o[`GOEXPERIMENT`] is enabled:

  #set text(fill: gray, style: "normal", weight: 300, size: 28pt)
  #set par(leading: 0.5em)
  - `encoding/json` 
    #set text(fill: gray, style: "normal", weight: 300, size: 24pt)
    - uses the #underline[new] JSON implementation.

      #set text(fill: gray, style: "italic", weight: 300, size: 18pt)
      Marshaling and unmarshaling behavior is unaffected, but the text 
      of errors returned by package function may change.

    - contains a number of new options which may be 
      used to configure the *marshaler* and *unmarshaler*.
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
  #set text(fill: gray, style: "normal", weight: 700, size: 29pt)

  #align(center)[
    #y[archive/tar] #t[encoding/asn1] #b[crypto] #g[crypto/ecdsa]
    #o[crypto/ed25519] #y[crypto/elliptic] #b[crypto/rsa] #t[crypto/sha1]
    #g[crypto/sha3] #b[crypto/tls] #t[crypto/x509]
    #b[debug/elf] #t[go/ast] #x[go/parser] #y[go/token]
    #t[go/types] #g[hash] #b[hash/maphash] #o[io/fs]
    #b[log/slog] #y[mime/multipart] #g[net] #y[net/http]
    #x[os] #b[reflect] #g[regexp/syntax] #t[runtime] #y[runtime/pprof]
    #t[sync] #b[testing] #g[testing/fstest] #o[unicode] #y[unique]
  ]
]

#box-slide[
  #set text(green,style: "italic", weight: 900, size: 280pt)
  #align(center)[#pad(top: 66pt)[Ports]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Ports

  #set par(leading: 0.9em)
  #set text(fill: gray, style: "normal", weight: 300, size: 18pt)
  #list(tight: false, marker: [#pad(top: 4pt)[#text(size: 10pt)[#g[●]]]],
    [*Darwin*:   Go 1.25 #underline[requires] macOS 12 Monterey or later.],
    [*Windows*:  Go 1.25 is the last release that contains 
                  the #underline[broken] 32-bit windows/arm port 
                  (`GOOS=windows GOARCH=arm`).],
    [*Loong64*:  Now supports: 
      - The race detector
      - Gathering traceback information from C code using `runtime.SetCgoTraceback` 
      - Linking CGo programs with the internal link mode
    ],
    [*RISC-V*: Now supports the `plugin` build mode.],
  )
]

#box-slide[
  #set text(blue, style: "normal", weight: 900, size: 129pt)
  #pad(top: 66pt)[
    Learn more
    #set text(fill: gray, style: "normal", weight: 400, size: 39pt)
    Please read the Go 1.25 Release Notes #t[https://go.dev/doc/go1.25]
  ]
]
