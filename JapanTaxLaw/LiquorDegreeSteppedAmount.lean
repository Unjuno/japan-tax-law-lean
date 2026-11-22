import JapanTaxLaw.TaxFinance

/-
# LiquorDegreeSteppedAmount — 酒税法 第二十三条（アルコール分に応じ加算額）

Pinned source:
  Law id: 328AC0000000006
  Official title: 酒税法
  Law type: Act (法律)
  Revision: 328AC0000000006_20260525_506AC0000000052
  Raw snapshot: data/raw/328AC0000000006_20260525_506AC0000000052.law.json
  sha256: 01d87149a80f64fa70d8b6eafffead6341982d902c4d206630cbc3f91c781e70
  Article: 第二十三条 (e-Gov Num = 23)
  Source path: law_full_text/children/1/children/3/children/2/children/2

原文逐語（pinned, 一字一句改変なし）:
  「二十万円（アルコール分が二十一度以上のものにあつては、二十万円にアルコール分が二十度を超える一度ごとに一万円を加えた金額）」

Variable contract:
  degrees : Nat — アルコール分 (度)
  baseAmount = 200_000 円 (二十万円)
  qualifyingDegree = 21 (二十一度以上 — inclusive lower bound)
  degreeFloor = 20 (二十度を超える — strictly above 20)
  perDegreeAmount = 10_000 円 (一万円 per degree above 20)
  feeFor degrees = 200000 + (degrees - 20) * 10000  when 21 <= degrees,
                   otherwise 200000.  The 21 boundary is INCLUSIVE.

Scope: only the explicit stepped-additive numeric structure of Article 23 is
modelled. Licensing, other articles, other taxes and non-Nat degrees are NOT
MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LiquorDegreeSteppedAmount

/-- 二十万円 — base amount. -/
def baseAmount : Nat := 200_000

/-- 二十一度以上 — inclusive qualifying alcohol degree. -/
def qualifyingDegree : Nat := 21

/-- 二十度を超える — strictly-above floor degree. -/
def degreeFloor : Nat := 20

/-- 一万円 — amount added for each degree above 20. -/
def perDegreeAmount : Nat := 10_000

/-- アルコール分に応じ加算額: base plus 10000 per degree above 20 when degree >= 21. -/
def feeFor (degrees : Nat) : Nat :=
  if qualifyingDegree <= degrees then
    baseAmount + (degrees - degreeFloor) * perDegreeAmount
  else
    baseAmount

theorem baseAmount_value : baseAmount = 200_000 := rfl
theorem qualifyingDegree_value : qualifyingDegree = 21 := rfl
theorem degreeFloor_value : degreeFloor = 20 := rfl
theorem perDegreeAmount_value : perDegreeAmount = 10_000 := rfl

end JapanTaxLaw.LiquorDegreeSteppedAmount
