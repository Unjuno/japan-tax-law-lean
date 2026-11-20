import JapanTaxLaw.TaxFinance

/-!
# GiftBasicDeductionUnit — 相続税法 art. 21-5 (gift-tax basic deduction)

Pinned source:
  law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
  enforcement 2026-04-01, snapshot sha256
  C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7.

Normative unit: NORM|52ff866ebec866122bfcf42be9c0fbc69d8bbea9d64fe5975a5e4d7225790ba7
Verbatim: 贈与税については、課税価格から六十万円を控除する。

Scope (one normative unit only): the ¥600,000 deduction itself.
NOT modelled: the computation of 課税価格 (art. 21-2〜21-4), art. 21-6 配偶者控除,
art. 21-9 相続時精算課税, art. 21-13 flat rate, and the art. 21-7 rate table.
This is a computable slice, not an article-level or law-level completion claim.

Independent original-text audit: docs/SOURCE_AUDIT_GIFT_BASIC_DEDUCTION_20261120.md
records SRC-GBD-1: the same fragment also occurs in art. 21-11-2, so a text
match alone is not an article locator. This unit is pinned by article number
and exact source span (see the persistent norm-unit queue).
-/

namespace JapanTaxLaw.GiftBasicDeductionUnit

/-- 六十万円. Unit: yen (Money = Nat); domain: non-negative integers. -/
def basicDeduction : Money := 600_000

/-- 控除後の課税価格. 課税価格が控除額以下のときは零 (no negative tax base). -/
def taxableBaseAfterDeduction (taxableBase : Money) : Money :=
  if taxableBase ≤ basicDeduction then 0 else taxableBase - basicDeduction

end JapanTaxLaw.GiftBasicDeductionUnit
