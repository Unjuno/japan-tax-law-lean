import JapanTaxLaw.InheritanceTaxArt16Bracket50M100M

/-!
# InheritanceTaxArt16Bracket50M100M spec — 五千万円超一億円以下の独立定式

Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008.
Independent restatement: 帯域を「上限を超えない かつ 下限以下でない」として
書き、実装の比較を再利用しない。有限領域の kernel-decided 検査であり
普遍的な定理ではない。
-/

namespace JapanTaxLaw.InheritanceTaxArt16Bracket50M100M

def specLo : Nat := 50000000

def specHi : Nat := 100000000

def specInBracket (amount : Nat) : Bool :=
  (! (specHi < amount)) && (! (amount <= specLo))

example : specInBracket 50000000 = false := by decide
example : specInBracket 50000001 = true := by decide
example : specInBracket 100000000 = true := by decide
example : specInBracket 100000001 = false := by decide

def agreeInheritanceTaxArt16Bracket50M100M : Bool :=
  [0, 1, 49999999, 50000000, 50000001, 75000000, 100000000, 100000001].all (fun a =>
    inBracket a == specInBracket a)

example : agreeInheritanceTaxArt16Bracket50M100M = true := by decide

end JapanTaxLaw.InheritanceTaxArt16Bracket50M100M
