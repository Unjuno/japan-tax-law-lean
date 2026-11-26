import Std
import JapanTaxLaw.TaxFinance

/-
# SpecialTonSecurityEightTen — 特別とん税法施行令 第三条 第一項
（担保提供時にあわせて担保すべき特別とん税額＝とん税額の八分の十）

Pinned sources:
  Law id: 332CO0000000049 (特別とん税法施行令)
  Revision: 332CO0000000049_20201001_502CO0000000128
  Raw snapshot: data/raw/332CO0000000049_20201001_502CO0000000128.law.json
  Article Num 3, Paragraph Num 1, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[2]/Article:3/Article#3/Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit: NORM|5a55f1f8bd24707dc7c4f3824337307fd70c43456e768693d63c2a9c453676b6

Verbatim 原文 needle (scoped to Article 3 Paragraph 1):
  「とん税額の八分の十に相当する特別とん税額をあわせて担保しなければならない。」

Variable contract:
  tonAmount = とん税額 (caller-established, 円)
  rateNumerator = 十 = 10, rateDenominator = 八 = 8
  specialAmountTimesDenominator ton = ton × 10 — the exact numerator of the
  special tonnage tax with denominator 8 (i.e. 10/8 = 5/4 of tonAmount).

「八分の十」 is an improper fraction greater than one; this clause states NO
rounding rule. The model therefore keeps the exact rational relationship
(times-denominator form) and does NOT import a Nat truncation or a floor.

Scope: ONLY this 10/8 multiplier and the obligation to cover it in the security.
The classification of 担保物/保証人, とん税法施行令 art.6 procedures, とん税法
art.9(2) procedures, the computation of とん税額 itself, paragraph 2 準用 and
all discretionary/legal judgements are NOT MODELLED.
-/

namespace JapanTaxLaw.SpecialTonSecurityEightTen

/-- 原文の「十」= 10（八分の十の分子）。 -/
def rateNumerator : Nat := 10

/-- 原文の「八」= 8（八分の十の分母）。 -/
def rateDenominator : Nat := 8

/-- 特別とん税額の分母倍（ton × 10、分母 8 を保持）。 -/
def specialAmountTimesDenominator (tonAmount : Nat) : Nat :=
  tonAmount * rateNumerator

theorem numerator_is_ten : rateNumerator = 10 := rfl
theorem denominator_is_eight : rateDenominator = 8 := rfl

/-- 八分の十 = 10/8 = 5/4（端数を導入せず exact）。 -/
theorem rate_equals_five_fourths : rateNumerator * 4 = rateDenominator * 5 := by decide

/-- 零入力・小さい入力。 -/
theorem zero_amount : specialAmountTimesDenominator 0 = 0 := by decide
theorem small_amount : specialAmountTimesDenominator 1 = 10 := by decide

/-- 境界: 分子 10 の L-1 / L / L+1。 -/
theorem boundary_below : specialAmountTimesDenominator 9 = 90 := by decide
theorem boundary_at : specialAmountTimesDenominator 10 = 100 := by decide
theorem boundary_above : specialAmountTimesDenominator 11 = 110 := by decide

/-- 境界: 分母 8 の L-1 / L / L+1。 -/
theorem denominator_below : specialAmountTimesDenominator 7 = 70 := by decide
theorem denominator_at : specialAmountTimesDenominator 8 = 80 := by decide
theorem denominator_above : specialAmountTimesDenominator 9 = 90 := by decide

end JapanTaxLaw.SpecialTonSecurityEightTen
