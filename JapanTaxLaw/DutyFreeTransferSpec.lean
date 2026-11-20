import JapanTaxLaw.DutyFreeTransfer

/-!
# DutyFreeTransfer spec — 関税法施行令 art.12 の独立整数定式
Sources (pinned): law 327CO0000000125, revision 327CO0000000125_20171008_428CO0000000240.
Independent restatement: 「一万八千円に満たない」= price < 18000（厳密不等式）。
実装とは独立に境界を書き下す。
-/

namespace JapanTaxLaw.DutyFreeTransfer

def specThreshold : Nat := 18_000

def specBelow (price : Nat) : Bool := price < 18000

example : specThreshold = 18_000 := by decide
example : specBelow 0 = true := by decide
example : specBelow 17_999 = true := by decide
example : specBelow 18_000 = false := by decide

def agreeDutyFreeTransfer : Bool :=
  [0, 1, 17_999, 18_000, 18_001, 100_000].all fun p =>
    isBelowThreshold p == specBelow p

example : agreeDutyFreeTransfer = true := by decide

end JapanTaxLaw.DutyFreeTransfer
