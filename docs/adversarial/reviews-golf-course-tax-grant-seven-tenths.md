### GolfCourseTaxGrantSevenTenths.lean — adversarial review (NORM|7128dfb6…)

独立再抽出: the clause was re-extracted from the pinned raw snapshot (一次資料) and
compared against the model header and the article-scoped transcription pin.
判定: the model covers area proration, refund deduction, and the 7/10 factor with
explicit Nat floor semantics; the collection-period date test is recorded as NOT MODELLED.
H/T/D/C/U record below.

Pinned: law `329M50000002023`, revision `329M50000002023_20261101_508M60000008045`, article 第八条の十三.

| id | H (falsifiable hypothesis) | T (reproduction test) | D (verdict) | C (competing reading) | U (uncertainty) |
|---|---|---|---|---|---|
| H1 | 「十分の七」was modelled as 7/10 rounded up | `grantAmount 100 3 4 0 = 52` (75×7=525, floor /10 = 52) | PASS — Nat floor division, consistent with 円 units | Exact fractional yen would need a rounding rule not stated in the clause | none |
| H2 | Refund is added rather than deducted | `grantAmount 100 3 4 100 = 0` (75-100 saturates to 0) | PASS — deduction with Nat saturation | A negative grant is not a permissible amount | Nat cannot express negative yen |
| H3 | Proration ignores the area ratio | `grantAmount 100 3 4 0 = 52` vs full-area `70` | PASS — ratio applied before the 7/10 factor | — | none |
| H4 | Zero total area causes an unsound division | `grantAmount 100 3 0 0 = 0` | PASS — guarded branch, no division by zero | — | none |
| H5 | Spec is circular | `specShare` uses `area * tax` (not the impl's `tax * area`); `spec_agrees` proved by `Nat.mul_comm` and case split, no axioms | PASS | — | none |
| H6 | Finite examples mistaken for a universal claim | `spec_agrees` universally quantifies all four inputs | PASS | — | none |
| H7 | Collection period silently dropped | Header records the full verbatim sentence; scope note declares the date test NOT MODELLED | PARTIAL_BY_SCOPE | A stricter reading would require calendar-date modelling | Period facts are external to this clause |

Conclusion: implementation and independent spec agree for all inputs; no `sorry`/`admit`, no unexplained axioms, no legal determination. Human legal review stays pending.
