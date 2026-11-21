import JapanTaxLaw.TwoThirdsMembershipThreshold
import JapanTaxLaw.TwoThirdsMembershipThresholdSpec

/-
# TwoThirdsMembershipThresholdTests — kernel-decided checks for 法律 第八十条

Every check is a closed Nat/Bool expression discharged by `by decide`, or a
general Nat fact closed by `omega`. Coverage: zero input, small positives, the
exact 2/3 boundary, just below (1/3 and 3/5), just above (3/4), the qualified=0
vacuous edge, impl/spec agreement, and the cross-multiplication identity.
-/

namespace JapanTaxLaw.TwoThirdsMembershipThreshold

-- (a) zero input: zero members with a positive qualification count fails.
example : canEstablish 0 3 = false := by decide
example : canEstablish 0 0 = true := by decide

-- (b) small positive inputs: the smallest counts.
example : canEstablish 1 1 = true := by decide
example : canEstablish 2 2 = true := by decide

-- (c) exact 2/3 (2 of 3) qualifies: 以上 is inclusive.
example : canEstablish 2 3 = true := by decide

-- (d) just below two-thirds: 1 of 3, and 3 of 5 (9 < 10).
example : canEstablish 1 3 = false := by decide
example : canEstablish 3 5 = false := by decide

-- (e) just above two-thirds: 3 of 4 (9 >= 8).
example : canEstablish 3 4 = true := by decide

-- (f) qualified = 0 is vacuous (members * 3 >= 0 always holds).
example : canEstablish 5 0 = true := by decide

-- (g) zero members with any positive qualification count is false (omega).
example (qualified : Nat) (hq : 0 < qualified) :
    canEstablish 0 qualified = false := by
  exact zero_members_false qualified hq

-- (h) monotonicity in members (omega-backed theorem application).
example (members' : Nat) (h : canEstablish 2 3 = true) (hle : 2 ≤ members') :
    canEstablish members' 3 = true := by
  exact monotone_members h hle

-- (i) universal impl/spec agreement, plus concrete agreement points.
example (members qualified : Nat) :
    canEstablish members qualified = specCanEstablish members qualified := by
  exact agreeTwoThirds members qualified
example : canEstablish 2 3 = specCanEstablish 2 3 := by decide
example : canEstablish 3 5 = specCanEstablish 3 5 := by decide

-- (j) cross-multiplication identity (commutativity): the only impl/spec bridge.
example : 3 * 2 = 2 * 3 := by decide
example : 2 * 0 = 0 := by decide

end JapanTaxLaw.TwoThirdsMembershipThreshold
