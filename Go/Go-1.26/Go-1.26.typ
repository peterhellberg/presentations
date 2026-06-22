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
    Go 1.26
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
  #set text(turqoise, style: "italic", weight: 900, size: 155pt)
  #align(center)[#pad(top: 100pt)[Language]]
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Enhanced new function

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The built-in #o[`new`] function now allows its operand to be
  an *expression*, specifying the #underline[initial value] of the variable.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  This is especially useful for serialization packages
  such as `encoding/json` or protocol buffers.
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Enhanced new function

  #set text(fill: gray, style: "normal", size: 21pt)
  #set par(leading: 0.6em)
  ```go
  type Person struct {
      Name string `json:"name"`
      Age  *int   `json:"age"` // age if known; nil otherwise
  }

  func personJSON(name string, born time.Time) ([]byte, error) {
      return json.Marshal(Person{
          Name: name,
          Age:  new(yearsSince(born)),
      })
  }
  ```
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Self-referential generic types

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The restriction preventing generic types from referring to
  #underline[themselves] in their type parameter list has been *lifted*.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  Generic types can now specify constraints that refer to themselves.
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Self-referential generic types

  #set text(fill: gray, style: "normal", size: 26pt)
  #set par(leading: 0.6em)
  ```go
  type Adder[A Adder[A]] interface {
      Add(A) A
  }

  func algo[A Adder[A]](x, y A) A {
      return x.Add(y)
  }
  ```

  #set text(fill: gray, style: "italic", weight: 300, size: 24pt)
  Previously, the self-reference to `Adder` on the first line was #underline[not] allowed.
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
  Revamped go fix

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The #o[`go fix`] command has been *completely revamped* as the home
  of Go's #underline[modernizers].

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  It provides a dependable way to update codebases to the latest
  idioms and APIs, with dozens of fixers built on the same analysis
  framework as #o[`go vet`]. Fixers should *not* change program behavior.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Revamped go fix

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  A new *source-level inliner* allows users to automate API migrations
  using #o[`//go:fix inline`] directives.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  The historical, obsolete fixers have been #underline[removed].
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  go mod init

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  #o[`go mod init`] now defaults to a #underline[lower] `go` version
  in new `go.mod` files.

  #set text(fill: gray, style: "italic", weight: 300, size: 26pt)
  Running it with toolchain version `1.N.X` creates a `go.mod`
  specifying `go 1.(N-1).0`. The *Go 1.26* release creates `go.mod`
  files with `go 1.25.0`.

  #set text(fill: gray, style: "italic", weight: 300, size: 22pt)
  This encourages creating modules compatible with currently supported Go versions.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Removed tools

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The #o[`cmd/doc`] tool and #o[`go tool doc`] have been *deleted*.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  #o[`go doc`] serves as a replacement with the #underline[same] flags,
  arguments, and behavior.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  pprof

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The #o[`pprof`] tool web UI _(enabled with the #o[`-http`] flag)_
  now defaults to the *flame graph* view.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  The previous graph view is still available in the
  #g["View → Graph"] menu or via #o[`/ui/graph`].
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
  Green Tea garbage collector

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  The *Green Tea* garbage collector, previously experimental in *Go 1.25*,
  is now #underline[enabled by default].

  #set text(fill: gray, style: "normal", weight: 300, size: 24pt)
  It offers better locality and CPU scalability for marking and
  scanning small objects, with an expected *10–40%* reduction
  in garbage collection overhead in real-world programs.

  #set text(fill: gray, style: "italic", weight: 300, size: 18pt)
  It can be disabled by setting #o[`GOEXPERIMENT=nogreenteagc`] at build time
  _(expected to be removed in Go 1.27)_.
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Faster cgo calls

  #set text(fill: gray, style: "normal", weight: 400, size: 40pt)
  #set par(leading: 0.7em)
  The baseline runtime overhead of *cgo* calls
  has been reduced by #underline[~30%].
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Heap base address randomization

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  On 64-bit platforms, the runtime now *randomizes* the heap
  base address at startup for #underline[security].

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  This makes it harder for attackers to predict memory addresses
  and exploit vulnerabilities when using cgo.

  #set text(fill: gray, style: "italic", weight: 300, size: 18pt)
  Can be disabled by setting #o[`GOEXPERIMENT=norandomizedheapbase64`] at build time.
]

