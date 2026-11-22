import JapanTaxLaw.NickelContent

/-!
# NickelContent spec — 0.6% 厳密超え の独立定式
Sources (pinned): law 508CO0000000224, revision 508CO0000000224_20261031_508CO0000000340.
Independent restatement: nickel*1000 > total*6。
-/

namespace JapanTaxLaw.NickelContent

def specExceeds (nickel total : Nat) : Bool := nickel * 1000 > total * 6

example : specExceeds 6 1000 = false := by decide
example : specExceeds 7 1000 = true := by decide

def agreeNickelContent : Bool :=
  [ (0,1000), (5,1000), (6,1000), (7,1000), (12,2000) ].all fun (n,t) =>
    exceedsNickelThreshold n t == specExceeds n t

example : agreeNickelContent = true := by decide

end JapanTaxLaw.NickelContent
