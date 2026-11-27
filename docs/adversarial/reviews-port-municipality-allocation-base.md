### PortMunicipalityAllocationBase.lean — adversarial review (NORM|25fa4c2a…)

独立再抽出: the clause was re-extracted from the pinned raw snapshot (一次資料) and
compared against the model header and the article-scoped transcription pin.
判定: the model covers the conditional switch of the allocation base; the customs
branch/suboffice identification and the proration rule are recorded as NOT MODELLED.
H/T/D/C/U record below.

Pinned: law `332AC0000000077`, revision `332AC0000000077_20010106_411AC0000000160`,
article 第二条第二項.

| id | H (falsifiable hypothesis) | T (reproduction test) | D (verdict) | C (competing reading) | U (uncertainty) |
|---|---|---|---|---|---|
| H1 | 「二以上」was modelled as strictly greater than two | `allocationBase 2 100 7 = 7` and `specBase 2 100 7 = 7` (kernel `decide`) | PASS — exactly two switches the base | A reading that requires three or more would contradict 二以上 (inclusive) | none |
| H2 | The zero/one cases wrongly switch the base | `allocationBase 0/1 100 7 = 100` | PASS — no switch below two | — | none |
| H3 | Spec is circular or finite-only | `specBase` pattern-matches `0/1/succ(succ _)`; `spec_agrees` is universally quantified, proved by `cases` + `simp` | PASS — no implementation ids, no axioms, no finite-domain assumption | — | none |
| H4 | The clause silently drops the customs-branch parenthetical | Model header records the full verbatim sentence; scope note declares branch/suboffice identification NOT MODELLED | PARTIAL_BY_SCOPE — the conditional base switch is modelled; branch selection is external | A stricter reading would require modelling customs jurisdiction data | Branch/suboffice facts are not in the clause |
| H5 | Pin is a global keyword hit | Pin uses the exact 182-char sentence in the scoped article of the pinned revision | PASS — verbatim scoped anchor | — | none |

Conclusion: implementation and independent spec agree for all inputs; no `sorry`/`admit`,
no unexplained axioms. No legal determination is made; human legal review stays pending.
