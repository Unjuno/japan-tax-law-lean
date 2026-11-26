# Decomposition finding — UnusedDeduction table-cell concatenations

Mechanical audit `unused_audit.json`: 62/62 unique IDs, 62/62 pinned SHA,
62/62 verbatim phrase, but only **49/62** `norm_fragment` values are contiguous
substrings of the pinned source; 13 are non-contiguous.

Inspection (`diag_noncontig.py`) shows these 13 are **table row label + cell
content concatenations**, e.g.
「公開等特定株式に係る事業所得の金額の計算上生じた損失の金額」 +
「当該損失の金額は、まず…控除し、なお控除しきれない損失の金額があるとき」.
The modeled clause 「…控除しきれない金額/損失」 IS verbatim contiguous in the
pinned source for all 13; it is the queue's merged fragment that is not.

## H/T/D/C/U
- H = each unit's `norm_fragment` is a verbatim contiguous span of the pinned version.
- T = normalized-substring check of every fragment against the pinned source.
- D = FAIL for 13/62 (list in `unused_audit.json`); PASS for 49/62.
- C = the non-contiguity is a decomposition artifact (two table cells joined),
  not a discrepancy in the modeled arithmetic clause.
- U = the 13 units are kept at `PROVED_SCOPE` with blocker
  `NON_CONTIGUOUS_TABLE_CELL_SPAN`; no FULLY_VERIFIED claim for them until the
  span is re-derived per table cell by an auditable ID-preserving decomposition
  change. No adversarial axis claimed for them at the fragment level.

Not legal advice; not a completeness claim.
