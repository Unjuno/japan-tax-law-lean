import JapanTaxLaw.TaxFinance

/-
# HeiseiFY7Attribution — 公債収入 第二条（平成7年度所属の歳入）

Pinned source:
  Law id: 408AC0000000002
  Revision: 408AC0000000002_19960223_000000000000000
  Raw snapshot: data/raw/408AC0000000002_19960223_000000000000000.law.json
  SHA-256: 3ff89a7a62e99caa577bf83a447ae1836cdbbcfc778caf6686316921fef52a5f
  Statutory article: 第二条 (raw JSON Article attr.Num = "2")

原文逐語（scoped Article 2 の一字一句改変なしの引用）:
  「この場合において、同年四月一日以後発行される同条の公債に係る収入は、平成七年度所属の歳入とする。」

Variable contract:
  fy : Nat = 年度 / 平成年份 — e.g. 7 = 平成7年度.
  所属の歳入 = the revenue belongs to EXACTLY fiscal year 平成7 (fy == 7).
  This is a single year and NOT a range. `belongsToAttributedFY fy` is true
  iff fy == 7.

Scope / BY-DESIGN:
  - Model ONLY the explicit temporal attribution of this bond's revenue:
    revenue from bonds issued on/after April 1 of that year is attributed to
    fiscal year 平成7年度 (所属の歳入).
  - This is a SINGLE-YEAR fiscal attribution (所属の歳入), distinct from the
    earlier BondRevenueFiscalYear (昭和51) model — a different law and year —
    and from any fiscal-year RANGE window.
  - Bond issuance details, revenue amounts, and other provisions are NOT MODELLED.
-/

namespace JapanTaxLaw.HeiseiFY7Attribution

/-- 平成七年度 — the attributed fiscal year = 7. -/
def attributedFY : Nat := 7

/-- 「平成七年度所属の歳入」: true iff fy is exactly 平成7年度. -/
def belongsToAttributedFY (fy : Nat) : Bool := decide (fy == attributedFY)

theorem attributedFY_value : attributedFY = 7 := rfl

theorem belongsToAttributedFY_6 : belongsToAttributedFY 6 = false := by decide

theorem belongsToAttributedFY_7 : belongsToAttributedFY 7 = true := by decide

theorem belongsToAttributedFY_8 : belongsToAttributedFY 8 = false := by decide

theorem belongsToAttributedFY_0 : belongsToAttributedFY 0 = false := by decide

end JapanTaxLaw.HeiseiFY7Attribution
