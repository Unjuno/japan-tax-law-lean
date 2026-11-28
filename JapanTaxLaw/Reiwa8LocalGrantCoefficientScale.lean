import Std
import JapanTaxLaw.TaxFinance

/-
# Reiwa8LocalGrantCoefficientScale — 令和八年度分の地方交付税の交付額の特例に関する省令 第一条 第一項
（令和七年度分普通交付税額 × 〇・二四八九七八七六三四）

Pinned sources:
  Law id: 508M60000008056 (令和八年度分の地方交付税の交付額の特例に関する省令)
  Revision: 508M60000008056_20260401_000000000000000
  Raw snapshot: data/raw/508M60000008056_20260401_000000000000000.law.json
  Article 1, Paragraph 1, ParagraphSentence, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit: NORM|5c8f3cc61c13034ccbf09da6948c18292a52df5af294a39949a09ee7e2181769

Verbatim 原文 needle (scoped to Article 1 Paragraph 1):
  「令和八年四月において各地方団体に対して交付すべき地方交付税の額は、地方交付税法第十六条第一項の規定にかかわらず、当該地方団体の令和七年度分の普通交付税の額に〇・二四八九七八七六三四を乗じて得た額とする。」

Variable contract:
  coefficientNumerator / coefficientDenominator = 〇・二四八九七八七六三四
      = 2489787634 / 10^10 (exact rational; no rounding is stated)
  prev = 令和七年度分の普通交付税の額 (caller-established, Nat 円)
  scaledNumerator prev = prev × coefficientNumerator, over coefficientDenominator
  scaled prev : Rat = scaledNumerator prev / coefficientDenominator

「地方交付税法第十六条第一項の規定にかかわらず」 is the override relation:
the general rule is NOT applied here. It is recorded, not re-formalized.

All kernel proofs are Nat equalities/inequalities (decide); Rat values are
declarations only, so no tactic beyond the kernel is needed.

Out of scope: the ただし書 proviso (discretionary non-delivery), 地方交付税法
第十六条第一項 itself, Art. 2 recomputation, the budget derivation of the
coefficient, any yen rounding, other laws/articles, and legal effects.
No human legal review; LEGAL_REVIEW_PENDING.
-/

namespace JapanTaxLaw.Reiwa8LocalGrantCoefficientScale

/-- 原文の係数 〇・二四八九七八七六三四 の分子。 -/
def coefficientNumerator : Nat := 2489787634

/-- 原文の係数の分母（十 Decimal places）。 -/
def coefficientDenominator : Nat := 10000000000

/-- 係数の exact rational 値（端数処理なし）。 -/
def coefficient : Rat :=
  (coefficientNumerator : Rat) / coefficientDenominator

/-- 乗じて得た額の分子。 -/
def scaledNumerator (prev : Nat) : Nat :=
  prev * coefficientNumerator

/-- 乗じて得た額（exact rational）。 -/
def scaled (prev : Nat) : Rat :=
  (scaledNumerator prev : Rat) / coefficientDenominator

theorem numerator_is_statutory : coefficientNumerator = 2489787634 := rfl
theorem denominator_is_ten_places : coefficientDenominator = 10000000000 := rfl

-- 境界: 零 / 分母で割り切れる / 単調性 / 係数 < 1 / 正
theorem scaled_numerator_zero : scaledNumerator 0 = 0 := by decide
theorem scaled_numerator_base :
    scaledNumerator 10000000000 = 2489787634 * coefficientDenominator := by decide
theorem scaled_numerator_mono : scaledNumerator 1 < scaledNumerator 2 := by decide
theorem coefficient_lt_one : coefficientNumerator < coefficientDenominator := by decide
theorem coefficient_pos : 0 < coefficientNumerator := by decide

end JapanTaxLaw.Reiwa8LocalGrantCoefficientScale
