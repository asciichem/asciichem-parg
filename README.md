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

Scaffold. The grammar lands with the PARG migration (issue #96, phase
P1); the P0 feasibility spike runs the linear-chemistry slice first.
