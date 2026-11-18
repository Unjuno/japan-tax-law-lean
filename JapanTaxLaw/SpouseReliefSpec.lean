import JapanTaxLaw.SpouseRelief

/-!
# SpouseRelief spec — evidence for art. 19-2

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7

Kernel `decide` evidence for the art. 19-2 spouse relief formula:
  relief = taxBeforeRelief * min(relevantBasis, spouseAcquisition) / totalAcquisition
  taxAfter = taxBeforeRelief − relief
  relevantBasis = if spouseIsOnlyHeir then totalAcquisition
                  else max(legalShareRaw, 160,000,000)
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

example : spouseReliefRelevantBasis ⟨100_000_000, 90_000_000, 300_000_000, 30_000_000, false⟩ = 90_000_000 := by decide
example : spouseReliefRelevantBasis ⟨200_000_000, 250_000_000, 400_000_000, 10_000_000, false⟩ = 200_000_000 := by decide
example : spouseReliefRelevantBasis ⟨0, 500_000_000, 500_000_000, 80_000_000, true⟩ = 500_000_000 := by decide
example : spouseRelief ⟨100_000_000, 200_000_000, 400_000_000, 10_000_000, false⟩ = 4_000_000 := by decide
  -- isOnlyHeir=false, share=100M<160M so イ-basis=160M, min(160M,ロ=200M)=160M, ratio=40%, 40%×10,000,000=4,000,000
example : spouseRelief ⟨200_000_000, 200_000_000, 400_000_000, 10_000_000, false⟩ = 5_000_000 := by decide
example : spouseRelief ⟨0, 400_000_000, 400_000_000, 100_000_000, true⟩ = 100_000_000 := by decide
example : taxAfterSpouseRelief ⟨200_000_000, 200_000_000, 400_000_000, 10_000_000, false⟩ = 5_000_000 := by decide
example : spouseRelief ⟨100_000_000, 90_000_000, 300_000_000, 30_000_000, false⟩ = 9_000_000 := by decide
  -- 90M/300M = 30% × 30M = 9M

/-- Independent restatement of the art. 19-2 formula, written differently from
    impl: `max`/`min` in place of the impl's if-comparisons, and Nat's
    division-by-zero (`a / 0 = 0`) in place of the explicit zero-total guard. -/
def specSpouseReliefYiBasis (f : SpouseReliefFacts) : Money :=
  if f.spouseIsOnlyHeir then f.totalAcquisition
  else max f.spouseLegalShareRaw 160_000_000

def specSpouseReliefRelevantBasis (f : SpouseReliefFacts) : Money :=
  min (specSpouseReliefYiBasis f) f.spouseAcquisition

def specSpouseRelief (f : SpouseReliefFacts) : Money :=
  (f.taxBeforeRelief * specSpouseReliefRelevantBasis f) / f.totalAcquisition

def specTaxAfterSpouseRelief (f : SpouseReliefFacts) : Money :=
  f.taxBeforeRelief - specSpouseRelief f

/-- Spec ≡ impl over the sample facts used by the existing examples above,
    kernel-verified by `decide`. -/
def agreeSpouseRelief : Bool :=
  let samples : List SpouseReliefFacts :=
    [ ⟨100_000_000, 90_000_000, 300_000_000, 30_000_000, false⟩,
      ⟨200_000_000, 250_000_000, 400_000_000, 10_000_000, false⟩,
      ⟨0, 500_000_000, 500_000_000, 80_000_000, true⟩,
      ⟨100_000_000, 200_000_000, 400_000_000, 10_000_000, false⟩,
      ⟨200_000_000, 200_000_000, 400_000_000, 10_000_000, false⟩,
      ⟨0, 400_000_000, 400_000_000, 100_000_000, true⟩,
      ⟨0, 0, 0, 100, false⟩ ]
  let one (f : SpouseReliefFacts) : Bool :=
    spouseReliefYiBasis f == specSpouseReliefYiBasis f &&
    spouseReliefRelevantBasis f == specSpouseReliefRelevantBasis f &&
    spouseRelief f == specSpouseRelief f &&
    taxAfterSpouseRelief f == specTaxAfterSpouseRelief f
  samples.all one

example : agreeSpouseRelief = true := by decide

end JapanTaxLaw
