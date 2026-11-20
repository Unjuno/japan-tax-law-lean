import JapanTaxLaw.TaxFinance

/-!
# DisasterIncomeThreshold — 災害被害者に対する租税の減免等に関する法律 art. 2(1)

Pinned source:
  law 322AC0000000175, revision 322AC0000000175_20220101_503AC0000000011,
  enforcement 2022-01-01, snapshot sha256
  C3BB5B0BDFFBDEFD2EE5F358D90AD9E0922D4C887ECB2B133AA7D613F5F4E7EF.

Normative unit: NORM|89a8b5e3962e7db358a45105bea6669582c82591554b65860296e9fc58cc71cf
Verbatim: 合計所得金額が五百万円以下であるとき。
Kind: CONDITION (適用条件) — the first reduction/exemption band of art. 2(1).

Scope (one normative unit only): the ¥5,000,000 threshold comparison.
The computation of 合計所得金額 (所得税法 art. 22), the 千万円 overall
eligibility ceiling, the other bands, and 政令 details are NOT modelled here.
This is a computable slice, not an article- or law-level completion claim.
-/

namespace JapanTaxLaw.DisasterIncomeThreshold

open JapanTaxLaw.TaxFinance

/-- 五百万円. Unit: yen (Money = Nat); domain: non-negative integers. -/
def threshold : Money := 5_000_000

/-- 第一区分の適用条件: 合計所得金額が五百万円以下であるとき. -/
def inFirstBand (totalIncome : Money) : Bool := decide (totalIncome ≤ threshold)

end JapanTaxLaw.DisasterIncomeThreshold
