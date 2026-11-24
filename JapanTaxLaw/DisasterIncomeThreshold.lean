import JapanTaxLaw.TaxFinance

/-!
# DisasterIncomeThreshold — 昭和二十二年法律第百七十五号 art. 2(1) threshold

Source (pinned): law 322AC0000000175, revision
`322AC0000000175_20220101_503AC0000000011`, enforcement 2022-01-01,
snapshot `data/raw/322AC0000000175_20220101_503AC0000000011.law.json`.

Normative unit: `NORM|89a8b5e3962e7db358a45105bea6669582c82591554b65860296e9fc58cc71cf`
Verbatim: 「合計所得金額が五百万円以下であるとき」 — total income not above
¥5,000,000 falls in the first relief band (所得税の額の全部).

Scope: only the threshold predicate. The outer applicability conditions
(災害被害, 千万円以下, 政令) and the other bands are caller-established and
are NOT modelled or claimed here. The threshold value is caller-established for
the predicate input; no tax amount is computed by this module.
-/
namespace JapanTaxLaw.DisasterIncomeThreshold

/-- 五百万円, in yen. The numeral and unit are recorded explicitly. -/
def thresholdYen : Nat := 5_000_000

/-- Art. 2(1) first band: true iff 合計所得金額 ≤ ¥5,000,000. -/
def eligible (totalIncomeYen : Nat) : Bool :=
  decide (totalIncomeYen <= thresholdYen)

theorem eligible_zero : eligible 0 = true := by decide
theorem eligible_below : eligible 4_999_999 = true := by decide
theorem eligible_at_boundary : eligible 5_000_000 = true := by decide
theorem eligible_above : eligible 5_000_001 = false := by decide

end JapanTaxLaw.DisasterIncomeThreshold
