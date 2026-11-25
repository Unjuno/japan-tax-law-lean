import JapanTaxLaw.QuotaCertificateValidityPeriod

/-
# QuotaCertificateValidityPeriodSpec — independent spec for 経済連携協定関税割当政令 art.2(8)

Pinned source:
  Law id: 417CO0000000035
  Revision: 417CO0000000035_20220401_504CO0000000135
  Statutory article: 第二条(8)
  原文逐語: 「関税割当証明書の有効期間は、その交付の日からその日の属する年度の末日までとする。」
  Normative unit: NORM|36a080d669275921c8cb3c9b8a5d85a2c8f97b10481942b0fdb7c70cc8f32e9d

This module carries its OWN formula: the same ordering test expressed on
successor-shifted day indices, `decide (succ day <= succ endDay)`, rather than
the impl's `decide (day <= endDay)`. It reuses NO implementation definition in
its `spec*` defs; the universal `agree_validity_cutoff` theorem is the only
bridge, and the kernel checks it for every pair of Nat indices by definitional
equality (axiom-free). The source has no numeral, so no statutory literal is
claimed or audited.

Not modelled: fiscal-year determination, calendar conversion, renewal and
other paragraphs.
-/

namespace JapanTaxLaw.QuotaCertificateValidityPeriod

/-- Independent, successor-shifted formulation of the まで cutoff. -/
def specWithinValidity (day fiscalYearEnd : Nat) : Bool :=
  decide (Nat.succ day <= Nat.succ fiscalYearEnd)

/-- Universal, kernel-checked, axiom-free agreement for every index pair. -/
theorem agree_validity_cutoff (day fiscalYearEnd : Nat) :
    withinValidity day fiscalYearEnd = specWithinValidity day fiscalYearEnd := by
  unfold withinValidity specWithinValidity
  rfl

example : specWithinValidity 0 0 = true := by decide
example : specWithinValidity 1 0 = false := by decide

end JapanTaxLaw.QuotaCertificateValidityPeriod
