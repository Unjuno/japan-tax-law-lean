# Normative units — two boundary-distinct range conditions

Units:
- `NORM|1c103b22b685919f9c3f53da73b614b086b10560aaf307a876b47d609bd63573` — 347CO0000000151 art.19: 「二百万円以上五百万円未満の金額」
- `NORM|21bdc2f2f48a4f6a8b27e5ac0c46bb64c25a7cd885f43e3c416ee231b18b7e6e` — 325AC0000000073 art.23: 「残存期間が二十年を超え二十五年以下のもの」

Both originals were independently extracted from their pinned raw snapshots.
The two units deliberately use **opposite boundary conventions**: the amount
band is lower-inclusive / upper-exclusive (「以上…未満」), while the period band
is lower-exclusive / upper-inclusive (「超え…以下」). Conflating them would be a
one-yen / one-year boundary error; each is proved separately against its own
independent spec.

| id | content |
|---|---|
| H | The amount band is 2,000,000 <= amount < 5,000,000; the period band is 20 < years <= 25. The boundary operators (以上/未満 vs 超え/以下) are taken verbatim from each original. |
| T | `lake build JapanTaxLaw.TaxBandBoundariesTests`; `python scripts/ci/source_audit_tax_bands.py` |
| D | Kernel theorems `inAmountBand_iff` / `inPeriodBand_iff` plus spec-agreement proofs; boundary examples at 1,999,999/2,000,000/4,999,999/5,000,000 and 19/20/21/25/26; both originals found verbatim (5/5 audit checks). |
| C | Competing readings rejected: treating 「未満」 as 「以下」 (amount 5,000,000 incorrectly in-band) and treating 「超え」 as 「以上」 (period 20 incorrectly in-band). The two conventions are NOT interchangeable. |
| U | Amount/year computation, unit conversion, rounding, the surrounding rule's legal effect and all other subitems are NOT MODELLED. Human legal review pending. |

This verifies two boundary conventions, not whole articles.
