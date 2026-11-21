import JapanTaxLaw.PolyesterStapleFiberSpecs

/-
# PolyesterStapleFiberSpecsSpec — independent spec (政令 414CO0000000262, 第一条)

Pinned source:
  Law id: 414CO0000000262
  Revision: 414CO0000000262_20110401_423CO0000000088
  Raw snapshot: data/raw/414CO0000000262_20110401_423CO0000000088.law.json
  sha256: fcfc53577dfbe461896f26630df965f9dac64266a269ba4502bfe019a9bba874
  原文逐語: 「法の別表第五五〇三・二〇号に掲げる合成繊維の短繊維（三・八八デシテックスを超え二十二・二三デシテックス未満のもので、かつ、長さが二十五ミリメートル以上八十ミリメートル以下のものに限る。以下「ポリエステル短繊維」という。）」

INDEPENDENT FORMULATION. This module owns its OWN constants
  specFLow = 388 (三・八八 = 3.88 dtex * 100), specFHigh = 2223 (二十二・二三 = 22.23 dtex * 100),
  specLLow = 25 (二十五 mm), specLHigh = 80 (八十 mm)
and writes each axis with a DIFFERENT surface operator order than the impl:
  fineness: `f > specFLow && f < specFHigh`  (impl uses `finenessLow < f`)
  length:   `len >= specLLow && len <= specLHigh`  (impl uses `lengthLow <= len`)
No implementation identifier (finenessLow / finenessHigh / lengthLow / lengthHigh /
finenessInRange / lengthInRange / isPolyesterStaple) occurs in any independent
definition below. The ONLY impl/spec bridges are the universal, kernel-checked
omega theorems at the bottom of this file.

STRICT vs INCLUSIVE (do not confuse the axes):
  超え / 未満 -> STRICT: 三・八八 = 388 EXCLUDED, 二十二・二三 = 2223 EXCLUDED.
  以上 / 以下 -> INCLUSIVE: 二十五 = 25 INCLUDED, 八十 = 80 INCLUDED.
  Fineness is measured in 1/100 dtex; length is measured in mm. Two dimensionally
  distinct axes — never mix them.

-/

namespace JapanTaxLaw.PolyesterStapleFiberSpecs

/- Independent fineness constants (1/100 dtex). -/
def specFLow : Nat := 388

def specFHigh : Nat := 2223

/- Independent length constants (mm). -/
def specLLow : Nat := 25

def specLHigh : Nat := 80

/- Independent fineness formula: `>` lower bound, swapped operand order. -/
def specF (f : Nat) : Bool :=
  decide (f > specFLow && f < specFHigh)

/- Independent length formula: `>=` lower bound, swapped operand order. -/
def specL (len : Nat) : Bool :=
  decide (len >= specLLow && len <= specLHigh)

/- Independent combined predicate (independent axes only). -/
def specPolyesterStaple (f len : Nat) : Bool :=
  specF f && specL len

/- Universal, kernel-checked bridge for every Nat f: omega proves the swapped
   `>` lower bound equivalent to the impl's `<` lower bound. -/
theorem agree_finenessInRange (f : Nat) :
    finenessInRange f = specF f := by
  unfold finenessInRange specF finenessLow finenessHigh specFLow specFHigh
  by_cases hlo : 388 < f
  · by_cases hhi : f < 2223
    · have hgt : f > 388 := by omega
      simp [hlo, hhi, hgt]
    · have hgt : f > 388 := by omega
      simp [hlo, hhi, hgt]
  · by_cases hhi : f < 2223
    · have hngt : ¬ f > 388 := by omega
      simp [hlo, hhi, hngt]
    · have hngt : ¬ f > 388 := by omega
      simp [hlo, hhi, hngt]

/- Universal, kernel-checked bridge for every Nat len: omega proves the swapped
   `>=` lower bound equivalent to the impl's `<=` lower bound. -/
theorem agree_lengthInRange (len : Nat) :
    lengthInRange len = specL len := by
  unfold lengthInRange specL lengthLow lengthHigh specLLow specLHigh
  by_cases hlo : 25 <= len
  · by_cases hhi : len <= 80
    · have hge : len >= 25 := by omega
      simp [hlo, hhi, hge]
    · have hge : len >= 25 := by omega
      simp [hlo, hhi, hge]
  · by_cases hhi : len <= 80
    · have hnge : ¬ len >= 25 := by omega
      simp [hlo, hhi, hnge]
    · have hnge : ¬ len >= 25 := by omega
      simp [hlo, hhi, hnge]

/- Universal bridge for the conjunction; no new axioms. -/
theorem agree_isPolyesterStaple (f len : Nat) :
    isPolyesterStaple f len = specPolyesterStaple f len := by
  unfold isPolyesterStaple specPolyesterStaple
  rw [agree_finenessInRange f, agree_lengthInRange len]

end JapanTaxLaw.PolyesterStapleFiberSpecs
