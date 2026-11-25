import JapanTaxLaw.TariffLawSupplArt1Heisei13Enforcement

/-!
# TariffLawSupplArt1Heisei13Enforcement spec — 施行日/除外条の独立定式

Sources (pinned): law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005.
Independent restatement: 除外条を集合的に列挙し、適用判定を「n が除外集合に
属さない」として書く。 implementation の識別子は再利用しない。有限領域の
kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.TariffLawSupplArt1Heisei13Enforcement

def specEraDate : Nat × Nat × Nat := (13, 1, 6)

def specExcluded (n : Nat) : Bool := n == 2 || n == 3

def specInForce (n : Nat) : Bool := ! (specExcluded n)

example : specEraDate = (13, 1, 6) := by decide
example : specInForce 2 = false := by decide
example : specInForce 4 = true := by decide

def agreeTariffLawSupplArt1Heisei13Enforcement : Bool :=
  [0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14].all (fun n =>
    appliesToArticle n == specInForce n)

example : agreeTariffLawSupplArt1Heisei13Enforcement = true := by decide

end JapanTaxLaw.TariffLawSupplArt1Heisei13Enforcement
