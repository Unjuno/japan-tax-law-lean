import JapanTaxLaw.IncomeTaxArt2Income850kOther100k

/-!
# IncomeTaxArt2Income850kOther100k spec — 85万/10万円の独立定式

Sources (pinned): law 340AC0000000033, revision 340AC0000000033_20261001_507AC0000000070.
Independent restatement: 二つの上限超過がないことを否定形で書く。
実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.IncomeTaxArt2Income850kOther100k

def specTotalMax : Nat := 850000

def specOtherMax : Nat := 100000

def specWithinBoth (totalIncome otherIncome : Nat) : Bool :=
  (! (specTotalMax < totalIncome)) && (! (specOtherMax < otherIncome))

example : specWithinBoth 850000 100000 = true := by decide
example : specWithinBoth 850001 100000 = false := by decide

def agreeIncomeTaxArt2Income850kOther100k : Bool :=
  [0, 1, 849999, 850000, 850001, 99999, 100000, 100001].all (fun a =>
    [0, 99999, 100000, 100001].all (fun b =>
      withinBoth a b == specWithinBoth a b))

example : agreeIncomeTaxArt2Income850kOther100k = true := by decide

end JapanTaxLaw.IncomeTaxArt2Income850kOther100k
