import JapanTaxLaw.LandValueTaxArt5Heisei4Rate2PerMille

/-!
# LandValueTaxArt5Heisei4Rate2PerMille spec — 千分の二 読替えの独立定式

Sources (pinned): law 403AC0000000069, revision 403AC0000000069_20250601_504AC0000000068.
Independent restatement: 読替え後率を「分母1000・分子2の組」として保持し、
計算を `base / 1000 * 2 + (base % 1000) * 2 / 1000` に分解する。
実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.LandValueTaxArt5Heisei4Rate2PerMille

def specNum : Nat := 2

def specDen : Nat := 1000

def specApplied (base : Nat) : Nat :=
  base / specDen * specNum + (base % specDen) * specNum / specDen

example : specApplied 1000 = 2 := by decide
example : specApplied 499 = 0 := by decide

def agreeLandValueTaxArt5Heisei4Rate2PerMille : Bool :=
  [0, 1, 499, 500, 999, 1000, 1001, 2000].all (fun b =>
    appliedAmount b == specApplied b)

example : agreeLandValueTaxArt5Heisei4Rate2PerMille = true := by decide

end JapanTaxLaw.LandValueTaxArt5Heisei4Rate2PerMille
