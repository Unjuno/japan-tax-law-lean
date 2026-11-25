import JapanTaxLaw.InheritanceTaxBracket10M30M

/-!
# InheritanceTaxBracket10M30MSpec — independent typed specification

Pinned source identical to the implementation module (相続税法 art. 16).
Both bounds are restated as plain `Nat` literals read independently from
「千万」 and 「三千万」. The interval is expressed in the complementary form
(not (amount ≤ 10,000,000)) ∧ not (30,000,000 < amount) so the spec does not
reuse the implementation's predicates. 超える is exclusive; 以下 inclusive.
-/

namespace JapanTaxLaw.InheritanceTaxBracket10M30M

/-- Independent restatement of 「千万」 (yen). -/
def specLower : Nat := 10000000
/-- Independent restatement of 「三千万」 (yen). -/
def specUpper : Nat := 30000000

/-- Independent formulation of the bounded interval. -/
def specInBracket (amount : Nat) : Bool :=
  (if amount <= 10000000 then false else true) &&
  (if 30000000 < amount then false else true)

example : specLower = 10000000 := by decide
example : specUpper = 30000000 := by decide
example : specInBracket 0 = false := by decide
example : specInBracket 10_000_000 = false := by decide
example : specInBracket 10_000_001 = true := by decide
example : specInBracket 30_000_000 = true := by decide
example : specInBracket 30_000_001 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeInheritanceTaxBracket10M30M : Bool :=
  let amounts := [0, 1, 9_999_999, 10_000_000, 10_000_001, 29_999_999,
                  30_000_000, 30_000_001, 100_000_000]
  (lowerBound == specLower) && (upperBound == specUpper) &&
    amounts.all fun a => inBracket a == specInBracket a

example : agreeInheritanceTaxBracket10M30M = true := by decide

end JapanTaxLaw.InheritanceTaxBracket10M30M
