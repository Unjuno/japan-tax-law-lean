import JapanTaxLaw.TaxFinance

/-
# BondRevenueFiscalYear — 公債収入 第二条（昭和51年度所属の歳入）

Pinned source:
  Law id: 352AC0000000035
  Revision: 352AC0000000035_19770504_000000000000000
  Raw snapshot: data/raw/352AC0000000035_19770504_000000000000000.law.json
  SHA-256: 038efcee43b35b2d7fa50fd4831ae81da57d7b485250661e04faba452a1fbe41
  Statutory article: 第二条 (raw JSON Article attr.Num = "2")

原文逐語（scoped Article 2 の一字一句改変なしの引用）:
  「この場合において、当該公債に係る収入は、昭和五十一年度所属の歳入とする。」

Variable contract:
  fy : Nat = 年度 / 昭和年份 — e.g. 51 = 昭和51年度.
  所属の歳入 = the revenue belongs to EXACTLY fiscal year 昭和51.
  This is a single year and NOT a range. `belongsToAttributedFY fy` is true
  iff fy == 51.

Scope / BY-DESIGN:
  - Model ONLY the explicit temporal attribution of this bond's revenue.
  - This is a SINGLE-YEAR attribution (所属の歳入), distinct from the earlier
    fiscal-year RANGE window [47,52] of MergerGrantFiscalWindow.
  - Bond issuance, revenue amount, and other provisions are NOT MODELLED.
-/

namespace JapanTaxLaw.BondRevenueFiscalYear

/-- 昭和五十一年度 — the attributed fiscal year = 51. -/
def attributedFY : Nat := 51

/-- 「昭和五十一年度所属の歳入」: true iff fy is exactly 昭和51年度. -/
def belongsToAttributedFY (fy : Nat) : Bool := decide (fy == attributedFY)

theorem attributedFY_value : attributedFY = 51 := rfl

theorem belongsToAttributedFY_50 : belongsToAttributedFY 50 = false := by decide

theorem belongsToAttributedFY_51 : belongsToAttributedFY 51 = true := by decide

theorem belongsToAttributedFY_52 : belongsToAttributedFY 52 = false := by decide

theorem belongsToAttributedFY_0 : belongsToAttributedFY 0 = false := by decide

end JapanTaxLaw.BondRevenueFiscalYear
