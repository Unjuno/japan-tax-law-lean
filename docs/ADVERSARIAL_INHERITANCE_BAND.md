# Adversarial review — 相続税法 art. 16 table band ¥10M<amount≤¥30M

Unit: `NORM|93b274d3db7616b01bf8ebe8da32b6a1bb33b66ca5f224d32215cd1108b0c470`
Verbatim (appendix table cell): 「千万円を超え三千万円以下の金額」

- **H**: the model might make both edges inclusive/exclusive, or use ¥1M/¥3M
  by misreading 千万 / 三千万.
- **T**: re-extract art. 16 from the pinned JSON; parse both kanji numerals;
  inspect `lowerYen=10,000,000`, `upperYen=30,000,000`, `inBand`; run kernel
  boundaries 9,999,999 / 10,000,000 / 10,000,001 / 30,000,000 / 30,000,001.
- **D**: verbatim located; amounts 10,000,000 and 30,000,000 both present in
  spec and implementation; boundaries kernel-decide false / false / true /
  true / false; `agree_spec_impl` holds for all `Nat`. Only this band's
  membership is modelled — the rate, other bands and the base amount are
  separate units, explicitly out of scope.
- **C**: 「超え」 could be misread as inclusive; the next band's wording and
  the 「以下」 on the upper edge support the mixed strict/inclusive reading.
  Recorded as a competing interpretation.
- **U**: the table's base amount and applicability are caller-established;
  human legal review remains pending.

Axiom note: `agree_spec_impl` uses Lean's standard `propext`; the three
boundary theorems are axiom-free (`#print axioms` recorded).
