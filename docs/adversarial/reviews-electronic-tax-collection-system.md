### ElectronicTaxCollectionSystem.lean — adversarial review (NORM|1b925ca2…)

独立再抽出: the clause was re-extracted from the pinned raw snapshot (一次資料) and
compared against the model header and the article-scoped transcription pin.
判定: the model covers the customs exclusion and the three structural elements as a
decidable predicate; the scope of "所掌に属する事務" is NOT MODELLED. H/T/D/C/U record below.

Pinned: law `403M50000040054`, article 第一条.

| id | H (falsifiable hypothesis) | T (reproduction test) | D (verdict) | C (competing reading) | U (uncertainty) |
|---|---|---|---|---|---|
| H1 | Customs exclusion dropped | `qualifies true true true true = false` | PASS — customs officers excluded even with all elements | — | none |
| H2 | One of the three elements omitted | examples with each element false all give `false` | PASS — conjunction of all three | — | none |
| H3 | Negation of customs flag inverted | `qualifies false true true true = true` | PASS — non-customs qualifies | — | none |
| H4 | Spec circular | `specQualifies` uses `allThree`/`notCustoms`; agreement proved by 16-way Bool case split, no axioms | PASS | — | none |
| H5 | Finite examples mistaken for universal | `spec_agrees` quantifies over all four Bool inputs and closes by `cases ... rfl` | PASS | — | none |
| H6 | Scope of assigned duties silently dropped | Header/scope note record NOT MODELLED; duty scope is caller-established | PARTIAL_BY_SCOPE | A stricter reading would require modelling duties | Duty facts are outside this clause |

Conclusion: implementation and independent spec agree for all inputs; no `sorry`/`admit`, no unexplained axioms, no legal determination. Human legal review stays pending.
