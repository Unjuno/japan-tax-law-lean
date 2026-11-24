# Adversarial review — 相続税法 art. 38(4) ただし書

Unit: `NORM|6c27921434c59ba57a352e0bf3f7ff011871be1423b177bd348091a1ab4d0156`
Verbatim: 「ただし、その延納税額が百万円以下で、かつ、その延納期間が三年以下
である場合は、この限りでない。」

- **H**: the exception might be modelled as an OR instead of the statute's
  `かつ` (AND), or the money/year constants could be swapped or mis-scaled.
- **T**: re-extract art. 38(4); parse 百万円 → 1,000,000 yen and 三年 → 3 years;
  inspect `exceptionApplies` (kernel `<=` on two differently-typed variables);
  run boundaries (1,000,000,3)→true, (1,000,001,3)→false,
  (1,000,000,4)→false, (1,000,001,4)→false.
- **D**: verbatim located; the sole 円-amount in the unit (1,000,000) is matched
  in spec and impl by the Lean-independent tool (D=PASS); the period constant
  3 is confirmed from 「三年以下」 in the same verbatim and encoded as
  `periodCapYears : Nat` in years. Dimensions are kept separate — yen vs years
  are not interchangeable. `agree_spec_impl` holds for ALL pairs of Nat.
  This unit expresses only WHEN the exception applies; the rule it negates
  (「この限りでない」) is a separate unit and is not modelled here.
- **C**: 「以下」 could be read as strict; the adjacent wording supports
  inclusive caps. Recorded as a competing reading.
- **U**: 延納税額 and 延納期間 are caller-established; human legal review pending.

Axiom note: `agree_spec_impl` uses standard `propext`; the four boundary
theorems are axiom-free (`#print axioms` recorded).
