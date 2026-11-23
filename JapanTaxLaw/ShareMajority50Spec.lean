import JapanTaxLaw.ShareMajority50

/-
# ShareMajority50Spec — independent spec for 持分百分の五十超

Pinned source: law 344M50000048001, revision 344M50000048001_20260601_508M60000048004.
Source: data/raw/344M50000048001_20260601_508M60000048004.law.json
SHA-256: 16f478fac8e3f64e3bda43d638c4fc98bfd8f5747af82b4e2321ac0648a8b0fe
Article Num 16_12. Needle verbatim:
  「当該他の準組合の準組合財産に対する持分の割合が百分の五十を超える場合における当該持分」

Independent formulation (no implementation identifiers in the spec definitions):
  specMajority = 五十 = 50 (numerator of the percentage threshold);
  specScale = 百分 = 100 (per-hundred denominator, documented for the norm);
  specExceeds p = decide (specMajority < p) — STRICT (超える, NOT 以上).
  p = 50 は対象外 (fails); p = 51 qualifies. 1/3 quorum is a different norm.
-/

namespace JapanTaxLaw.ShareMajority50

def specMajority : Nat := 50

def specScale : Nat := 100

def specExceeds (p : Nat) : Bool := decide (specMajority < p)

theorem agreeMajority : majorityPercent = specMajority := by unfold majorityPercent specMajority; rfl

theorem agreeScale : percentScale = specScale := by unfold percentScale specScale; rfl

theorem agreeExceeds (p : Nat) : exceedsMajority p = specExceeds p := by
  unfold exceedsMajority specExceeds majorityPercent specMajority
  rfl

example : specExceeds 0 = false := by decide
example : specExceeds 50 = false := by decide
example : specExceeds 51 = true := by decide

example : majorityPercent = specMajority := agreeMajority
example : percentScale = specScale := agreeScale
example : exceedsMajority 50 = specExceeds 50 := agreeExceeds 50
example : exceedsMajority 51 = specExceeds 51 := agreeExceeds 51

end JapanTaxLaw.ShareMajority50
