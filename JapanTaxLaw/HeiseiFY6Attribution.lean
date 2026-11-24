import JapanTaxLaw.TaxFinance

/-
# HeiseiFY6Attribution — 公債収入 第二条（平成6年度所属の歳入）

Pinned source:
  Law id: 406AC0000000108
  Revision: 406AC0000000108_20070401_419AC0000000023
  Raw snapshot: data/raw/406AC0000000108_20070401_419AC0000000023.law.json
  SHA-256: dd0bf0ec751b7d5712636c239b74368c514ae7818b4c77c52adcb1fff1f9935b
  Statutory article: 第二条 (raw JSON Article attr.Num = "2")

原文逐語（scoped Article 2 の一字一句改変なしの引用）:
  「この場合において、同年四月一日以後発行される同項の公債に係る収入は、平成六年度所属の歳入とする。」

Variable contract:
  fy : Nat = 年度 / 平成年份 — e.g. 6 = 平成6年度.
  所属の歳入 = the revenue belongs to EXACTLY fiscal year 平成6 (fy == 6).
  This is a single year and NOT a range. `belongsToAttributedFY fy` is true
  iff fy == 6.

Scope / BY-DESIGN:
  - Model ONLY the explicit temporal attribution of this bond's revenue.
  - Single-year fiscal-attribution norm (対象は平成六年度のみ).
  - Bond issuance details, revenue amounts, and other provisions are NOT MODELLED.
-/

namespace JapanTaxLaw.HeiseiFY6Attribution

/-- 平成六年度 — the attributed fiscal year = 6. -/
def attributedFY : Nat := 6

/-- 「平成六年度所属の歳入」: true iff fy is exactly 平成6年度. -/
def belongsToAttributedFY (fy : Nat) : Bool := decide (fy == attributedFY)

theorem attributedFY_value : attributedFY = 6 := rfl

theorem belongsToAttributedFY_5 : belongsToAttributedFY 5 = false := by decide

theorem belongsToAttributedFY_6 : belongsToAttributedFY 6 = true := by decide

theorem belongsToAttributedFY_7 : belongsToAttributedFY 7 = false := by decide

theorem belongsToAttributedFY_0 : belongsToAttributedFY 0 = false := by decide

end JapanTaxLaw.HeiseiFY6Attribution
