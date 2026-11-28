import JapanTaxLaw.ForeignCorpRedemptionTaxCredit
import JapanTaxLaw.ForeignCorpRedemptionTaxCreditSpec

/-! # ForeignCorpRedemptionTaxCredit tests — kernel-decided boundary examples -/

namespace JapanTaxLaw.ForeignCorpRedemptionTaxCredit

-- Boundary category 1: full ownership period (ratio = 1)
example : credit 100 100 2 2 20 = 80 := by decide
example : specCredit 100 100 2 2 20 = 80 := by decide

-- Boundary category 2: partial period (ratio = 1/2)
example : credit 100 100 1 2 20 = 40 := by decide
example : specCredit 100 100 1 2 20 = 40 := by decide

-- Boundary category 3: zero numerator / zero denominator
example : credit 100 100 0 2 20 = 0 := by decide
example : credit 100 100 1 0 20 = 0 := by decide
example : specCredit 100 100 0 2 20 = 0 := by decide
example : specCredit 100 100 1 0 20 = 0 := by decide

-- Boundary category 4: zero limit rate (no deduction)
example : credit 100 100 1 2 0 = 50 := by decide
example : specCredit 100 100 1 2 0 = 50 := by decide

-- Universal agreement (all five inputs):
#check spec_agrees

end JapanTaxLaw.ForeignCorpRedemptionTaxCredit
