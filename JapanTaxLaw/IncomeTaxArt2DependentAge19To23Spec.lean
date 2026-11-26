import JapanTaxLaw.IncomeTaxArt2DependentAge19To23

/-!
# IncomeTaxArt2DependentAge19To23 spec — 19以上23未満の独立定式

Sources (pinned): law 340AC0000000033, revision 340AC0000000033_20261001_507AC0000000070.
Independent restatement: 年齢帯を「十八歳以下でなく、かつ、二十三歳以上でない」
として書く。実装識別子を再利用しない。有限領域の kernel-decided 検査であり
普遍的な定理ではない。
-/

namespace JapanTaxLaw.IncomeTaxArt2DependentAge19To23

def specMinAge : Nat := 19

def specMaxAge : Nat := 23

def specInBand (age : Nat) : Bool :=
  (! (age < specMinAge)) && (! (specMaxAge <= age))

example : specInBand 19 = true := by decide
example : specInBand 23 = false := by decide

def agreeIncomeTaxArt2DependentAge19To23 : Bool :=
  [0, 1, 17, 18, 19, 20, 22, 23, 24].all (fun a =>
    inAgeBand a == specInBand a)

example : agreeIncomeTaxArt2DependentAge19To23 = true := by decide

end JapanTaxLaw.IncomeTaxArt2DependentAge19To23
