import JapanTaxLaw.SpecialCorpBusinessTaxZeroFloor

/-
# SpecialCorpBusinessTaxZeroFloorSpec — 特別法人事業税施行令 附則2(1)(1) の独立定式

Pinned: law 431CO0000000089, revision 431CO0000000089_20240401_506CO0000000012,
supplementary article 2 Paragraph 1 Item 1; needle
「…払込予定額から…還付金等に相当する額を控除した額（…零とする。）」.

Independent restatement: the net amount is the caller's payment due minus
refunds, floored at zero. Definitions use their own identifiers; the agreement
theorem is a separate bridge.
-/

namespace JapanTaxLaw.SpecialCorpBusinessTaxZeroFloor

/-- 独立定式: 零下限の Nat 減算。impl 識別子は使わない。 -/
def specNet (due : Nat) (refund : Nat) : Nat :=
  due - refund

theorem agreeNet (due refund : Nat) :
    netAmount due refund = specNet due refund := by
  unfold netAmount specNet
  rfl

example : specNet 100 40 = 60 := by decide
example : specNet 40 100 = 0 := by decide
example : specNet 0 0 = 0 := by decide

end JapanTaxLaw.SpecialCorpBusinessTaxZeroFloor
