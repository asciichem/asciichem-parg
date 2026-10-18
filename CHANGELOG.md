# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added

- P0 linear-chemistry grammar slice (`grammar/asciichem.parg`):
  molecules with coefficients; plain / hydrogen / prefixed (isotope)
  atoms; sub/superscripts, charges, oxidation states; all eight bond
  kinds; ring closures; bracket groups with multiplicity (captured as
  a subtree); reactions with `+`, four arrows, and above/below
  conditions. Inline `test` block is the acceptance suite — 19
  accept/reject cases covering the corpus slice.
- CI: compile + acceptance on push/PR (parsanol 1.3.94 pinned).
