import JapanTaxLaw.IncomeTaxOrderArt2_3Amount3500000

/-!
# IncomeTaxOrderArt2_3Amount3500000 spec — 300万→350万 読替の独立定式

Sources (pinned): law 332CO0000000043, revision 332CO0000000043_20261101_507CO0000000127.
Independent restatement: 読替後を「base に 350万を足して 300万を引く」として
書く（実装の差額加算と別定式）。実装識別子を再利用しない。
有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.IncomeTaxOrderArt2_3Amount3500000

def specOriginal : Nat := 3000000

def specSubstituted : Nat := 3500000

def specApplied (base : Nat) : Nat := base + specSubstituted - specOriginal

example : specApplied 0 = 500000 := by decide
example : specApplied 1000000 = 1500000 := by decide

def agreeIncomeTaxOrderArt2_3Amount3500000 : Bool :=
  [0, 1, 1000000, 3000000, 3500000].all (fun b =>
    appliedAmount b == specApplied b)

example : agreeIncomeTaxOrderArt2_3Amount3500000 = true := by decide

end JapanTaxLaw.IncomeTaxOrderArt2_3Amount3500000
