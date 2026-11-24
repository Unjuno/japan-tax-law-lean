import JapanTaxLaw.LiquorTaxInstallment

/-!
# LiquorTaxInstallmentSpec — 独立仕様と普遍的な対応証明

Source fidelity: this spec restates the installment-month classification directly
from the pinned 原文 of 酒税法 附則八条三項 (see LiquorTaxInstallment.lean).
It does NOT call the implementation's `installmentMonths`.

The spec is a *relation* `specInstallmentMonths tax months` rather than a
function, stating the five verbatim branches as implications. The implementation
is total and deterministic; the theorem `agreeInstallmentMonths` proves, for
ALL `tax : Nat` (not a finite sample), that the implementation returns exactly
the months the relation prescribes. This is a genuine universal proof, not a
finite-domain agreement check.

Variables: tax ∈ Nat (円), months ∈ Nat (分割月数), domain unrestricted Nat.
-/

namespace JapanTaxLaw.LiquorTaxInstallment

/-- 独立仕様（関係としての原文の五区分）。実装関数を呼ばない。 -/
def specInstallmentMonths (tax months : Nat) : Prop :=
  (tax ≤ 30_000 → months = 1) ∧
  (30_000 < tax ∧ tax ≤ 100_000 → months = 2) ∧
  (100_000 < tax ∧ tax ≤ 300_000 → months = 3) ∧
  (300_000 < tax ∧ tax ≤ 500_000 → months = 4) ∧
  (500_000 < tax → months = 5)

/-- 仕様が成立する分割月数は一意（重複・矛盾なし）。 -/
theorem spec_unique (tax m1 m2 : Nat)
    (h1 : specInstallmentMonths tax m1) (h2 : specInstallmentMonths tax m2) : m1 = m2 := by
  unfold specInstallmentMonths at h1 h2
  by_cases a : tax ≤ 30_000
  · exact (h1.1 a).trans (h2.1 a).symm
  · by_cases b : tax ≤ 100_000
    · have hb : 30_000 < tax ∧ tax ≤ 100_000 := ⟨Nat.lt_of_not_ge a, b⟩
      exact (h1.2.1 hb).trans (h2.2.1 hb).symm
    · by_cases c : tax ≤ 300_000
      · have hc : 100_000 < tax ∧ tax ≤ 300_000 := ⟨Nat.lt_of_not_ge b, c⟩
        exact (h1.2.2.1 hc).trans (h2.2.2.1 hc).symm
      · by_cases d : tax ≤ 500_000
        · have hd : 300_000 < tax ∧ tax ≤ 500_000 := ⟨Nat.lt_of_not_ge c, d⟩
          exact (h1.2.2.2.1 hd).trans (h2.2.2.2.1 hd).symm
        · have he : 500_000 < tax := Nat.lt_of_not_ge d
          exact (h1.2.2.2.2 he).trans (h2.2.2.2.2 he).symm

/-- 実装 ≡ 独立仕様（全称。有限領域の検査ではない）。 -/
theorem agreeInstallmentMonths (tax : Nat) :
    specInstallmentMonths tax (installmentMonths tax) := by
  unfold specInstallmentMonths
  unfold installmentMonths thresholdSingle threshold2 threshold3 threshold4
  by_cases h1 : tax ≤ 30_000
  · simp [h1]
    omega
  · by_cases h2 : tax ≤ 100_000
    · simp [h1, h2]
      omega
    · by_cases h3 : tax ≤ 300_000
      · simp [h1, h2, h3]
        omega
      · by_cases h4 : tax ≤ 500_000
        · simp [h1, h2, h3, h4]
        · simp [h1, h2, h3, h4]

/-- 原典の五区分は全域を覆う（到達可能性・非空性）。 -/
theorem spec_total (tax : Nat) : ∃ months, specInstallmentMonths tax months :=
  ⟨installmentMonths tax, agreeInstallmentMonths tax⟩

/-- 境界値の具体的検証（原文の端点）。 -/
example : installmentMonths 0 = 1 := by decide
example : installmentMonths 30_000 = 1 := by decide
example : installmentMonths 30_001 = 2 := by decide
example : installmentMonths 100_000 = 2 := by decide
example : installmentMonths 100_001 = 3 := by decide
example : installmentMonths 300_000 = 3 := by decide
example : installmentMonths 300_001 = 4 := by decide
example : installmentMonths 500_000 = 4 := by decide
example : installmentMonths 500_001 = 5 := by decide

end JapanTaxLaw.LiquorTaxInstallment