#box-slide[
  #set text(fill: orange, style: "italic", weight: 600, size: 26pt)
  Goroutine leak profile

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  A new profile type reporting *leaked goroutines* is now
  available as an #underline[experiment].

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  A _leaked_ goroutine is one blocked on a concurrency primitive
  _(channels, `sync.Mutex`, `sync.Cond`, …)_ that can *never* become unblocked.
  The runtime detects this using the garbage collector.

  #set text(fill: gray, style: "italic", weight: 300, size: 18pt)
  Enable the `goroutineleak` profile with #o[`GOEXPERIMENT=goroutineleakprofile`]
  at build time _(goal: enabled by default in Go 1.27)_.
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
  #set text(blue, style: "italic", weight: 900, size: 162pt)
  #align(center)[#pad(top: 100pt)[Compiler]]
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Stack allocation for slices

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  The compiler can now allocate the backing store for slices
  #underline[on the stack] in more situations,
  which *improves* performance.

  #set text(fill: gray, style: "normal", weight: 300, size: 22pt)
  The bisect tool can be used with the #o[`-compile=variablemake`] flag
  to find problematic allocations, or all new stack allocations can be
  disabled with #o[`-gcflags=all=-d=variablemakehash=n`].
]

#box-slide[
  #set text(green, style: "italic", weight: 900, size: 169pt)
  #align(center)[#pad(top: 90pt)[Linker]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Windows ARM64

  #set text(fill: gray, style: "normal", weight: 400, size: 36pt)
  #set par(leading: 0.7em)
  On 64-bit ARM-based Windows _(the `windows/arm64` port)_, the linker
  now supports *internal linking* mode for cgo programs.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  Enabled via #o[`-ldflags=-linkmode=internal`].
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Minor executable changes

  #set text(fill: gray, style: "normal", weight: 400, size: 30pt)
  #set par(leading: 0.7em)
  Several changes affect programs analyzing executables,
  but #underline[not] running programs:

  #set text(fill: gray, style: "italic", weight: 300, size: 24pt)
  - `moduledata` is now in its own section, named `.go.module`
  - The `.gopclntab` section no longer contains relocations, and
    moves from relro to the rodata segment
  - The `.gosymtab` section has been *removed*
  - ELF sections are now sorted by address in the section header list
]

