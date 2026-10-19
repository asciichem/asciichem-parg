# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added

- **P1a — full grammar**: the complete AsciiChem syntax as PARG —
  beyond-formulas constructs (crystal, spectrum, calc, zmatrix,
  mechanism), electron configurations, atom annotations
  (coordinates/parity/multiplicity/title/fractional), Lewis markers,
  stereo prefixes, text and embedded-math runs, molecule annotations,
  and reaction cascades.
- **Corpus parity: 227/227** — every parse/reject fixture in the
  shared conformance corpus (asciichem-tests) behaves identically
  under the PARG artifact (`scripts/corpus-parity.rb`).
- CI: grammar acceptance (inline tests) + corpus parity on push/PR,
  against pinned parsanol-ruby and pubid-grammar refs (the selfhost
  artifact follows the upstream pubid-grammar convention).

### Fixed (during parity)

- braced sub/superscript values (`H_{2}O`, `Ca^{2+}`, `Fe^{(III)}`,
  `H_{}` — empty braces allowed); arrow conditions must ride the
  arrow with no gap; cascade segments fold into the reaction rule
  (parsanol is strict PEG — no repetition backtracking, unlike the
  parslet reference, so the cascade rule consumes segments greedily
  and correctly).
