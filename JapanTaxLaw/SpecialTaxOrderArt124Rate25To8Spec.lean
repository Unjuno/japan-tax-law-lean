import JapanTaxLaw.SpecialTaxOrderArt124Rate25To8

/-!
# SpecialTaxOrderArt124Rate25To8 spec — 25→8 千分率読替えの独立定式

Sources (pinned): law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013.
Independent restatement: 読替え後の率を「分母1000・分子8の組」として保持し、
計算を `base / 1000 * 8 + (base % 1000) * 8 / 1000` に分解して書く。
実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.SpecialTaxOrderArt124Rate25To8

/-- 読替え前の千分率（千分の二十五）も独立に保持して原文照合する。 -/
def specOriginal : Nat := 25

def specNum : Nat := 8

def specDen : Nat := 1000

def specApplied (base : Nat) : Nat :=
  base / specDen * specNum + (base % specDen) * specNum / specDen

example : specApplied 1000 = 8 := by decide
example : specApplied 1001 = 8 := by decide

def agreeSpecialTaxOrderArt124Rate25To8 : Bool :=
  [0, 1, 24, 25, 125, 999, 1000, 1001].all (fun b =>
    appliedAmount b == specApplied b)

example : agreeSpecialTaxOrderArt124Rate25To8 = true := by decide

end JapanTaxLaw.SpecialTaxOrderArt124Rate25To8
