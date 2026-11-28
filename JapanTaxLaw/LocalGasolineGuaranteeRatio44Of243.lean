import Std
import JapanTaxLaw.TaxFinance

/-
# LocalGasolineGuaranteeRatio44Of243 — 地方揮発油税法施行令 第一条 第一項
（担保は揮発油税額の二百四十三分の四十四に相当する地方揮発油税額をあわせて担保）

Pinned sources:
  Law id: 330CO0000000151 (地方揮発油税法施行令)
  Revision: 330CO0000000151_20241001_506CO0000000148 (enforced 2024-10-01)
  Raw snapshot: data/raw/330CO0000000151_20241001_506CO0000000148.law.json
  Article 1 (担保の提供), Paragraph 1, ParagraphSentence, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit: NORM|1455a3a86064b7db84e20eb4c0122448e475c41f8667698879a38552457dd7fd

Verbatim 原文 needle (scoped main Article 1):
  「…その提供する各担保物又は保証人の保証において、揮発油税額の二百四十三分の四十四に相当する地方揮発油税額をあわせて担保しなければならない。」

Variable contract:
  numerator   = 四十四 = 44
  denominator = 二百四十三 = 243   (gcd 44 243 = 1)
  gasolineTax = 揮発油税額 (caller-established, Nat 円)
  localShare  = gasolineTax × 44 / 243 (exact rational, no rounding stated)

The kernel-decided relation is the exact integer equation
  243 * localShareNumerator = 44 * gasolineTax
for the divisible case (e.g. gasolineTax = 243 → localShare = 44).

Out of scope: who provides security under 揮発油税法 13/18, computation of
揮発油税額 itself, security object/guarantor classification, procedures,
fractional-yen rounding, art. 2, all 附則 provisions, and legal effects.
No human legal review; LEGAL_REVIEW_PENDING.
-/

namespace JapanTaxLaw.LocalGasolineGuaranteeRatio44Of243

/-- 原文の分子「四十四」= 44。 -/
def ratioNumerator : Nat := 44

/-- 原文の分母「二百四十三」= 243。 -/
def ratioDenominator : Nat := 243

/-- 地方揮発油税額の exact rational 値。 -/
def localShare (gasolineTax : Nat) : Rat :=
  (gasolineTax : Rat) * ratioNumerator / ratioDenominator

theorem numerator_is_44 : ratioNumerator = 44 := rfl
theorem denominator_is_243 : ratioDenominator = 243 := rfl

-- 既約・真分数・零・倍数境界
theorem coprime_44_243 : Nat.gcd ratioNumerator ratioDenominator = 1 := by decide
theorem proper_fraction : ratioNumerator < ratioDenominator := by decide
theorem exact_relation_base : ratioDenominator * 44 = ratioNumerator * 243 := by decide
theorem exact_relation_zero : ratioDenominator * 0 = ratioNumerator * 0 := by decide
theorem exact_relation_double : ratioDenominator * 88 = ratioNumerator * 486 := by decide

end JapanTaxLaw.LocalGasolineGuaranteeRatio44Of243
