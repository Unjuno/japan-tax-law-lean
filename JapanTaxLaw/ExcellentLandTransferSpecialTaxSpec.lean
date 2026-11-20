import JapanTaxLaw.ExcellentLandTransferSpecialTax

/-!
# ExcellentLandTransferSpecialTax spec — independent restatement of
  租税特別措置法 art. 31の2（優良住宅地の造成等のために土地等を譲渡した場合の長期譲渡所得の課税の特例）

Sources (pinned; identical to ExcellentLandTransferSpecialTax.lean):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE

Independent restatement of art. 31の2(1) from the statutory text:

  一 課税長期譲渡所得金額が二千万円以下である場合 当該課税長期譲渡所得金額の百分の十
  二 課税長期譲渡所得金額が二千万円を超える場合 二百万円 +
     (当該課税長期譲渡所得金額から二千万円を控除した金額の百分の十五)
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec constants are statutory literals; they do not reference implementation definitions. -/
def specExcellentLandGainEligible (taxableGain : Money) : Money :=
  if taxableGain ≤ 20_000_000 then
    taxableGain * 10 / 100
  else
    2_000_000 + (taxableGain - 20_000_000) * 15 / 100

structure SpecExcellentLandTransferFacts where
  inTransferWindow : Bool
  heldOverFiveYears : Bool
  isQualifiedTransfer : Bool
  notSubjectToNextArticle : Bool
  deriving DecidableEq, Repr

def specExcellentLandEligible (f : SpecExcellentLandTransferFacts) : Bool :=
  f.inTransferWindow && f.heldOverFiveYears && f.isQualifiedTransfer && f.notSubjectToNextArticle

def specExcellentLandLongTermGainTax (taxableGain : Money) : Money := taxableGain * 15 / 100

def specExcellentLandGainTax (f : SpecExcellentLandTransferFacts) (taxableGain : Money) : Money :=
  if specExcellentLandEligible f then
    specExcellentLandGainEligible taxableGain
  else
    specExcellentLandLongTermGainTax taxableGain

-- ==== Spec points, all kernel-decided ====

example : specExcellentLandGainEligible 10_000_000 = 1_000_000 := by decide
example : specExcellentLandGainEligible 20_000_000 = 2_000_000 := by decide
example : specExcellentLandGainEligible 20_000_001 = 2_000_000 := by decide
example : specExcellentLandGainEligible 20_000_100 = 2_000_015 := by decide
example : specExcellentLandGainEligible 100_000_000 = 14_000_000 := by decide

example : specExcellentLandEligible ⟨true, true, true, true⟩ = true := by decide
example : specExcellentLandEligible ⟨false, true, true, true⟩ = false := by decide

def agreeExcellentLandTransferPoints : Bool :=
  [0, 10_000_000, 19_999_999, 20_000_000, 20_000_001, 20_000_100,
   100_000_000, 200_000_000].all fun x =>
    excellentLandGainTax ⟨true, true, true, true⟩ x ==
      specExcellentLandGainTax ⟨true, true, true, true⟩ x

example : agreeExcellentLandTransferPoints = true := by decide

end JapanTaxLaw
