### BenefitTariffLowerRate.lean — adversarial review (NORM|177401da…)

独立再抽出: the article text was re-extracted independently from the pinned raw
snapshot (一次資料) and compared against the model header and transcription pin.
判定: the scope is recorded as a reference/priority rule with the concession table
left as an input; no legal determination is made. H/T/D/C/U record below.

Pinned: law `330CO0000000237`, revision `330CO0000000237_20250401_507CO0000000141`,
article 第三条 (便益関税の税率).

| id | H (falsifiable hypothesis) | T (reproduction test) | D (verdict) | C (competing reading) | U (uncertainty) |
|---|---|---|---|---|---|
| H1 | The model wrongly makes the lower-rate law override even when its rate is higher | `effectiveRate 100 (some 101) = 100` (kernel `decide`) | PASS — higher rate never overrides; only strictly lower wins | A reader could think any "法令の規定" overrides unconditionally; text says 低い税率 | The set of qualifying laws is not identified in the raw text (delegated) |
| H2 | Equality case mishandled (`lower < table` vs `<=`) | `effectiveRate 100 (some 100) = 100`, spec `Nat.min` agreement theorem | PASS — equal case keeps table rate, spec agrees universally | Could argue "低い" excludes equality (correct) vs includes it (would give same numeric result anyway) | none material |
| H3 | Spec is circular (uses implementation constants) | `specEffective` uses only `Nat.min`; theorem proved by `cases`/`simp`/`Nat.min_eq_*` | PASS — independent definitions, axiom-free agreement | — | none |
| H4 | The first paragraph (table-rate determination) is silently dropped | Header and pin record the full first-paragraph needle; scope notes the table is an input | PARTIAL_BY_SCOPE — the rule "rate = table rate by classification" is represented as `tableRate` input; the table contents are NOT_MODELLED | A stricter reading would require transcribing the concession table itself | Table contents are large/external; recorded as unhandled-but-not-silently-dropped |
| H5 | Source pin is a global-keyword hit rather than a scoped article match | Pin uses article-scoped needles from the pinned revision; transcription audit checks verbatim strings | PASS — needles unique in scoped article context | — | none |
| H6 | Finite examples mistaken for a universal claim | `spec_agrees` is a universally quantified theorem over all `Nat` inputs | PASS — no finite-domain conflation | — | none |

Conclusion: implementation and independent spec agree for all inputs; no axiom, no
`sorry`/`admit`; no legal determination is made. Human legal review stays pending.
