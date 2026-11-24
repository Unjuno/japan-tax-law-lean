import JapanTaxLaw.OilGasGrantArt4Rounding

/-!
# OilGasGrantArt4Rounding spec — 千円未満端数控除の独立定式

Sources (pinned): law 340AC0000000157, revision 340AC0000000157_20090401_421AC0000000009.
Independent restatement: 端数そのものを引き算する（実装の商×単位とは別の定式）。
Agreement is a finite, kernel-decided grid check — NOT a universal theorem.
-/

namespace JapanTaxLaw.OilGasGrantArt4Rounding

def specRoundingUnit : Nat := 1000

/-- 独立定式: computed - (computed % 1000)。実装(def grantYenRounded)の識別子を再利用しない。 -/
def specRounded (computed : Nat) : Nat :=
  computed - computed % specRoundingUnit

example : specRounded 999 = 0 := by decide
example : specRounded 1000 = 1000 := by decide
example : specRounded 2500 = 2000 := by decide

/-- 有限領域での反例検査。普遍的な正しさの主張ではない。 -/
def agreeOilGasGrantArt4Rounding : Bool :=
  [0, 1, 999, 1000, 1001, 1999, 2000, 2500, 12345].all fun a =>
    grantYenRounded a == specRounded a

example : agreeOilGasGrantArt4Rounding = true := by decide

end JapanTaxLaw.OilGasGrantArt4Rounding
