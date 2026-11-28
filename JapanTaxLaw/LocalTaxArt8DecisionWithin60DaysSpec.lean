import JapanTaxLaw.LocalTaxArt8DecisionWithin60Days

/-!
# LocalTaxArt8DecisionWithin60Days spec — 60日以内の独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 「上限を超えない」を否定形 `!(specLimit < elapsed)` で書く。
実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.LocalTaxArt8DecisionWithin60Days

def specLimit : Nat := 60

def specWithin (elapsed : Nat) : Bool := ! (specLimit < elapsed)

example : specWithin 60 = true := by decide
example : specWithin 61 = false := by decide

def agreeLocalTaxArt8DecisionWithin60Days : Bool :=
  [0, 1, 59, 60, 61, 120].all (fun d => withinLimit d == specWithin d)

example : agreeLocalTaxArt8DecisionWithin60Days = true := by decide

end JapanTaxLaw.LocalTaxArt8DecisionWithin60Days
