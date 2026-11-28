import JapanTaxLaw.LocalGasolineArt7PaymentAllocation287

/-!
# LocalGasolineArt7PaymentAllocation287 spec — 44/287・243/287 配分の独立定式

Sources (pinned): law 330AC0000000104, revision 330AC0000000104_20260401_508AC0000000012.
Independent restatement: 配分を「分子を引いて残り」として書き（地方 = amount - amount*243/287）、
元の実装識別子を再利用しない。有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.LocalGasolineArt7PaymentAllocation287

def specDen : Nat := 287

def specNationalNum : Nat := 243

/-- 地方分の分子（四十四）。 -/
def specLocalNum : Nat := 44

def specNational (amount : Nat) : Nat := amount * specNationalNum / specDen

/-- 地方分は独立に分子44・分母287で計算する（残差方式ではない）。 -/
def specLocal (amount : Nat) : Nat := amount * specLocalNum / specDen

example : specLocal 287 = 44 := by decide
example : specNational 287 = 243 := by decide

def agreeLocalGasolineArt7PaymentAllocation287 : Bool :=
  [0, 1, 286, 287, 288, 574, 1000].all (fun a =>
    localShare a == specLocal a && nationalShare a == specNational a)

example : agreeLocalGasolineArt7PaymentAllocation287 = true := by decide

end JapanTaxLaw.LocalGasolineArt7PaymentAllocation287
