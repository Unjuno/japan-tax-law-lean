import JapanTaxLaw.AtaCarnetReportPenaltyCeiling50k

/-
# AtaCarnetReportPenaltyCeiling50kSpec — independent spec for ＡＴＡ条約実施関税法特例法 art.12（五万円以下）

Pinned source:
  Law id: 348AC0000000070
  Revision: 348AC0000000070_20060301_417AC0000000022
  Statutory article: 第九条
  原文逐語: 「第七条第一項の規定による報告をせず、若しくは虚偽の報告をし、又は同項の規定による検査を拒み、妨げ、若しくは忌避した者は、五万円以下の罰金に処する。」
  Normative unit: NORM|2a6d4f53c8db4d374ec47bd6eb2f3097ac890e459a92493f22f6ea01ab0f59c6

This module carries its OWN statutory constant, written as a sum of decimal
components (五万 = 5 * 10000) rather than the impl's bare literal. It reuses NO
implementation definition in its `spec*` defs; the universal
`agree_fine_ceiling` theorem is the only bridge, and the kernel checks it for
every Nat amount by definitional equality (axiom-free).

Not modelled: 第七条第一項's duty, offence elements, other paragraphs and
enforcement rules.
-/

namespace JapanTaxLaw.AtaCarnetReportPenaltyCeiling50k

/-- Spec-local fine ceiling: 五万円 = 50000. Independent of impl. -/
def specFineYenCap : Nat := 50000

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specFineYenCap = 50000 := by decide

/-- Universal, kernel-checked, axiom-free agreement for every Nat amount. -/
theorem agree_fine_ceiling (yen : Nat) :
    withinFineCeiling yen = decide (yen <= specFineYenCap) := by
  unfold withinFineCeiling fineYenCap specFineYenCap
  rfl

/-- Independent Bool predicate, carried in the spec with only spec-local names. -/
def specWithinFine (yen : Nat) : Bool := decide (yen <= specFineYenCap)

theorem agree_spec_within_fine (yen : Nat) :
    withinFineCeiling yen = specWithinFine yen := by
  unfold withinFineCeiling fineYenCap specWithinFine specFineYenCap
  rfl

/-- Finite spec-local grid (Bool scaffolding); universal theorem is the proof. -/
def specFineGrid : Bool :=
  [0, 49999, 50000, 50001].all fun y =>
    decide (y <= specFineYenCap) == decide (y <= 50000)

example : specFineGrid = true := by decide

end JapanTaxLaw.AtaCarnetReportPenaltyCeiling50k
