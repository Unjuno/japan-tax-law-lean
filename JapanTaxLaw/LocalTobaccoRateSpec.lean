import JapanTaxLaw.LocalTobaccoRate

/-!
# LocalTobaccoRateSpec — 独立仕様と帰納法による普遍対応証明

The spec restates the verbatim rate as repeated addition, NOT by calling the
implementation's multiplication. The theorem `agreeTobaccoRate` proves, for
ALL Nat (a genuine induction, not a finite sample), that the implementation's
multiplication equals the spec's iterated addition.
-/

namespace JapanTaxLaw.LocalTobaccoRate

/-- 独立仕様: 「千本につき千七十円」を再帰的加算として定式化。実装の乗算を呼ばない。 -/
def specTobaccoTaxYen : Nat → Nat
  | 0 => 0
  | n + 1 => specTobaccoTaxYen n + 1_070

/-- 実装 ≡ 独立仕様（全称。帰納法による証明; 有限領域の検査ではない）。 -/
theorem agreeTobaccoRate (thousandUnits : Nat) :
    tobaccoTaxYen thousandUnits = specTobaccoTaxYen thousandUnits := by
  induction thousandUnits with
  | zero =>
      unfold tobaccoTaxYen specTobaccoTaxYen
      simp
  | succ n ih =>
      simp [tobaccoTaxYen, ratePerThousand] at ih
      simp [tobaccoTaxYen, specTobaccoTaxYen, ratePerThousand, Nat.succ_mul]
      rw [ih]

/-- 仕様は単調（税率が正なので数量増で税額は増えない）。 -/
theorem spec_monotone : ∀ a b : Nat, a ≤ b → specTobaccoTaxYen a ≤ specTobaccoTaxYen b := by
  intro a b h
  rw [← agreeTobaccoRate a, ← agreeTobaccoRate b]
  unfold tobaccoTaxYen ratePerThousand
  exact Nat.mul_le_mul_right 1070 h

/-- 境界値。 -/
example : tobaccoTaxYen 0 = 0 := by decide
example : tobaccoTaxYen 1 = 1_070 := by decide
example : tobaccoTaxYen 10 = 10_700 := by decide

end JapanTaxLaw.LocalTobaccoRate
