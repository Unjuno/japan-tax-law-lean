import JapanTaxLaw.TaxFinance

/-
# RegistrationTaxFloor1k — 登録免許税法 第十九条（計算額が千円に満たない場合の下限）

Pinned source:
  Law id: 342AC0000000035
  Official title: 登録免許税法
  Law type: Act (法律)
  Revision: 342AC0000000035_20261101_508AC0000000021
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  sha256: 95240c3d9b384e58834cb30a3bee32470be86d7295d9544fe141f327f8adfa15
  Statutory article: 第十九条 (art. 19; raw JSON Article attr.Num = "19")
  Source path: LawBody/MainProvision/Chapter#2/Article#19

原文逐語（pinned, 一字一句改変なし）:
  「別表第一に掲げる登記又は登録につき同表に掲げる税率を適用して計算した金額が千円に満たない場合には、当該登記又は登録に係る登録免許税の額は、千円とする。」

Variable contract:
  `computed : Nat` = 別表の税率を適用して計算した金額 (unit 円, whole yen).
  `minimumTax : Nat := 1000` = 千円, the statutory minimum tax.
  `taxWithFloor (computed : Nat) : Nat := max computed minimumTax` (minimum-floor/max structure).
  千円に満たない = computed < 1000 → tax = 1000; otherwise tax = computed.

Scope: ONLY the explicit minimum-tax floor in this article is modelled.
  The 別表第一 rates/fees live in other modules; the rate computation itself,
  other articles and enforcement rules are NOT MODELLED. This art.19 floor is
  distinct from those 別表 fee tables.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.RegistrationTaxFloor1k

/-- 千円 = ¥1,000. Unit 円; domain Nat. -/
def minimumTax : Nat := 1000

/-- 「計算した金額が千円に満たない場合には…税額は千円とする」: tax = max(computed, 千円). -/
def taxWithFloor (computed : Nat) : Nat := max computed minimumTax

/-- Zero computed amount is below 千円: tax = 1000. -/
theorem taxWithFloor_zero : taxWithFloor 0 = 1000 := by
  decide

/-- 999 < 1000: just below the floor, tax = 1000. -/
theorem taxWithFloor_999 : taxWithFloor 999 = 1000 := by
  decide

/-- Exactly 千円: tax = 1000. -/
theorem taxWithFloor_1000 : taxWithFloor 1000 = 1000 := by
  decide

/-- 1001 > 1000: just above the floor, tax = computed. -/
theorem taxWithFloor_1001 : taxWithFloor 1001 = 1001 := by
  decide

/-- Well above the floor: tax = computed. -/
theorem taxWithFloor_5000 : taxWithFloor 5000 = 5000 := by
  decide

/-- The pinned statutory constant itself: 千円 = 1000. -/
theorem minimumTax_value : minimumTax = 1000 := rfl

end JapanTaxLaw.RegistrationTaxFloor1k
