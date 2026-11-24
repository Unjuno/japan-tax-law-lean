import JapanTaxLaw.FilingDateException

/-
# FilingDateExceptionSpec — independent spec for 第六条の期限前例外

Pinned law 426CO0000000139, revision 426CO0000000139_20260401_508CO0000000095,
Article 6 needle: 「ただし、当該指定された期日が当該他の通算法人の同条第一項の規定による申告書の提出期限前の日である場合は、この限りでない。」

Independent restatement (no implementation identifiers in the spec defs):
  specItemRef     = 1 (cross-reference 第一項, not a statutory threshold);
  specBefore d f  = decide (d < f) (STRICT before);
  specBaseApplies d f = decide (f <= d) (complement).
Only numeral 1 occurs, so generate_verification_evidence.spec_literals() is []
by design (it filters v > 1); the structural literal is verified directly via
source_literals_verified({1}, scoped) = True, with 一 present in scoped Article 6.
-/

namespace JapanTaxLaw.FilingDateException

def specItemRef : Nat := 1

def specBefore (d : Nat) (f : Nat) : Bool :=
  decide (d < f)

def specBaseApplies (d : Nat) (f : Nat) : Bool :=
  decide (f <= d)

theorem agreeItemRef : itemOneRef = specItemRef := by unfold itemOneRef specItemRef; rfl

theorem agreeBefore (d : Nat) (f : Nat) : isBeforeDeadline d f = specBefore d f := by
  unfold isBeforeDeadline specBefore
  rfl

theorem agreeBase (d : Nat) (f : Nat) : baseRuleApplies d f = specBaseApplies d f := by
  unfold baseRuleApplies specBaseApplies
  rfl

end JapanTaxLaw.FilingDateException
