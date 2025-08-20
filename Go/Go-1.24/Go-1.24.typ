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
    Go 1.24
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
    Go *1.24* now fully supports #text(orange)[generic type aliases]
  ]
  #set text(fill: gray, style: "normal", weight: 200, size: 28pt)
  #align(top)[
    _(a type alias may be parameterized like a defined type)_
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

  #set text(fill: gray, style: "normal", weight: 300, size: 36pt)
  #set par(leading: 0.7em)
  Go modules can now track executable dependencies using #o[`tool`] directives in #o[`go.mod`]

  #set text(fill: gray, style: "normal", weight: 300, size: 30pt)
  The #o[`go tool`] command can now run these tools in addition to tools shipped with the Go distribution.
]

#box-slide[
  #set text(fill: blue, style: "italic", weight: 600, size: 26pt)
  Go command

  #set text(fill: gray, style: "normal", weight: 300, size: 36pt)
  #set par(leading: 0.7em)
  The new #o[`tool`] *meta-pattern* refers to all tools in the current module.

  #set text(fill: gray, style: "normal", weight: 300, size: 28pt)
  This can be used to upgrade them all with #o[`go get tool`]
]

#box-slide[
  #set text(green, style: "italic", weight: 900, size: 230pt)
  #align(center)[#pad(top: 40pt)[Cgo]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Cgo

  #set text(fill: gray, style: "normal", weight: 300, size: 35pt)
  #set par(leading: 0.7em)
  Cgo supports new annotations for C functions to improve run time performance.

  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  `#cgo noescape cFunctionName` tells the compiler that memory passed to the C function cFunctionname does not escape.

  `#cgo nocallback cFunctionName` tells the compiler that the C function cFunctionName does not call back to any Go functions.
]

#box-slide[
  #set text(turqoise, style: "italic", weight: 900, size: 230pt)
  #align(center)[#pad(top: 40pt)[Vet]]
]

#box-slide[
  #set text(fill: turqoise, style: "italic", weight: 600, size: 26pt)
  Vet

  #set text(fill: gray, style: "normal", weight: 300, size: 30pt)
  #set par(leading: 0.7em)
  The new #o[`tests`] analyzer reports *common mistakes*
  in declarations of tests, fuzzers, benchmarks, and
  examples in test packages, such as malformed names,
  incorrect signatures, or examples that document
  non-existent identifiers.
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
  Several performance improvements to the runtime have
  *decreased* CPU overheads by *2–3%* on average across a
  suite of representative benchmarks.

  _Results may vary by application._
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
  The compiler already disallowed defining new methods with receiver
  types that were cgo-generated, but it was possible to *circumvent*
  that restriction via an alias type.
]

#box-slide[
  #set text(green, style: "italic", weight: 900, size: 169pt)
  #align(center)[#pad(top: 90pt)[Linker]]
]

#box-slide[
  #set text(fill: green, style: "italic", weight: 600, size: 26pt)
  Linker

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 300, size: 26pt)
  The linker now generates a GNU build ID _(the ELF `NT_GNU_BUILD_ID` note)_
  on ELF platforms and a `UUID` _(the Mach-O `LC_UUID` load command)_
  on macOS by default.

  #pad(top: 20pt)[
    #set text(fill: gray, style: "normal", weight: 300, size: 17pt)
    The build ID or UUID is #underline[derived from the Go build ID].

    It can be disabled by the `-B none` linker flag,
    or overridden by the `-B 0xNNNN` linker flag
    with a *user-specified hexadecimal value*.
  ]
]

