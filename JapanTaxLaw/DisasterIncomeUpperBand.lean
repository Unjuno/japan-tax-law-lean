import JapanTaxLaw.TaxFinance

/-!
# DisasterIncomeUpperBand — 昭和二十二年法律第百七十五号 art. 2(1) third band

Pinned source: law 322AC0000000175, revision
`322AC0000000175_20220101_503AC0000000011`, snapshot
`data/raw/322AC0000000175_20220101_503AC0000000011.law.json`.

Normative unit: `NORM|2a1dc80cd4074bee88062395289ab4abddf8db19565f3d14b6d56b4003fbfb01`
Verbatim: 「合計所得金額が七百五十万円を超えるとき」 — total income above
¥7,500,000 falls in the third relief band (所得税の額の十分の二・五).

Scope: only the strict-exceedance predicate. The other bands, the disaster and
¥10M applicability conditions, and the reduction factor are separate units and
are not modelled here. 合計所得金額 is caller-established.
-/
namespace JapanTaxLaw.DisasterIncomeUpperBand

/-- 七百五十万円, in yen; strict lower edge of this band. -/
def upperThresholdYen : Nat := 7_500_000

/-- True iff 合計所得金額 strictly exceeds ¥7,500,000. -/
def eligibleUpper (totalIncomeYen : Nat) : Bool :=
  decide (upperThresholdYen < totalIncomeYen)

theorem below_edge : eligibleUpper 7_499_999 = false := by decide
theorem at_edge : eligibleUpper 7_500_000 = false := by decide
theorem above_edge : eligibleUpper 7_500_001 = true := by decide
theorem far_above : eligibleUpper 10_000_000 = true := by decide

end JapanTaxLaw.DisasterIncomeUpperBand
