import JapanTaxLaw.LocalGrantTaxShares

/-!
# LocalGrantTaxShares spec — 94/100 と 6/100 の独立定式

Sources (pinned): law 325AC0000000211, revision 325AC0000000211_20261102_508AC0000000062,
art. 6の2 (第六条の二) §2/§3. Independent restatement: 普通交付税 = total×94/100、
特別交付税 = total×6/100。実装の定数名を参照せず、原文の二つの割合から直接書き下す。
-/

namespace JapanTaxLaw.LocalGrantTaxShares

def specOrdinaryShare (total : Nat) : Nat :=
  total * 94 / 100

def specSpecialShare (total : Nat) : Nat :=
  total * 6 / 100

example : specOrdinaryShare 10_000 = 9_400 := by decide
example : specSpecialShare 10_000 = 600 := by decide

def agreeLocalGrantTaxShares : Bool :=
  [0, 1, 6, 31, 94, 95, 99, 100, 101, 10_000, 1_000_003].all fun t =>
    ordinaryShare t == specOrdinaryShare t && specialShare t == specSpecialShare t

example : agreeLocalGrantTaxShares = true := by decide

end JapanTaxLaw.LocalGrantTaxShares
