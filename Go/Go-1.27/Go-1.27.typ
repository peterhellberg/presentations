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
    Go 1.27
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
  #set text(fill: gray, style: "italic", weight: 600, size: 34pt)
  #align(center + horizon)[
    #pad(top: 40pt)[
      Not yet released — expected *August 2026*.

      #set text(fill: gray, style: "italic", weight: 300, size: 30pt)
      These slides are based on the #underline[draft] release notes.
    ]
  ]
]

#box-slide[
  #set text(turqoise, style: "italic", weight: 900, size: 155pt)
  #align(center)[#pad(top: 100pt)[Language]]
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Generic methods

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  Method declarations may now declare their #underline[own] type parameters,
  adding *generic functions* within the namespace of a particular type.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  Methods of #underline[interfaces] may not declare type parameters.
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Generic methods

  #set text(fill: gray, style: "normal", size: 18pt)
  #set par(leading: 0.6em)
  ```go
  type Tree[T any] struct {
      value       T
      left, right *Tree[T]
  }

  func (t *Tree[T]) Map[U any](f func(T) U) *Tree[U] {
      if t == nil {
          return nil
      }
      return &Tree[U]{f(t.value), t.left.Map(f), t.right.Map(f)}
  }
  ```
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Struct literal keys

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  A key in a struct literal may now be any *valid field selector*
  for the struct type.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  Previously, keys were limited to #underline[top-level] field names only.
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Struct literal keys

  #set text(fill: gray, style: "normal", size: 22pt)
  #set par(leading: 0.6em)
  ```go
  type Base struct{ ID int }

  type User struct {
      Base
      Name string
  }

  u := User{
      ID:   1, // promoted field — previously not allowed
      Name: "Go",
  }
  ```
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Function type inference

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  Function type inference has been *generalized* to apply in #underline[all]
  contexts where a generic function is assigned to, or converted to,
  a matching function type.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  Fewer explicit type arguments are needed when wiring up generic functions.
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
  go fix

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  #o[`go fix`] gains new *modernizers*: `atomictypes`, `embedlit`,
  `slicesbackward`, and `unsafefuncs`.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  The `fmtappendf` analyzer was #underline[removed] _(stylistic concerns)_,
  and `waitgroup` was renamed to `waitgroupgo`.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  go doc

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  #o[`go doc`] now supports the #underline[`package@version`] syntax, e.g.
  #o[`go doc example.com/pkg@v1.2.3`].

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  The new #o[`-ex`] option lists executable *examples* of a package
  or symbol; naming one prints its source code with comments.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  go mod tidy

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  For modules with #underline[`go 1.27`] or later, #o[`go mod tidy`] now
  automatically *merges* duplicate require blocks.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  It ensures at most two blocks — one for *direct* and one for
  *indirect* dependencies — preserving existing comment blocks.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  go test

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  #o[`go test`] now runs the #o[`stdversion`] vet check by default,
  reporting use of standard library symbols that are #underline[too new]
  for the Go version in force.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  #o[`go test -json`] annotates `"output"` lines with an optional
  `"OutputType"` field _("error", "error-continue", "frame")_.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Tooling changes

  #set text(fill: gray, style: "normal", weight: 400, size: 30pt)
  #set par(leading: 0.7em)
  A few smaller command and tool changes:

  #set text(fill: gray, style: "italic", weight: 300, size: 24pt)
  - Response files _(#o[`@file`])_ are now supported by `compile`, `link`,
    `asm`, `cgo`, `cover`, and `pack`
  - The #o[`bzr`] version control system is no longer supported
  - `GODEBUG` settings in `go.mod` and `//go:debug` comments are honored
  - #o[`go tool trace -http=:6060`] now listens on #underline[localhost] only
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
  Faster memory allocation

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The compiler generates *size-specialized* allocation routines, reducing
  the cost of small _(< 80 byte)_ allocations by up to #underline[30%].

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  This yields a ~1% improvement in allocation-heavy programs, at the
  cost of ~60 KB of binary size.

  #set text(fill: gray, style: "italic", weight: 300, size: 16pt)
  Opt out with #o[`GOEXPERIMENT=nosizespecializedmalloc`] _(expected to be removed in Go 1.28)_.
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Goroutine leak profile

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The profile reporting *leaked goroutines*, experimental in *Go 1.26*,
  is now #underline[generally available].

  #set text(fill: gray, style: "normal", weight: 300, size: 24pt)
  The `goroutineleak` profile is available in `runtime/pprof` and as the
  `net/http/pprof` endpoint #o[`/debug/pprof/goroutineleak`].

  #set text(fill: gray, style: "italic", weight: 300, size: 16pt)
  The `goroutineleakprofile` #o[`GOEXPERIMENT`] setting has been deleted. _(Credit: Vlad Saioc, Uber)_
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Goroutine leak profile

  #set text(fill: gray, style: "normal", size: 17pt)
  #set par(leading: 0.55em)
  ```go
  ch := make(chan result)
  for _, w := range ws {
      go func() {
          res, err := processWorkItem(w)
          ch <- result{res, err}
      }()
  }
  for range len(ws) {
      r := <-ch
      if r.err != nil {
          return nil, r.err // This early return may leak goroutines.
      }
      results = append(results, r.res)
  }
  ```
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Tracebacks with labels

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  Modules with a #underline[`go 1.27`] directive now include
  `runtime/pprof` goroutine *labels* in the traceback header line.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  This can be disabled with the #o[`tracebacklabels=0`] `GODEBUG`
  setting, an opt-out expected to be kept indefinitely.
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  asynctimerchan removed

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The #o[`asynctimerchan`] `GODEBUG` setting _(added in Go 1.23)_
  has been *permanently removed*.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  Channels created by the `time` package are now #underline[always]
  unbuffered _(synchronous)_, irrespective of `GODEBUG` settings.
]

