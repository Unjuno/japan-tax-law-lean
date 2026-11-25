import JapanTaxLaw.InheritanceTaxArt21_7Bracket3M4M

/-!
# InheritanceTaxArt21_7Bracket3M4M spec — 三百万円超四百万円以下の独立定式

Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008.
Independent restatement: 帯域を「上限以下 かつ 下限以下でない」として書き、
実装の `>` 比較を再利用しない。有限領域の kernel-decided 検査であり
普遍的な定理ではない。
-/

namespace JapanTaxLaw.InheritanceTaxArt21_7Bracket3M4M

def specLo : Nat := 3000000

def specHi : Nat := 4000000

def specInBracket (amount : Nat) : Bool :=
  (! (specHi < amount)) && (! (amount <= specLo))

example : specInBracket 3000000 = false := by decide
example : specInBracket 3000001 = true := by decide
example : specInBracket 4000000 = true := by decide
example : specInBracket 4000001 = false := by decide

def agreeInheritanceTaxArt21_7Bracket3M4M : Bool :=
  [0, 1, 2999999, 3000000, 3000001, 3500000, 4000000, 4000001, 5000000].all (fun a =>
    inBracket a == specInBracket a)

example : agreeInheritanceTaxArt21_7Bracket3M4M = true := by decide

end JapanTaxLaw.InheritanceTaxArt21_7Bracket3M4M
