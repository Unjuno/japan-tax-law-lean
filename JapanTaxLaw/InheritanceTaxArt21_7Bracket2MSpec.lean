import JapanTaxLaw.InheritanceTaxArt21_7Bracket2M

/-!
# InheritanceTaxArt21_7Bracket2M spec — 二百万円以下の独立定式

Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008.
Independent restatement: 「二百万円を超えない」を否定形 `!(specMax < amount)` として
書く。実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.InheritanceTaxArt21_7Bracket2M

def specMax : Nat := 2000000

def specInBracket (amount : Nat) : Bool := ! (specMax < amount)

example : specInBracket 2000000 = true := by decide
example : specInBracket 2000001 = false := by decide

def agreeInheritanceTaxArt21_7Bracket2M : Bool :=
  [0, 1, 1999999, 2000000, 2000001, 4000000].all (fun a =>
    inBracket a == specInBracket a)

example : agreeInheritanceTaxArt21_7Bracket2M = true := by decide

end JapanTaxLaw.InheritanceTaxArt21_7Bracket2M
