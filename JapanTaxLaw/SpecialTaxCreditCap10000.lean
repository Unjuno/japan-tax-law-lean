import Std
import JapanTaxLaw.TaxFinance

/-
# SpecialTaxCreditCap10000 — 地方税法 附則 第五条の十二 第四項
（令和七年度分特別税額控除額：所得割一万円超の分岐と一万円からの控除）

Pinned sources:
  Law id: 325AC0000000226 (地方税法)
  Revision: 325AC0000000226_20261101_508AC0000000002 (enforced 2026-11-01)
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 5_12 (SupplProvision), Paragraph Num 4, Sentence 1.
  source_path: LawBody[3]/SupplProvision/SupplProvision[23]/Article:5_12/Article#5_12/Paragraph#4/ParagraphSentence/Sentence#1
  Normative unit: NORM|76503baf5d2bf21da3ce709a1c9f6569864b18368a906b0dcd1497f69d20d291

Verbatim 原文 needle (scoped to Article 5_12 Paragraph 4):
  「前項の市町村民税に係る令和七年度分特別税額控除額は、個人の住民税の所得割の額が一万円を超える場合には一万円から道府県民税特別税額控除額を控除して得た金額とし、個人の住民税の所得割の額が一万円を超えない場合には第二項第二号に掲げる額に相当する金額とする。」

Variable contract:
  incomePortion = 個人の住民税の所得割の額 (caller-established, Nat 円)
  prefCredit    = 道府県民税特別税額控除額 (caller-established, 円)
  fallback      = 第二項第二号に掲げる額 (caller-established, 円)
  ceilingYen    = 一万円 = 10000

Computation:
  if incomePortion > 10000 then 10000 − prefCredit else fallback.
  「超える」 is STRICT: incomePortion = 10000 takes the fallback branch.
  The subtraction is modelled on Int: the clause gives NO rule for
  prefCredit > 10000, so a Nat saturating subtraction would invent a floor
  of 0. A negative result is kept explicitly instead of being silently
  clamped.

Scope: ONLY this branch + subtraction. The computation of prefCredit, the
第二項第二号 amount, 令和七年度 eligibility, other paragraphs of 附則5の12,
other 附則 articles, and assessment/collection are NOT MODELLED. No rounding
rule is stated or imported.
-/

namespace JapanTaxLaw.SpecialTaxCreditCap10000

/-- 原文の「一万円」= 10000 円。 -/
def ceilingYen : Nat := 10000

/-- 特別税額控除額（符号付き。超えるは strict、下限の架空導入なし）。 -/
def specialCredit (incomePortion : Nat) (prefCredit : Int) (fallback : Int) : Int :=
  if ceilingYen < incomePortion then (ceilingYen : Int) - prefCredit else fallback

theorem ceiling_is_10000 : ceilingYen = 10000 := rfl

/-- 一万円を超える場合: 一万円 − 道府県民税特別税額控除額。 -/
theorem above_ceiling (income : Nat) (pref fb : Int) (h : ceilingYen < income) :
    specialCredit income pref fb = (ceilingYen : Int) - pref := by
  unfold specialCredit
  simp [h]

/-- 一万円を超えない場合: 第二項第二号の額。 -/
theorem at_or_below_ceiling (income : Nat) (pref fb : Int) (h : income <= ceilingYen) :
    specialCredit income pref fb = fb := by
  unfold specialCredit
  simp [Nat.not_lt.mpr h]

/-- strict 境界: 一万円丁度は控除額側（超えるではない）。 -/
theorem exactly_ceiling_uses_fallback (pref fb : Int) :
    specialCredit ceilingYen pref fb = fb := by
  unfold specialCredit
  simp

/-- 控除額が一万円を超えても結果を負で保持（ゼロに丸めない）。 -/
theorem negative_result_is_kept : specialCredit 10001 12000 7 = -2000 := by decide

/-- 零入力・.zero 控除。 -/
theorem zero_pref_credit : specialCredit 10001 0 7 = 10000 := by decide
theorem zero_income : specialCredit 0 0 0 = 0 := by decide

end JapanTaxLaw.SpecialTaxCreditCap10000
