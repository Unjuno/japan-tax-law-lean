import JapanTaxLaw.RefundDifferenceAmount

/-
# RefundDifferenceAmount spec — 所得税額の還付 第六条 の独立定式

Pinned sources: law 347M50000040042,
revision 347M50000040042_20251231_507M60000040072,
raw data/raw/347M50000040042_20251231_507M60000040072.law.json, Article Num 6.

Independent restatement: 還付額 = 第三号の額 − 前号の額, zero-saturating
(前号が第三号を上回るなら 0). The spec writes its own Nat subtraction;
no implementation identifier (item3Label / refundResidual) is reused.
Both sides reduce to `item3Amount - prevAmount`, so each bridge closes by rfl.
-/

namespace JapanTaxLaw.RefundDifferenceAmount

/-- 独立定式: 第三号 = 三。impl 識別子は使わない。 -/
def specItem3 : Nat := 3

/-- 独立定式: 控除後の残額（Nat 減算の零飽和）。impl 識別子は使わない。 -/
def specResidual (item3Amount : Nat) (prevAmount : Nat) : Nat :=
  item3Amount - prevAmount

theorem agreeItem3 : item3Label = specItem3 := by unfold item3Label specItem3; rfl

theorem agreeResidual (item3Amount : Nat) (prevAmount : Nat) :
    refundResidual item3Amount prevAmount = specResidual item3Amount prevAmount := by
  unfold refundResidual specResidual
  rfl

end JapanTaxLaw.RefundDifferenceAmount
