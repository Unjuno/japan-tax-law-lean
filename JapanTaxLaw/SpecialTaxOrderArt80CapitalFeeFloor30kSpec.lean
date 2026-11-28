import JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor30k

/-!
# SpecialTaxOrderArt80CapitalFeeFloor30k spec — 3.5/1000 と3万円下限の独立定式

Sources (pinned): law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013.
Independent restatement: 率を「三・五 = (3*10+5)/(1000*10)」として自ら組み立て、
下限を `max` で書く。実装識別子を再利用しない。有限領域の kernel-decided
検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor30k

def specN : Nat := 3 * 10 + 5

def specD : Nat := 1000 * 10

def specFloor : Nat := 30000

def specFee (capital : Nat) : Nat :=
  max specFloor (capital * specN / specD)

example : specFee 1_000_000 = 30000 := by decide
example : specFee 10_000_000 = 35000 := by decide

def agreeSpecialTaxOrderArt80CapitalFeeFloor30k : Bool :=
  [0, 1, 1_000_000, 8_000_000, 8_571_428, 10_000_000, 20_000_000].all (fun c =>
    feePerApplication c == specFee c)

example : agreeSpecialTaxOrderArt80CapitalFeeFloor30k = true := by decide

end JapanTaxLaw.SpecialTaxOrderArt80CapitalFeeFloor30k
