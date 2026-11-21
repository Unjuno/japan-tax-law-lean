import JapanTaxLaw.DependentAgeSupport

/-
# DependentAgeSupportSpec — independent spec for 329AC0000000149 art. 2

Law id: 329AC0000000149
Revision: 329AC0000000149_20190107_430AC0000000016
Raw snapshot: data/raw/329AC0000000149_20190107_430AC0000000016.law.json
sha256: cb970b2673e9c788e414eca62f92a630d2acce975cda1233251834b874e653a6
Statutory article: 第二条 (art. 2; raw JSON Article attr.Num = "2")
原文逐語: 「国際連合の軍隊の構成員又は軍属の配偶者及び二十一歳未満の子並びに父母及び二十一歳以上の子のうちその生計費の十分の五以上を国際連合の軍隊の構成員又は軍属が負担するもので、日本国内にある間におけるものをいう。」

INDEPENDENT FORMULATION. This module owns its own statutory constants
`specAge : Nat := 21` (二十一歳), `specNum : Nat := 5` and `specDen : Nat := 10`
(十分の五 = 5/10), and deliberately uses a DIFFERENT operator ordering from the
implementation: 「未満」 is `specAge > a` (impl `a < 21`) and 「十分の五以上」 is
`specNum * t <= specDen * b` (impl `10 * b >= 5 * t`). The `t > 0` guard records
the same undefined-ratio rule as the implementation. No implementation identifier
(supportRatioMet / isDependentChild / isDependentAdultChild) occurs in any
independent formula; the only bridge is the universal, kernel-checked omega
theorems agreeUnderAge / agreeSupportMet / agreeAdultChild below.

Not modelled (as in the implementation): the 配偶者 and 父母 branches (no numerals),
the 日本国内にある間 limitation, other articles and 政令 details.
-/

namespace JapanTaxLaw.DependentAgeSupport

/-- Independent 二十一歳 = 21 (単位 歳). -/
def specAge : Nat := 21

/-- Independent 十分の五 numerator = 5. -/
def specNum : Nat := 5

/-- Independent 十分の五 denominator = 10. -/
def specDen : Nat := 10

/-- 「二十一歳未満」 as `specAge > a` — operands reversed vs the impl's `a < 21`. -/
def specUnderAge (a : Nat) : Bool :=
  decide (specAge > a)

/-- 「十分の五以上」 as `specNum * t <= specDen * b` — operator and operands swapped
    vs the impl's `10 * b >= 5 * t`; `t = 0` leaves the ratio undefined (false). -/
def specSupportMet (b t : Nat) : Bool :=
  decide (t > 0 && specNum * t <= specDen * b)

/-- The 21+ child predicate, built only from the independent primitives. -/
def specAdultChild (a b t : Nat) : Bool :=
  decide (specAge <= a) && specSupportMet b t

/-- Universal bridge for 「未満」: omega proves `a < 21` equivalent to `21 > a`. -/
theorem agreeUnderAge (a : Nat) :
    isDependentChild a = specUnderAge a := by
  unfold isDependentChild specUnderAge specAge
  by_cases h : a < 21
  · have hgt : 21 > a := by omega
    simp [h, hgt]
  · have hngt : ¬ 21 > a := by omega
    simp [h, hngt]

/-- Universal bridge for 「十分の五以上」: omega converts the impl's
    `10 * b >= 5 * t` into the spec's `5 * t <= 10 * b`. -/
theorem agreeSupportMet (b t : Nat) :
    supportRatioMet b t = specSupportMet b t := by
  unfold supportRatioMet specSupportMet specNum specDen
  by_cases hpos : t > 0
  · by_cases h : 10 * b >= 5 * t
    · have hs : 5 * t <= 10 * b := by omega
      simp [hpos, h, hs]
    · have hns : ¬ 5 * t <= 10 * b := by omega
      simp [hpos, h, hns]
  · simp [hpos]

/-- Universal bridge for the 21+ child predicate: conjunction of the two bridges. -/
theorem agreeAdultChild (a b t : Nat) :
    isDependentAdultChild a b t = specAdultChild a b t := by
  unfold isDependentAdultChild specAdultChild specAge specSupportMet specNum specDen
  by_cases ha : 21 <= a
  · by_cases hpos : t > 0
    · by_cases h : 10 * b >= 5 * t
      · have hs : 5 * t <= 10 * b := by omega
        simp [ha, hpos, h, hs]
      · have hns : ¬ 5 * t <= 10 * b := by omega
        simp [ha, hpos, h, hns]
    · simp [ha, hpos]
  · simp [ha]

-- Spec-local, kernel-decided spot-checks (scaffolding, not the statutory formula).
example : specAge = 21 := by decide
example : specNum = 5 := by decide
example : specDen = 10 := by decide
example : specUnderAge 0 = true := by decide
example : specUnderAge 20 = true := by decide
example : specUnderAge 21 = false := by decide
example : specSupportMet 499 1000 = false := by decide
example : specSupportMet 500 1000 = true := by decide
example : specSupportMet 501 1000 = true := by decide
example : specSupportMet 1 0 = false := by decide

end JapanTaxLaw.DependentAgeSupport
