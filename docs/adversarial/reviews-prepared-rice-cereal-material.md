### PreparedRiceCerealMaterial.lean — adversarial review (NORM|ac0926f0…)

独立再抽出: the clause was re-extracted from the pinned raw snapshot (一次資料) and
compared against the model header and the article-scoped transcription pin.
判定: the model covers the five conjunctive elements and the inclusive five-condition
threshold; the definition of "特定朝食シリアル" is NOT MODELLED. H/T/D/C/U record below.

Pinned: law `407M50000200018`, article 第一条.

| id | H (falsifiable hypothesis) | T (reproduction test) | D (verdict) | C (competing reading) | U (uncertainty) |
|---|---|---|---|---|---|
| H1 | One missing element still qualifies | `qualifies false true true true true = false` | PASS — all five required | — | none |
| H2 | "に限る" read as a non-restriction | `qualifies true true true true false = false` | PASS — final use element required | — | none |
| H3 | Five-element threshold modelled as >5 | mask tests 15 (4) / 31 (5) with literal 5 | PASS — exactly five, inclusive | — | none |
| H4 | Spec circular | `specQualifies`/`specCount` use independent helpers; both agreement theorems proved by case split + rfl | PASS | — | none |
| H5 | Finite examples mistaken for universal | both `*_agrees` theorems universally quantify all five Bool inputs | PASS | — | none |
| H6 | Scope of "特定朝食シリアル" silently dropped | Header/scope note record NOT MODELLED; caller-established Bool | PARTIAL_BY_SCOPE | A stricter reading would require the product category definition | Category facts are outside this clause |

Conclusion: implementation and independent spec agree for all inputs; no `sorry`/`admit`, no unexplained axioms, no legal determination. Human legal review stays pending.
