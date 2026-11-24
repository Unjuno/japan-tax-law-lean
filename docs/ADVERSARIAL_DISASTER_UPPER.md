# Adversarial review — art. 2(1) third band (「七百五十万円を超える」)

Unit: `NORM|2a1dc80cd4074bee88062395289ab4abddf8db19565f3d14b6d56b4003fbfb01`
Verbatim: 「合計所得金額が七百五十万円を超えるとき」

- **H**: the model might use `≥` instead of the statute's strict `>`, or treat
  this band as covering the whole article.
- **T**: re-extract the pinned article; parse 七百五十万円 → 7,500,000;
  inspect `eligibleUpper` (strict `<`) vs `specEligibleUpper` (`!(n ≤ 7.5M)`);
  check kernel boundaries 7,499,999 / 7,500,000 / 7,500,001.
- **D**: verbatim located; sole amount in this unit is 7,500,000 and it appears
  in both spec and implementation; boundaries kernel-decide false / false /
  true; `agree_spec_impl` holds for all `Nat`. Only this band is modelled; the
  second band (≤7.5M), first band (≤5M), applicability conditions and the
  reduction factor are out of scope for this unit.
- **C**: 「を超える」 could be misread as inclusive; the adjacent band's
  「七百五十万円以下」 confirms the strict reading. Recorded, not suppressed.
- **U**: 合計所得金額 determination and the other conditions are
  caller-established; human legal review remains pending.

Axiom note: `agree_spec_impl` uses Lean's standard `propext`; the boundary
theorems are axiom-free (`#print axioms` recorded).
