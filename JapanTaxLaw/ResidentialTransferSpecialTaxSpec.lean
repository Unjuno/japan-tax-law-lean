import JapanTaxLaw.ResidentialTransferSpecialTax

/-!
# ResidentialTransferSpecialTax spec — independent restatement of
  租税特別措置法 art. 31の3（居住用財産を譲渡した場合の長期譲渡所得の課税の特例）

Sources (pinned; identical to ResidentialTransferSpecialTax.lean):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * art. 31の3(1) — 個人が、その有する土地等又は建物等でその年一月一日において所有期間が
    十年を超えるもののうち居住用財産に該当するものの譲渡をした場合の所得税の額は、
    次の各号に掲げる場合の区分に応じ当該各号に定める金額相当額:
    一課税長期譲渡所得金額が六千万円以下である場合当該課税長期譲渡所得金額の百分の十
    二課税長期譲渡所得金額が六千万円を超える場合次に掲げる金額の合計額
      イ六百万円
      ロ当該課税長期譲渡所得金額から六千万円を控除した金額の百分の十五
from the statutory text itself.

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 31の3(1) — 課税長期譲渡所得金額 ≤ ¥60,000,000 → 百分の十／超過 → ¥6,000,000 + 百分の十五。 -/
def specResidentialGainTaxEligible (taxableGain : Money) : Money :=
  if taxableGain ≤ 60_000_000 then
    taxableGain * 10 / 100
  else
    6_000_000 + (taxableGain - 60_000_000) * 15 / 100

/-- Spec: eligibility gates (externally established)。 -/
structure SpecResidentialTransferFacts where
  isResidentialProperty : Bool
  overTenYears : Bool
  isNotExcluded : Bool
  notUsedWithinTwoYears : Bool
  deriving DecidableEq, Repr

/-- Spec: art. 31の3(1) の適格認定。 -/
def specResidentialEligible (f : SpecResidentialTransferFacts) : Bool :=
  f.isResidentialProperty && f.overTenYears && f.isNotExcluded && f.notUsedWithinTwoYears

/-- Spec: art. 31(1) の一般税率（百分の十五）。 -/
def specLongTermGainTax (taxableGain : Money) : Money := taxableGain * 15 / 100

/-- Restatement used only for spot-checking the implementation. -/
def specResidentialGainTax (f : SpecResidentialTransferFacts) (taxableGain : Money) : Money :=
  if specResidentialEligible f then
    specResidentialGainTaxEligible taxableGain
  else
    specLongTermGainTax taxableGain

-- ==== Spec points, all kernel-decided ====

example : specResidentialGainTaxEligible 30_000_000 = 3_000_000 := by decide
example : specResidentialGainTaxEligible 60_000_000 = 6_000_000 := by decide
example : specResidentialGainTaxEligible 60_000_001 = 6_000_000 := by decide
example : specResidentialGainTaxEligible 60_000_100 = 6_000_015 := by decide
example : specResidentialGainTaxEligible 100_000_000 = 12_000_000 := by decide

example : specResidentialEligible ⟨true, true, true, true⟩ = true := by decide
example : specResidentialEligible ⟨false, true, true, true⟩ = false := by decide
example : specResidentialEligible ⟨true, false, true, true⟩ = false := by decide

example : specResidentialGainTax ⟨true, true, true, true⟩ 100_000_000 = 12_000_000 := by decide
example : specResidentialGainTax ⟨false, true, true, true⟩ 100_000_000 = 15_000_000 := by decide

/-- Agreement examples between implementation and the Spec. -/
def agreeResidentialTransferPoints : Bool :=
  [0, 10_000_000, 30_000_000, 59_999_999, 60_000_000, 60_000_001, 60_000_100,
   100_000_000, 200_000_000].all fun x =>
    residentialGainTax ⟨true, true, true, true⟩ x ==
      specResidentialGainTax ⟨true, true, true, true⟩ x

example : agreeResidentialTransferPoints = true := by decide

end JapanTaxLaw