#box-slide[
  #set text(gray, style: "italic", weight: 900, size: 153pt)
  #align(center)[#pad(top: 6pt)[Standard library]]
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New crypto/hpke package

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  The new `crypto/hpke` package implements
  *Hybrid Public Key Encryption* _(HPKE)_ as specified in #underline[RFC 9180].

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  This includes support for post-quantum hybrid KEMs.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New experimental simd/archsimd package

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  The new, *experimental* `simd/archsimd` package provides
  #underline[architecture-specific] SIMD operations, enabled by setting
  #o[`GOEXPERIMENT=simd`] at build time.

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  Currently available on amd64, it supports 128-, 256-, and 512-bit
  vector types _(`Int8x16`, `Float64x8`, …)_. The API is *not* yet stable,
  and a high-level portable SIMD package is planned.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New experimental runtime/secret package

  #set text(fill: gray, style: "normal", weight: 400, size:32pt)
  #set par(leading: 0.7em)
  The new, *experimental* `runtime/secret` package helps securely
  #underline[erase] temporaries in code manipulating secret information,
  typically cryptographic.

  #set text(fill: gray, style: "normal", weight: 300, size: 24pt)
  It securely erases registers, stack, and new heap allocations,
  easing forward secrecy. Enable it with #o[`GOEXPERIMENT=runtimesecret`]
  at build time _(amd64 and arm64 on Linux)_.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  errors.AsType

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  The new `errors.AsType` function is a *generic* version of `errors.As`.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  It is type-safe, faster, and easier to use in most cases.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  reflect iterators

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  The `reflect` package gains new methods returning #underline[iterators]:

  #set text(fill: gray, style: "italic", weight: 300, size: 26pt)
  - `Type.Fields`, `Type.Methods`, `Type.Ins`, `Type.Outs`
  - `Value.Fields`, `Value.Methods`

  #set text(fill: gray, style: "italic", weight: 300, size: 24pt)
  Each iteration yields the type information _(`StructField` or `Method`)_
  and the corresponding field or method `Value`.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  log/slog MultiHandler

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  The new `slog.NewMultiHandler` function creates a `MultiHandler`
  that invokes #underline[all] of the given Handlers.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  `Enabled` reports whether any handler is enabled; `Handle`, `WithAttrs`,
  and `WithGroup` call the corresponding method on each enabled handler.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  Faster io.ReadAll

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  `io.ReadAll` now allocates #underline[less] intermediate memory
  and returns a minimally sized final slice.

  #set text(fill: gray, style: "italic", weight: 300, size: 28pt)
  It is often about *2x faster* while allocating around half the
  total memory, with more benefit for larger inputs.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  Deterministic crypto randomness

  #set text(fill: gray, style: "normal", weight: 400, size:36pt)
  #set par(leading: 0.7em)
  Across the `crypto/...` packages, the `random` parameter to key
  and signature functions is now *ignored* — a secure cryptographic
  random source is #underline[always] used.

  #set text(fill: gray, style: "italic", weight: 300, size: 26pt)
  Use the new `testing/cryptotest.SetGlobalRandom` for deterministic
  testing. The `GODEBUG=cryptocustomrand=1` setting temporarily
  restores the old behavior.
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
    #y[bytes] #t[crypto] #b[crypto/dsa] #g[crypto/ecdh]
    #o[crypto/ecdsa] #y[crypto/ed25519] #b[crypto/fips140] #t[crypto/mlkem]
    #g[crypto/mlkem/mlkemtest] #b[crypto/rand] #t[crypto/rsa]
    #b[crypto/sha3] #t[crypto/subtle] #x[crypto/tls] #y[crypto/x509]
    #t[debug/elf] #g[errors] #b[fmt] #o[go/ast]
    #b[go/token] #y[go/types] #g[image/jpeg] #y[io]
    #x[log/slog] #b[net] #g[net/http] #t[net/http/httptest]
    #y[net/http/httputil] #b[net/netip] #o[net/url] #g[os] #b[os/signal]
    #t[reflect] #b[runtime/metrics] #g[testing] #o[testing/cryptotest] #y[time]
  ]
]

#box-slide[
  #set text(green,style: "italic", weight: 900, size: 280pt)
  #align(center)[#pad(top: 66pt)[Ports]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Ports

  #set par(leading: 0.75em)
  #set text(fill: gray, style: "normal", weight: 300, size: 16pt)
  #list(tight: false, marker: [#pad(top: 4pt)[#text(size: 9pt)[#g[●]]]],
    [*Darwin*:   Go 1.26 is the #underline[last] release that runs on macOS 12 Monterey.
                  Go 1.27 will require macOS 13 Ventura or later.],
    [*FreeBSD*:  The freebsd/riscv64 port
                  (`GOOS=freebsd GOARCH=riscv64`) is now marked #underline[broken].],
    [*Windows*:  The broken 32-bit windows/arm port
                  (`GOOS=windows GOARCH=arm`) has been #underline[removed].],
    [*PowerPC*:  Go 1.26 is the last release supporting the ELFv1 ABI on
                  big-endian 64-bit PowerPC Linux (`GOARCH=ppc64`).],
    [*RISC-V*:   The `linux/riscv64` port now supports the race detector.],
    [*S390X*:    Now supports passing function arguments and results using registers.],
    [*WebAssembly*: The runtime manages heap memory in smaller increments,
                  reducing memory usage for heaps less than ~16 MiB.],
  )
]

#box-slide[
  #set text(blue, style: "normal", weight: 900, size: 129pt)
  #pad(top: 66pt)[
    Learn more
    #set text(fill: gray, style: "normal", weight: 400, size: 39pt)
    Please read the Go 1.26 Release Notes #t[https://go.dev/doc/go1.26]
  ]
]
