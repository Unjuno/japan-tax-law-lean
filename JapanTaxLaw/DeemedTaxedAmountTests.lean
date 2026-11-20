import JapanTaxLaw.DeemedTaxedAmount
import JapanTaxLaw.DeemedTaxedAmountSpec

/-!
# DeemedTaxedAmountTests — kernel-decided tests for the deeming rule
-/
namespace JapanTaxLaw.DeemedTaxedAmountTests

open JapanTaxLaw.DeemedTaxedAmount
open JapanTaxLaw.DeemedTaxedAmountSpec

/-- 実装と独立仕様の対応: 金额・状態の両方が一致する。 -/
theorem agrees_with_implementation (value : Nat) (flag : Bool) :
    let a : AmountState := { valueYen := value, taxableFlag := flag }
    let s : SpecAmount := { yen := value, alreadyTaxed := flag }
    (deemTaxed a).valueYen = (specDeem s).yen ∧
    (deemTaxed a).taxableFlag = true ∧
    (specDeem s).alreadyTaxed = true := by
  simp [deemTaxed, specDeem]

example : (deemTaxed { valueYen := 0, taxableFlag := false }).valueYen = 0 := by rfl
example : (deemTaxed { valueYen := 1000, taxableFlag := false }).valueYen = 1000 := by rfl
example : (deemTaxed { valueYen := 1000, taxableFlag := false }).taxableFlag = true := by rfl
example : (deemTaxed { valueYen := 1000, taxableFlag := true }).taxableFlag = true := by rfl
example : deemTaxed (deemTaxed { valueYen := 1000, taxableFlag := false }) =
    deemTaxed { valueYen := 1000, taxableFlag := false } := by decide

end JapanTaxLaw.DeemedTaxedAmountTests
