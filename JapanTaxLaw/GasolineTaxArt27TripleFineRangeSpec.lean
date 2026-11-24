import JapanTaxLaw.GasolineTaxArt27TripleFineRange

/-!
# GasolineTaxArt27TripleFineRange spec — 三倍/100万円条件の独立定式

Sources (pinned): law 332AC0000000055, revision 332AC0000000055_20260525_506AC0000000052.
Independent restatement: 三倍を a * specMultiplier、範囲判定を否定形で記述。
実装識別子は再利用しない。Agreement は有限領域の kernel-decided 検査であり
普遍的な定理ではない。
-/

namespace JapanTaxLaw.GasolineTaxArt27TripleFineRange

def specMultiplier : Nat := 3

def specFloorYen : Nat := 1000000

def specThrice (a : Nat) : Nat := a * specMultiplier

def specOverFloor (a : Nat) : Bool := decide (specFloorYen < specThrice a)

def specInRange (a fine : Nat) : Bool :=
  (! (fine <= specFloorYen)) && (! (specThrice a < fine))

example : specThrice 333333 = 999999 := by decide
example : specThrice 333334 = 1000002 := by decide
example : specOverFloor 333333 = false := by decide
example : specOverFloor 333334 = true := by decide
example : specInRange 400000 1200000 = true := by decide

def agreeGasolineTaxArt27TripleFineRange : Bool :=
  [0, 1, 2, 3, 4, 333333, 333334, 400000, 999999, 1000000, 1000001].all (fun a =>
    (triple a == specThrice a) &&
    (specialApplies a == specOverFloor a) &&
    ([999999, 1000000, 1000001, specThrice a].all (fun fine =>
      withinFineRange a fine == specInRange a fine)))

example : agreeGasolineTaxArt27TripleFineRange = true := by decide

end JapanTaxLaw.GasolineTaxArt27TripleFineRange
