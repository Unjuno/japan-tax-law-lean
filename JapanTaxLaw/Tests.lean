import JapanTaxLaw.Residency
import JapanTaxLaw.StatutoryModel

/-!
Truth-table tests, covering both the legacy Bool abstraction (the four
input combinations of the PoC) and the full four-valued semantic model of
Act art. 2(1)(iii)/(v), Act art. 3(1) and Order arts. 13–15.
-/

namespace JapanTaxLaw

-- ============ legacy PoC surface (kept green) ============

-- Neither predicate holds.
example : resident ⟨false, false⟩ = false := by decide
example : nonResident ⟨false, false⟩ = true := by decide

-- Domestic domicile alone suffices.
example : resident ⟨true, false⟩ = true := by decide
example : nonResident ⟨true, false⟩ = false := by decide

-- One-year continuous domestic abode alone suffices.
example : resident ⟨false, true⟩ = true := by decide
example : nonResident ⟨false, true⟩ = false := by decide

-- Both predicates hold.
example : resident ⟨true, true⟩ = true := by decide
example : nonResident ⟨true, true⟩ = false := by decide

-- ============ four-valued statutory model tests ============

def blank : DomicileFacts :=
  { established := Verdict.unknown
    abodeOneYear := Verdict.unknown
    publicOfficial := Verdict.unknown
    japaneseNational := Verdict.unknown
    order13PermanentAbroad := Verdict.unknown
    order14Presumption := Verdict.unknown
    order14Household := Verdict.unknown
    order15Presumption := Verdict.unknown
    order15Household := Verdict.unknown
    targetExcludedProvision := false }

-- S1: established domicile ⇒ resident
example : residentVerdict { blank with established := .yes } = .yes :=
  by decide

-- S2: explicit non-residence, no abode, fiction inapplicable ⇒ .no
example :
    residentVerdict
      { blank with
        established := .no
        abodeOneYear := .no
        publicOfficial := .no } = .no :=
  by decide

-- S3: domestic presumption (order14) only ⇒ resident
example :
    residentVerdict
      { blank with
        abodeOneYear := .no
        order14Presumption := .yes } = .yes :=
  by decide

-- S4: foreign presumption (order15) only ⇒ non-resident
example :
    residentVerdict
      { blank with
        abodeOneYear := .no
        order15Presumption := .yes } = .no :=
  by decide

-- S5: both presumptions affirm opposite sides ⇒ conflict (requires review)
example :
    residentVerdict
      { blank with
        abodeOneYear := .no
        order14Presumption := .yes
        order15Presumption := .yes } = .conflict :=
  by decide

-- S6: fiction excluded by Order 13 (Japanese national, recognized abroad permanent resident)
example :
    effectiveDomicile
      { blank with
        established := .no
        publicOfficial := .yes
        japaneseNational := .yes
        order13PermanentAbroad := .yes } = .no :=
  by decide
  -- does NOT classify as resident: classification excludes the excluded case

-- S7: fiction applies to a Japanese public official stationed abroad (Act art. 3(1))
example :
    residentVerdict
      { blank with
        established := .no          -- no domicile fact
        abodeOneYear := .no
        publicOfficial := .yes
        japaneseNational := .yes
        order13PermanentAbroad := .no } = .yes :=
  by decide

-- S8: fiction does not apply to a non-Japanese public official
--     (excluded from fiction; with unknown direct fact and unknown abode → unknown)
example :
    residentVerdict
      { blank with
        established := .unknown
        abodeOneYear := .unknown
        publicOfficial := .yes
        japaneseNational := .no
        order13PermanentAbroad := .no } = .unknown :=
  by decide

-- S9: fiction does not apply to an excluded provision (Act art. 10/15/16)
example :
    fictionVerdict
      { blank with
        publicOfficial := .yes
        japaneseNational := .yes
        order13PermanentAbroad := .no
        targetExcludedProvision := true } = .no :=
  by decide

-- S10: conflicting direct facts ⇒ effective .conflict
example :
    effectiveDomicile
      { blank with established := .conflict } = .conflict :=
  by decide

-- S11: all unknown ⇒ unknown (never collapses to false)
example :
    residentVerdict blank = .unknown :=
  by decide

-- S12: abode alone suffices even against a negative domicile
example :
    residentVerdict
      { blank with
        established := .no
        abodeOneYear := .yes } = .yes :=
  by decide

-- S13: fiction overrides an abode-denial
example :
    residentVerdict
      { blank with
        abodeOneYear := .no
        publicOfficial := .yes
        japaneseNational := .yes
        order13PermanentAbroad := .no } = .yes :=
  by decide

-- S14: classification mapping is total and concrete
example : residentClassification { blank with established := .yes } = .resident := by decide
example : residentClassification { blank with established := .no, abodeOneYear := .no, publicOfficial := .no } = .nonResident := by decide
example : residentClassification blank = .indeterminate := by decide
example : residentClassification { blank with established := .conflict } = .inconsistent := by decide

-- S15: foreign presumption over foreign household still reads as non-resident
example :
    residentVerdict
      { blank with
        abodeOneYear := .no
        order15Household := .yes } = .no :=
  by decide

-- S16: domestic household presumption suffices as well
example :
    residentVerdict
      { blank with
        abodeOneYear := .no
        order14Household := .yes } = .yes :=
  by decide

-- S17: established no over established conflict: no wins? (no is total under this encoding)
example :
    residentVerdict
      { blank with established := .no, abodeOneYear := .no, publicOfficial := .no } = .no :=
  by decide

-- S18: non-permanent residence is deliberately out of scope
-- (established .yes, but non-permanent-resident status not modeled)
example :
    residentVerdict
      { blank with
        established := .yes
        publicOfficial := .unknown } = .yes :=
  by decide

end JapanTaxLaw
