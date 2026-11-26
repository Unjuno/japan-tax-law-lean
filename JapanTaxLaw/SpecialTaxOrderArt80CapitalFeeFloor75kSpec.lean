import JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor75k

/-!
# SpecialTaxOrderArt80CapitalFeeFloor75k spec — 3.5/1000 と7.5万円下限の独立定式

Sources (pinned): law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013.
Independent restatement: 率を「三・五 = (3*10+5)/(1000*10)」として自ら組み立て、
下限を `max` で書く（実装の if とは異なる定式）。実装識別子を再利用しない。
有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor75k

def specN : Nat := 3 * 10 + 5

def specD : Nat := 1000 * 10

def specFloor : Nat := 75000

def specFee (capital : Nat) : Nat :=
  max specFloor (capital * specN / specD)

example : specFee 0 = 75000 := by decide
example : specFee 30_000_000 = 105000 := by decide

def agreeSpecialTaxOrderArt80CapitalFeeFloor75k : Bool :=
  [0, 1, 10_000_000, 20_000_000, 21_000_000, 30_000_000].all (fun c =>
    feePerApplication c == specFee c)

example : agreeSpecialTaxOrderArt80CapitalFeeFloor75k = true := by decide

end JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor75k
