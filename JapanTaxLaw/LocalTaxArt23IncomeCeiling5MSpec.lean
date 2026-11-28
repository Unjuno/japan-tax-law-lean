import JapanTaxLaw.LocalTaxArt23IncomeCeiling5M

/-!
# LocalTaxArt23IncomeCeiling5M spec — 500万円以下の独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 「上限を超えない」を否定形 `!(specCeiling < amount)` で書く。
実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.LocalTaxArt23IncomeCeiling5M

def specCeiling : Nat := 5000000

def specWithin (amount : Nat) : Bool := ! (specCeiling < amount)

example : specWithin 5000000 = true := by decide
example : specWithin 5000001 = false := by decide

def agreeLocalTaxArt23IncomeCeiling5M : Bool :=
  [0, 1, 4999999, 5000000, 5000001, 10000000].all (fun a =>
    withinCeiling a == specWithin a)

example : agreeLocalTaxArt23IncomeCeiling5M = true := by decide

end JapanTaxLaw.LocalTaxArt23IncomeCeiling5M
