# Adversarial review — 昭和二十二年法律第百七十五号 art. 2(1) (¥5,000,000 band)

Unit: `NORM|89a8b5e3962e7db358a45105bea6669582c82591554b65860296e9fc58cc71cf`
Verbatim: 「合計所得金額が五百万円以下であるとき」

- **H** (refutable hypothesis): the formal model silently treats the ¥5,000,000
  band as the whole of art. 2(1), or uses the wrong boundary (strict vs non-strict).
- **T** (reproduction): re-extract the pinned article; parse 五百万円; inspect
  `eligible` (non-strict `<=`) and `specEligible` (`!(threshold < n)`); check
  the universal agreement theorem and boundary examples in the Lean kernel.
- **D** (decision): the verbatim sentence is located in art. 2; the only amount
  in the unit is 5,000,000 and it appears in both spec and implementation;
  boundary values 4,999,999 / 5,000,000 / 5,000,001 are kernel-decided as
  true / true / false. `agree_spec_impl` holds for all `Nat`. The wider
  applicability conditions (災害被害, 千万円以下, 政令) and the other bands
  are NOT modelled by this unit, explicitly.
- **C** (competing interpretation): 「以下」 could be read as a strict upper
  bound; the standard Japanese legal reading is inclusive, and the statute's
  next band says 「七百五十万円を超える」, confirming the inclusive reading of
  the preceding bands. That competing reading is recorded, not silently dropped.
- **U** (uncertainty): what counts as 合計所得金額 and whether the disaster-loss
  condition holds are caller-established; human legal review remains pending.

Axiom note: `agree_spec_impl` depends on Lean's standard `propext`
(propositional extensionality), part of the kernel's logic, not an unjustified
assumption. The boundary theorems are axiom-free (`#print axioms` recorded).
