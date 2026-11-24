import JapanTaxLaw.TaxFinance

/-
# RefundDifferenceAmount — 所得税額の還付 第六条（前号控除後の残額）モデル

Pinned sources:
  Law id: 347M50000040042
  Revision: 347M50000040042_20251231_507M60000040072
  Raw snapshot: data/raw/347M50000040042_20251231_507M60000040072.law.json
  Article Num 6; normalized scoped leaf text.
  SHA-256 (raw bytes): a403b5c2cb0edd15cd1ad54f18a7a33132c74ac80b7f9afcdce7935b51aaf667

Verbatim 原文 needle (in scoped Article 6):
  「第三号に掲げる所得税の額から前号に掲げる所得税の額を控除した残額のうち還付を受けようとする金額」

Variable contract:
  item3Label = 3 — 第三号 (the item whose amount is the starting point)
  item3Amount = 第三号に掲げる所得税の額 (Nat, 円)
  prevAmount  = 前号に掲げる所得税の額 (Nat, 円)
  result      = 還付を受けようとする金額 (Nat, 円), saturating at 0

Computation: refundResidual = item3Amount - prevAmount.
  Nat subtraction is SATURATING: when prevAmount > item3Amount the residual is 0
  (no refund) — a refund is a non-negative amount and cannot be negative.

Scope: ONLY the explicit residual-after-deduction computation is modelled.
  The definitions of the items, the refund procedure and other paragraphs are
  NOT MODELLED. No signed Int adjustment is introduced here.
-/

namespace JapanTaxLaw.RefundDifferenceAmount

/-- 第三号の号番号。 -/
def item3Label : Nat := 3

/-- 還付額 = 第三号に掲げる所得税の額 − 前号に掲げる所得税の額。
    Nat 減算は zero-saturating: prevAmount > item3Amount なら 0（還付なし）。 -/
def refundResidual (item3Amount : Nat) (prevAmount : Nat) : Nat :=
  item3Amount - prevAmount

/-- 第三号 = 3。 -/
theorem item3Label_three : item3Label = 3 := rfl

/-- 通常の残額: 100 − 40 = 60。 -/
theorem refundResidual_100_40 : refundResidual 100 40 = 60 := by decide

/-- 飽和: 前号が第三号を上回れば残額 0（還付は負にならない）。 -/
theorem refundResidual_40_100 : refundResidual 40 100 = 0 := by decide

/-- 同額なら残額 0。 -/
theorem refundResidual_50_50 : refundResidual 50 50 = 0 := by decide

/-- 零入力なら残額 0。 -/
theorem refundResidual_0_0 : refundResidual 0 0 = 0 := by decide

end JapanTaxLaw.RefundDifferenceAmount