#box-slide[
  #set text(blue, style: "italic", weight: 900, size: 162pt)
  #align(center)[#pad(top: 100pt)[Compiler]]
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Function literal names

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The compiler generates *simpler* names for function literals
  _(closures)_, choosing the #underline[same] name regardless of inlining.

  #set text(fill: gray, style: "italic", weight: 300, size: 26pt)
  Tests that check symbol names may need updates. Programs that
  incorrectly compare function code pointers may be more exposed.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Relative filenames in directives

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  #o[`//line`] and #o[`/*line*/`] directives now resolve relative
  filenames against the directory of the #underline[containing file].

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  This matches the behavior of `go/scanner`. Absolute filenames
  are unaffected.
]

#box-slide[
  #set text(green, style: "italic", weight: 900, size: 169pt)
  #align(center)[#pad(top: 90pt)[Linker]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  macOS target support

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The linker now accepts #o[`-macos`] and #o[`-macsdk`] options to specify
  the OS and SDK versions in the #underline[`LC_BUILD_VERSION`] load command.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  They default to the oldest supported macOS version _(currently 13.0.0)_
  and a recent SDK version _(currently 26.2.0)_.
]

#box-slide[
  #set text(gray, style: "italic", weight: 900, size: 153pt)
  #align(center)[#pad(top: 6pt)[Standard library]]
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New encoding/json/v2 package

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  `encoding/json/v2` is a *major revision* of `encoding/json`, with
  options-driven `Marshal` and `Unmarshal` families of functions.

  #set text(fill: gray, style: "normal", weight: 300, size: 24pt)
  It has #underline[stricter] defaults — rejecting invalid UTF-8 and
  duplicate object names — and `encoding/json` is now backed by it.

  #set text(fill: gray, style: "italic", weight: 300, size: 18pt)
  The v1 API stays supported; opt out with #o[`GOEXPERIMENT=nojsonv2`] at build time.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New encoding/json/jsontext package

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  `encoding/json/jsontext` provides *lower-level* syntactic
  processing of JSON.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  Its `Encoder` and `Decoder` operate on JSON as a sequence of
  `Token` and `Value`, maintaining a state machine for #underline[valid]
  JSON text.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New crypto/mldsa package

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The new `crypto/mldsa` package implements the *post-quantum*
  ML-DSA signature scheme specified in #underline[FIPS 204].

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  `crypto/x509` supports ML-DSA keys and signatures, and `crypto/tls`
  supports them in TLS 1.3 _(`MLDSA44`, `MLDSA65`, `MLDSA87`)_.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New uuid package

  #set text(fill: gray, style: "normal", weight: 400, size: 40pt)
  #set par(leading: 0.7em)
  The new `uuid` package generates and parses #underline[UUIDs].
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New experimental simd package

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The new, *experimental* `simd` package provides #underline[portable],
  vector-size-agnostic SIMD support, using hardware instructions
  if available.

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  It is available on all architectures with vector types such as
  `Int8s` and `Float32s`, enabled with #o[`GOEXPERIMENT=simd`].
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  Updated experimental simd/archsimd

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The architecture-specific `simd/archsimd` package, introduced in
  *Go 1.26*, revises its amd64 API and *adds* support for #underline[arm64]
  _(Neon, 128-bit)_ and #underline[WebAssembly] _(128-bit)_.

  #set text(fill: gray, style: "italic", weight: 300, size: 26pt)
  The API is not yet stable and is non-portable by design.
  Enable it with #o[`GOEXPERIMENT=simd`] at build time.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  bytes & strings: CutLast

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The new `CutLast` functions in `bytes` and `strings` slice around
  the #underline[last] occurrence of a separator.

  #set text(fill: gray, style: "normal", size: 20pt)
  #set par(leading: 0.6em)
  ```go
  before, after, found := strings.CutLast("a/b/c", "/")
  // "a/b", "c", true
  ```

  #set text(fill: gray, style: "italic", weight: 300, size: 26pt)
  They can replace and simplify some uses of `LastIndex`.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  net/http priorities

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The HTTP/2 server now accepts client *priority signals* _(RFC 9218)_,
  serving higher-priority streams first.

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  HTTP/1 response bodies are now auto-drained on close _(up to a limit)_,
  improving connection reuse for most programs.

  #set text(fill: gray, style: "italic", weight: 300, size: 22pt)
  The old round-robin behavior returns via #o[`Server.DisableClientPriority`].
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  hash/maphash & go/types hashing

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  `hash/maphash` gains a `Hasher` interface for hash-based structures,
  plus a `ComparableHasher` for #underline[comparable] types.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  `go/types` gains a `Hasher` implementing it for `Type`s, respecting
  the `Identical` relation, so types can be used as map keys.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  More minor additions

  #set text(fill: gray, style: "normal", weight: 400, size: 30pt)
  #set par(leading: 0.7em)
  A selection of other handy additions:

  #set text(fill: gray, style: "italic", weight: 300, size: 20pt)
  - `math/big`: `Int.Divide` returns quotient and remainder with rounding modes
  - `math/rand/v2`: `Rand` gains the generic method `N`
  - `net/url`: new `URL.Clone` and `Values.Clone` deep-copy methods
  - `net/http/httptest`: `NewTestServer` uses an in-memory fake network
  - `testing/synctest`: new `Sleep` helper; `unicode` upgraded to *Unicode 17*
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
  #set par(leading: 0.9em)
  #set text(fill: gray, style: "normal", weight: 700, size: 33pt)

  #align(center)[
    #y[bytes] #t[compress/flate] #b[crypto] #g[crypto/ecdsa]
    #o[crypto/tls] #y[crypto/x509] #b[crypto/x509/pkix] #t[database/sql]
    #g[database/sql/driver] #b[go/constant] #t[go/scanner]
    #b[go/token] #t[go/types] #x[hash/maphash] #y[math/big]
    #t[math/rand/v2] #g[net] #b[net/http] #o[net/http/httptest]
    #y[net/url] #b[runtime/secret] #g[strings]
    #t[testing/synctest] #o[unicode]
  ]
]

#box-slide[
  #set text(green,style: "italic", weight: 900, size: 280pt)
  #align(center)[#pad(top: 66pt)[Ports]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Ports

  #set par(leading: 0.85em)
  #set text(fill: gray, style: "normal", weight: 300, size: 22pt)
  #list(tight: false, marker: [#pad(top: 4pt)[#text(size: 11pt)[#g[●]]]],
    [*Darwin*:   Go 1.27 now requires #underline[macOS 13 Ventura] or later,
                  as announced in the Go 1.26 release notes.],
    [*PowerPC*:  On big-endian 64-bit Linux (`GOARCH=ppc64`), the toolchain
                  now generates binaries using the *ELFv2* ABI, gaining
                  support for cgo, PIE, and external linking
                  _(requires Linux kernel 3.13 or later)_.],
  )
]

#box-slide[
  #set text(blue, style: "normal", weight: 900, size: 129pt)
  #pad(top: 66pt)[
    Learn more
    #set text(fill: gray, style: "normal", weight: 400, size: 39pt)
    Please read the Go 1.27 Release Notes #t[https://go.dev/doc/go1.27]
  ]
]
