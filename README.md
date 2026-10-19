# asciichem-parg

The **AsciiChem grammar as a PARG text contract** — the single source
of truth for the AsciiChem syntax, expressed in
[PARG](https://github.com/parsanol/parsanol-ruby) (parsanol's grammar
language) and compiled to a checksummed portable artifact that the
native engines register.

Planned in
[asciichem-ruby#96](https://github.com/asciichem/asciichem-ruby/issues/96)
(migrate the AsciiChem grammar to PARG).

## Pipeline

```
grammar/asciichem.parg      committed text contract (this repo)
        |  Parsanol::PARG compiler
        v
artifact JSON               checksummed, cacheable, versioned
        |  native engine registration
        v
parsanol-shape tree -> Model implementations
```

## Versioning and consumption

Like [asciichem-model](https://github.com/asciichem/asciichem-model),
this is a **contract repository**: implementations (asciichem-ruby,
asciichem-ts, asciichem-py, asciichem-rs) vendor the grammar and
artifact from tags. Nothing here depends on an implementation; the
[shared conformance corpus](https://github.com/asciichem/asciichem-tests)
stays the behavioural arbiter.

## Status

**P1a landed**: the complete grammar (`grammar/asciichem.parg`) —
linear chemistry plus every beyond-formulas construct — with
corpus parity: all 227 parse/reject fixtures in the shared
conformance corpus behave identically under the PARG artifact.
Acceptance suite: the grammar's inline `test` block (run:
`parsanol parg test grammar/asciichem.parg`); corpus parity:
`scripts/corpus-parity.rb` (both enforced in CI).

Remaining: P1b — the model-transform seam in the implementations
(consume the PARG trees to build the shared `Model`), then the
default-engine switch (P2).
