import JapanTaxLaw.AtaCarnetReportPenaltyCeiling50kSpec

/-
# AtaCarnetReportPenaltyCeiling50kTests — kernel-decided checks for ＡＴＡ条約実施関税法特例法 art.12

Closed Nat/Bool expressions discharged by `by decide`, or theorem applications.
Coverage: the pinned ceiling, inclusive boundary, one-over, one yen, zero,
Nat identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.AtaCarnetReportPenaltyCeiling50k

-- (a) pinned statutory value: 五万円 = 50000.
example : fineYenCap = 50000 := rfl

-- (b) boundary and nearby amounts.
example : withinFineCeiling 0 = true := by decide
example : withinFineCeiling 1 = true := by decide
example : withinFineCeiling 50000 = true := by decide
example : withinFineCeiling 50001 = false := by decide

-- (c) Nat identity at the ceiling.
example : 50000 + 0 = 50000 := by decide

-- (d) kernel-decided impl/spec agreement.
example : withinFineCeiling 0 = decide (0 <= specFineYenCap) := by decide
example : withinFineCeiling 50000 = decide (50000 <= specFineYenCap) := by decide
example : withinFineCeiling 50001 = decide (50001 <= specFineYenCap) := by decide

-- (e) universal theorem applied to an arbitrary amount.
example (y : Nat) : withinFineCeiling y = decide (y <= specFineYenCap) := agree_fine_ceiling y

-- (f) independent spec value.
example : specFineYenCap = 50000 := by decide

end JapanTaxLaw.AtaCarnetReportPenaltyCeiling50k
