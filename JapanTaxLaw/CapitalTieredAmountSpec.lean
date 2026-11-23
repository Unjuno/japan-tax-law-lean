import JapanTaxLaw.CapitalTieredAmount

/-
# CapitalTieredAmountSpec — independent spec for 第一条 (three-tier capital amount)

Independently transcribed the three-tier amount structure with its own constants:
  specBase = 5000000   (五百万円)
  specMidCap = 50000000  (五千万円 — lower bracket boundary)
  specHighCap = 100000000 (一億円 — upper bracket boundary)
  specMidAmt = 10000000  (千万円 — 五千万円超一億円以下)
  specHighAmt = 20000000 (二千万円 — 一億円超)
No implementation identifiers occur inside the spec* definitions. Agreement with
the implementation is established by the kernel bridges below.
-/

namespace JapanTaxLaw.CapitalTieredAmountSpec

open JapanTaxLaw.CapitalTieredAmount

/-- 五百万円 — independent base amount. -/
def specBase : Nat := 5000000

/-- 五千万円 — independent lower bracket boundary. -/
def specMidCap : Nat := 50000000

/-- 一億円 — independent upper bracket boundary. -/
def specHighCap : Nat := 100000000

/-- 千万円 — independent mid-tier amount. -/
def specMidAmt : Nat := 10000000

/-- 二千万円 — independent high-tier amount. -/
def specHighAmt : Nat := 20000000

/-- Independent three-tier amount (same statutory boundaries, own constants). -/
def specRequired (capital : Nat) : Nat :=
  if capital <= specMidCap then
    specBase
  else if capital <= specHighCap then
    specMidAmt
  else
    specHighAmt

theorem agreeBase : baseAmount = specBase := by
  unfold baseAmount specBase
  rfl

theorem agreeMidCap : midCapital = specMidCap := by
  unfold midCapital specMidCap
  rfl

theorem agreeHighCap : highCapital = specHighCap := by
  unfold highCapital specHighCap
  rfl

theorem agreeMidAmt : midAmount = specMidAmt := by
  unfold midAmount specMidAmt
  rfl

theorem agreeHighAmt : highAmount = specHighAmt := by
  unfold highAmount specHighAmt
  rfl

theorem agreeRequired (capital : Nat) : requiredAmount capital = specRequired capital := by
  unfold requiredAmount specRequired baseAmount specBase midCapital specMidCap highCapital specHighCap midAmount specMidAmt highAmount specHighAmt
  rfl

end JapanTaxLaw.CapitalTieredAmountSpec
