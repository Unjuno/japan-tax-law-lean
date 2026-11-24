import Std
import JapanTaxLaw.TaxFinance

/-
# SpecialIncomeTaxCreditCap25 — 租税特別措置法 第四十一条の十八 第二項
（控除額の上限：所得税額の百分の二十五、百円未満切り捨て）

Pinned sources:
  Law id: 332AC0000000026 (租税特別措置法)
  Revision: 332AC0000000026_20261101_507AC0000000013 (enforced 2026-11-01)
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
  SHA-256 (raw bytes): e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee
  Article Num 41_18, Paragraph Num 2, Sentence 2.
  source_path: LawBody[3]/MainProvision/MainProvision[1]/Article:41_18/Article#41_18/Paragraph#2/ParagraphSentence/Sentence#2
  Normative unit: NORM|93070e2906c9df8b4d204aaa6d6539a2e60e2843d8d930ca16be14deaba3d888

Verbatim 原文 needle (scoped to Article 41_18 Paragraph 2):
  「当該控除する金額が、当該個人のその年分の所得税の額の百分の二十五に相当する金額を超えるときは」

Variable contract:
  credit = 当該控除する金額 (caller-established, 円)
  tax    = 当該個人のその年分の所得税の額 (caller-established, 円)
  capAmount tax = 100 × floor( (tax × 25 / 100) / 100 )
    i.e. 25% of tax, then 百円未満の端数切り捨て (as the parenthetical directs).
  allowedCredit credit tax = min credit (capAmount tax)
    i.e. if credit > cap then cap else credit (超える is strict).

Scope: ONLY this cap + the explicit 100-yen floor. The computation of `credit`
(paragraph 1, 取得価額 × 政令割合), of `tax`, eligibility, paragraph 3 carryforward,
and any rounding of `credit` itself are NOT MODELLED. The clause gives no rule
for sub-yen fractions of tax×25/100; Nat division floors only yen units before
the statutory 100-yen floor. No half-up/near rounding is introduced.
-/

namespace JapanTaxLaw.SpecialIncomeTaxCreditCap25

/-- 百分の二十五の分子。 -/
def rateNumerator : Nat := 25

/-- 百分の二十五の分母。 -/
def rateDenominator : Nat := 100

/-- 原文の端数単位「百円未満」。 -/
def floorUnitYen : Nat := 100

/-- 控除限度額 = 所得税額×25/100 を百円単位に切り捨て。 -/
def capAmount (tax : Nat) : Nat :=
  floorUnitYen * ((tax * rateNumerator / rateDenominator) / floorUnitYen)

/-- 控除する金額の上限適用（超えるときは上限、それ以外はそのまま）。 -/
def allowedCredit (credit : Nat) (tax : Nat) : Nat :=
  min credit (capAmount tax)

theorem numerator_is_twenty_five : rateNumerator = 25 := rfl
theorem denominator_is_hundred : rateDenominator = 100 := rfl
theorem floor_unit_is_hundred_yen : floorUnitYen = 100 := rfl

/-- 切り捨て後の上限は切り捨て前を超えない。 -/
theorem cap_never_exceeds_raw (tax : Nat) :
    capAmount tax <= tax * rateNumerator / rateDenominator := by
  unfold capAmount floorUnitYen rateNumerator rateDenominator
  omega

/-- 切り捨てる端数は百円未満。 -/
theorem floor_remainder_lt_hundred (tax : Nat) :
    tax * rateNumerator / rateDenominator - capAmount tax < floorUnitYen := by
  unfold capAmount floorUnitYen rateNumerator rateDenominator
  omega

/-- 上限以下なら控除額はそのまま。 -/
theorem allowed_below_cap (credit tax : Nat) (h : credit <= capAmount tax) :
    allowedCredit credit tax = credit := by
  unfold allowedCredit
  exact Nat.min_eq_left h

/-- 上限を超えるなら上限を適用（strict 超える）。 -/
theorem allowed_over_cap (credit tax : Nat) (h : capAmount tax < credit) :
    allowedCredit credit tax = capAmount tax := by
  unfold allowedCredit
  exact Nat.min_eq_right (Nat.le_of_lt h)

/-- 控除額について単調。 -/
theorem allowed_monotone_credit (c₁ c₂ tax : Nat) (h : c₁ <= c₂) :
    allowedCredit c₁ tax <= allowedCredit c₂ tax := by
  unfold allowedCredit
  omega

end JapanTaxLaw.SpecialIncomeTaxCreditCap25
