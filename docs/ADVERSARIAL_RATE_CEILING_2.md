# Adversarial review — 地方税法 art. 51 ただし書 (2% ceiling)

Unit: `NORM|c6450946afa36af4ed52b19ff5433b84df5afb14341f23ab94d02f93d73b7450`
Verbatim: 「ただし、標準税率を超える税率で課する場合においても、百分の二を
超えることができない。」

- **H**: the ceiling might be encoded as 2/1000 (per-mille), as inclusive
  (`≤`) rather than the statute's strict `>` prohibition, or by division that
  is invalid when `den = 0`.
- **T**: re-extract art. 51; parse 百分の二 → (2, 100); inspect
  `exceedsCeiling` (cross-multiplied strict test); check boundaries
  2/100, 3/100, 1/100, 20/1000 (equal fraction), 21/1000; check `#print axioms`.
- **D**: verbatim located; constants [2, 100] present in spec and impl (D=PASS);
  boundaries kernel-decide false/true/false/false/true; `agree_spec_impl`
  universal over all Nat pairs (spec uses the non-strict negation). The model
  is a ceiling TEST only — the standard rate and the local decision to exceed
  it are separate units. `den = 0` is not a valid rate and is caller-excluded.
- **C**: 「超えることができない」 could be misread as allowing exactly 2%;
  the strict reading is recorded alongside the competing interpretation.
- **U**: rate numerator/denominator semantics and human legal review pending.

Axiom note: `at_ceiling` and `above_ceiling` are axiom-free; `agree_spec_impl`
uses standard `propext` (recorded, not hidden).
