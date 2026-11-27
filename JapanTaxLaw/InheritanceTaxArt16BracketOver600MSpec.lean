import JapanTaxLaw.InheritanceTaxArt16BracketOver600M

/-!
# InheritanceTaxArt16BracketOver600M spec — 六億円超の独立定式

Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008.
Independent restatement: 「六億円以下でない」を否定形 `!(amount <= specLo)` として
書く。実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.InheritanceTaxArt16BracketOver600M

def specLower : Nat := 600000000

def specInBracket (amount : Nat) : Bool := ! (amount <= specLower)

example : specInBracket 600000000 = false := by decide
example : specInBracket 600000001 = true := by decide

def agreeInheritanceTaxArt16BracketOver600M : Bool :=
  [0, 1, 599999999, 600000000, 600000001, 1000000000].all (fun a =>
    inBracket a == specInBracket a)

example : agreeInheritanceTaxArt16BracketOver600M = true := by decide

end JapanTaxLaw.InheritanceTaxArt16BracketOver600M