#box-slide[
  #set text(gray, style: "italic", weight: 900, size: 153pt)
  #align(center)[#pad(top: 6pt)[Standard library]]
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  Directory-limited filesystem access

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:25pt)
  #list(tight: false, marker: [#pad(top: 4pt)[#text(size: 15pt)[●]]],
    [
      The new `os.Root` type provides the ability to perform filesystem operations within a _specific_ directory.
    ],
    [
      The `os.OpenRoot` function opens a directory and returns an `os.Root`.

      #set text(fill: gray, style: "normal", weight: 300, size:16pt)
      Methods on `os.Root` operate within the directory and *do not* permit
      paths that refer to locations outside the directory, including
      ones that follow symbolic links out of the directory.
    ],
  )
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New benchmark function

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:29pt)
  Benchmarks may now use the faster and less error-prone `testing.B.Loop`
  method to perform benchmark iterations like `for b.Loop() { ... }`
  in place of the typical loop structures involving `b.N` like `for range b.N`.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New benchmark function

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 300, size:28pt)
  This offers two significant advantages:

  #set text(fill: gray, style: "normal", weight: 200, size:22pt)
  #list(tight: false, marker: [#pad(top: 7pt)[#text(size: 15pt)[●]]],
    [
      The benchmark function will execute *exactly once* per `-count`, so expensive setup and cleanup steps execute only once.
    ],
    [
      Function call parameters and results are kept alive, #underline[preventing] the compiler from fully optimizing away the loop body.
    ],
  )
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  Improved finalizers

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:33pt)
  The new `runtime.AddCleanup` function is a finalization mechanism
  that is more flexible, more efficient, and less error-prone
  than `runtime.SetFinalizer`.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New weak package

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:28pt)
  The new `weak` package provides weak pointers.

  #set text(fill: gray, style: "normal", weight: 200, size:22pt)
  Weak pointers are a #underline[low-level primitive] provided to enable
  the creation of memory-efficient structures, such as weak maps for
  associating values, canonicalization maps for anything not covered by
  package `unique`, and various kinds of caches.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New crypto/mlkem package

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:28pt)
  The new `crypto/mlkem` package implements *ML-KEM-768* and *ML-KEM-1024*.

  #set text(fill: gray, style: "normal", weight: 200, size:22pt)
  *ML-KEM* is a post-quantum key exchange mechanism formerly
  known as *Kyber* and specified in _FIPS 203_.
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 25pt)
  New crypto/hkdf, crypto/pbkdf2, and crypto/sha3 packages

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:23pt)
  #list(tight: false, marker: [#pad(top: 7pt)[#text(size: 15pt)[●]]],
    [
      The new `crypto/hkdf` package implements the HMAC-based Extract-and-Expand key derivation function HKDF, as defined in RFC 5869.
    ],
    [
      The new `crypto/pbkdf2` package implements the password-based key derivation function PBKDF2, as defined in RFC 8018.
    ],
    [
      The new `crypto/sha3` package implements the SHA-3 hash function and SHAKE and cSHAKE extendable-output functions, as defined in FIPS 202.
    ],
  )
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  FIPS 140-3 compliance

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:33pt)
  This release includes a new set of mechanisms to facilitate #underline[*FIPS 140-3 compliance*].
]

#box-slide[
  #set text(fill: gray, style: "italic", weight: 600, size: 26pt)
  New experimental testing/synctest package

  #set par(leading: 0.7em)
  #set text(fill: gray, style: "normal", weight: 200, size:33pt)
  The new _experimental_ `testing/synctest` package provides support for testing concurrent code.
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
    #y[archive] #t[bytes] #b[crypto/aes] #g[crypto/cipher]
    #o[crypto/ecdsa] #y[crypto/md5] #b[crypto/rand] #t[crypto/rsa]
    #g[crypto/sha1] #b[crypto/sha256] #t[crypto/sha512]
    #b[crypto/subtle] #t[crypto/tls] #x[crypto/x509] #y[debug/elf]
    #t[encoding] #g[encoding/json] #b[go/types] #o[hash/adler32]
    #b[hash/crc32] #y[hash/crc64] #g[hash/fnv] #y[hash/maphash]
    #x[log/slog] #b[math/big] #g[math/rand] #t[math/rand/v2] #y[net]
    #t[net/http] #b[net/netip] #g[net/url] #o[os/user] #y[regexp] #b[runtime]
    #t[strings] #g[sync] #y[testing] #t[text/template] #b[time]
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
    [*Linux*:   Go 1.24 requires Linux kernel version 3.2 or later.],
    [*Darwin*:  Go 1.24 is the last release that will run on macOS 11 Big Sur.

                Go 1.25 will require macOS 12 Monterey or later.
    ],
    [*WASM*:    The `go:wasmexport` compiler directive is added for
                Go programs to *export* functions to the WebAssembly host.

                #set text(fill: gray, style: "normal", weight: 200, size: 13pt)
                On WebAssembly System Interface Preview 1 (`GOOS=wasip1 GOARCH=wasm`),

                Go 1.24 supports building a Go program as a `reactor/library`,
                by specifying the `-buildmode=c-shared` build flag.
    ],
    [*Windows*: The 32-bit windows/arm port (`GOOS=windows GOARCH=arm`)
                has been marked broken.
    ],
  )
]

#box-slide[
  #set text(blue, style: "normal", weight: 900, size: 129pt)
  #pad(top: 66pt)[
    Learn more
    #set text(fill: gray, style: "normal", weight: 400, size: 39pt)
    Please read the Go 1.24 Release Notes #t[https://go.dev/doc/go1.24]
  ]
]
