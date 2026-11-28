import JapanTaxLaw.LocalTaxArt350FixedAssetStandardRate1p4

/-!
# LocalTaxArt350FixedAssetStandardRate1p4 spec — 1.4% の独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 率を「14/1000」の組として自ら保持し、計算を
`base / 1000 * 14 + (base % 1000) * 14 / 1000` に分解する。
実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.LocalTaxArt350FixedAssetStandardRate1p4

/-- 原文の「一・四」= 1.4% を 14/1000 として保持（比率照合用）。 -/
def specNum : Nat := 14

def specDen : Nat := 1000

def specApplied (base : Nat) : Nat :=
  base / specDen * specNum + (base % specDen) * specNum / specDen

example : specApplied 1000 = 14 := by decide
example : specApplied 499 = 6 := by decide

def agreeLocalTaxArt350FixedAssetStandardRate1p4 : Bool :=
  [0, 1, 499, 500, 999, 1000, 1001, 2000].all (fun b =>
    rateApplied b == specApplied b)

example : agreeLocalTaxArt350FixedAssetStandardRate1p4 = true := by decide

end JapanTaxLaw.LocalTaxArt350FixedAssetStandardRate1p4
