import JapanTaxLaw.LandValuePerSquareMeter

/-!
# LandValuePerSquareMeter spec — 更地価額÷面積 の独立整数定式
Sources (pinned): law 403CO0000000174, revision 403CO0000000174_20250722_507CO0000000249.
Independent restatement: 価額÷面積（自然数除算、area=0 → 0）。
-/

namespace JapanTaxLaw.LandValuePerSquareMeter

def specPerSqm (v a : Nat) : Nat := if a = 0 then 0 else v / a

example : specPerSqm 1000 10 = 100 := by decide
example : specPerSqm 1000 3 = 333 := by decide

def agreeLandValuePerSquareMeter : Bool :=
  [ (0,1), (1000,1), (1000,3), (1000,10), (9999,7), (1000,0) ].all fun (v,a) =>
    valuePerSqm v a == specPerSqm v a

example : agreeLandValuePerSquareMeter = true := by decide

end JapanTaxLaw.LandValuePerSquareMeter
