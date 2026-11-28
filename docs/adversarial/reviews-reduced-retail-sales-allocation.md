### ReducedRetailSalesAllocation.lean — adversarial review (NORM|31d89315…)

独立再抽出: the clause was re-extracted from the pinned raw snapshot (一次資料) and
compared against the model header and the article-scoped transcription pin.
判定: the model covers the 50M cap, the reduced-share allocation and the 100/108 and
100/110 conversions with Nat floor semantics; the "difficulty" finding and period
identification are NOT MODELLED. H/T/D/C/U record below.

Pinned: law `363AC0000000108`, article 第三十八条.

| id | H (falsifiable hypothesis) | T (reproduction test) | D (verdict) | C (competing reading) | U (uncertainty) |
|---|---|---|---|---|---|
| H1 | 五千万円以下 modelled as strict (<) | `withinCap 50_000_000 = true`, `50_000_001 = false` | PASS — inclusive 以下 | — | none |
| H2 | Reduced share uses 108/100 instead of 100/108 | `reducedBase 1_080_000 1 1 = 1_000_000` | PASS — 100/108 applied to tax-inclusive sales | — | none |
| H3 | Residual uses 100/108 too | `otherBase 1_100_000 0 1 = 1_000_000` | PASS — 100/110 on the residual | — | none |
| H4 | Zero ratio denominator yields unsound division | `reducedBase ... 1 0 = 0`, `otherBase 1_100_000 1 0 = 1_000_000` | PASS — guarded branch | — | none |
| H5 | Spec circular | `specShare` uses `num * total`; three `*_agrees` theorems proved by `rfl`/`Nat.mul_comm`, no axioms | PASS | — | none |
| H6 | Finite examples mistaken for universal | all agreement theorems universally quantify inputs | PASS | — | none |
| H7 | Difficulty/period conditions silently dropped | Header and scope note record NOT MODELLED; inputs are caller-established | PARTIAL_BY_SCOPE | A stricter reading would require modelling the finding and period | Facts are outside this clause |

Conclusion: implementation and independent spec agree for all inputs; no `sorry`/`admit`, no unexplained axioms, no legal determination. Human legal review stays pending.
