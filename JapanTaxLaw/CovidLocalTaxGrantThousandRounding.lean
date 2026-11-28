import Std
import JapanTaxLaw.TaxFinance

/-
# CovidLocalTaxGrantThousandRounding — 新型コロナ地方税減収補塡特別交付金省令 第二条 第一項
（五百円未満切捨て、五百円以上千円未満は千円として計算）

Pinned sources:
  Law id: 504M60000008016 (新型コロナウイルス感染症対策地方税減収補塡
    特別交付金に関する省令)
  Revision: 504M60000008016_20220318_000000000000000
  Raw snapshot: data/raw/504M60000008016_20220318_000000000000000.law.json
  Article 2, Paragraph 1, ParagraphSentence (端数計算).
  Normative unit: NORM|f40b5d9a72ad1f3184d614c5fcd4af008ed78adb510d75c123d0358b3de81862

Verbatim 原文 needle (scoped main Article 2, 180 chars):
  「…その算定の過程及び算定した額に五百円未満の端数があるときはその端数金額を切り捨て、五百円以上千円未満の端数があるときはその端数金額を千円として計算するものとする。」

Variable contract (non-negative integer yen; caller establishes the amount):
  lower  = 五百 = 500
  upper  = 千 = 1000
  r      = amount % 1000
  roundAmount amount =
    r < 500  → amount - r            （端数切り捨て）
    500 <= r → amount - r + 1000     （端数を千円として計算）

Applies both in the course of calculation and to the calculated amount.

Out of scope: the 「特別な定めがある場合」 carve-out, the grant formulas in
arts. 3–4, non-integer/negative money, other laws and all legal conclusions.
Note: the same two-band skeleton is pinned for a different law in the older
`LocalTaxShortfallRounding` module; this is a distinct law/revision/cell pin,
not a global novelty claim. No human legal review; LEGAL_REVIEW_PENDING.
-/

namespace JapanTaxLaw.CovidLocalTaxGrantThousandRounding

/-- 原文の「五百」= 500（円）。 -/
def lowerBand : Nat := 500

/-- 原文の「千」= 1000（円）。 -/
def upperBand : Nat := 1000

/-- 端数を五百/千の二段階で丸めた額。 -/
def roundAmount (amount : Nat) : Nat :=
  let r := amount % upperBand
  if r < lowerBand then amount - r else amount - r + upperBand

theorem lower_is_500 : lowerBand = 500 := rfl
theorem upper_is_1000 : upperBand = 1000 := rfl

-- 境界: r = 0 / 499 / 500 / 999
theorem round_0 : roundAmount 0 = 0 := by decide
theorem round_499 : roundAmount 499 = 0 := by decide
theorem round_500 : roundAmount 500 = 1000 := by decide
theorem round_999 : roundAmount 999 = 1000 := by decide
theorem round_1000 : roundAmount 1000 = 1000 := by decide
theorem round_1499 : roundAmount 1499 = 1000 := by decide
theorem round_1500 : roundAmount 1500 = 2000 := by decide

end JapanTaxLaw.CovidLocalTaxGrantThousandRounding
