import JapanTaxLaw.InheritanceSurcharge

/-!
# InheritanceSurcharge spec — independent statement of art. 18

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7

Independent restatement of 相続税法 art. 18 (相続税額の加算):

  一親等の血族（代襲を含む）及び配偶者以外の者 — add 百分の二十 to the
  art. 17 computed amount. 百分の二十相当額 is added arithmetically.

Verification: boundary and grid `decide` checks only; no universal theorem
claimed.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 20% surcharge added to a base amount (art. 18(1)). -/
def specSurcharge (baseTax : Money) : Money := (baseTax * 20) / 100

example : specSurcharge 100 = 20 := by decide
example : specSurcharge 0 = 0 := by decide

/-- Spec: full final tax for a non-eligible heir (base + surcharge). -/
def specSurchargeTotal (baseTax : Money) : Money := baseTax + specSurcharge baseTax

example : specSurchargeTotal 100 = 120 := by decide
example : specSurchargeTotal 125 = 150 := by decide
example : specSurchargeTotal 0 = 0 := by decide

/-- Spec≡impl across a grid of sample points. -/
def surchargeCheckGrid : Bool :=
  let rec go (k : Nat) : Bool :=
    match k with
    | 0 => true
    | k + 1 =>
        let base := (k + 1) * 37_500
        go k && (specSurcharge base == surcharge20 base &&
                 specSurchargeTotal base == taxWithSurcharge false base)
  go 40

set_option maxRecDepth 2048

example : surchargeCheckGrid = true := by decide

example : specSurchargeTotal 100_000 == taxWithSurcharge false 100_000 := by decide

end JapanTaxLaw
