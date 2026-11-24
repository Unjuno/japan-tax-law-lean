# Adversarial review — 地方税法 art. 71の6 (利子割 5%)

Unit: `NORM|7e5f5d2a586ff79c2ee3e9c86d120d3180ba67a3d00fd8a4dba9ab376ba02b5a`
Verbatim: 「利子割の税率は、百分の五とする。」

- **H**: the model could encode 5% as 5/1000 (per-mille) or make a zero
  denominator representable; or silently claim the rounding rule.
- **T**: re-extract art. 71の6; parse 百分の五 → numerator 5 over 100; inspect
  `interestRate : TaxRate` with typed `den_pos`; check `rate_components`,
  boundary applications 0/1/20/100/1,000, and `#print axioms`.
- **D**: verbatim located; constants checked are [5, 100] and both appear in
  spec and implementation (D=PASS). `den = 0` is unrepresentable by the type.
  `agree_spec_impl` holds for all base amounts. Floor division is an explicit
  model choice; the statute's rounding rule is NOT specified in this unit and
  remains caller-established. Tax base and other rates are separate units.
- **C**: 「百分の五」 could be misread as 0.5%; the法定 denominator 100 and the
  adjacent per-mille provisions in the same act support 5/100. Recorded.
- **U**: 利子割課税標準 and rounding are caller-established; human legal review
  remains pending.

Axiom note: `rate_components` and `exact_base` are axiom-free;
`agree_spec_impl` uses standard `propext` (recorded, not hidden).
