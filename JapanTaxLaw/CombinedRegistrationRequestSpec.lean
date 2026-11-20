import JapanTaxLaw.CombinedRegistrationRequest

/-
# CombinedRegistrationRequestSpec — independent spec for 昭和二十二年政令第百九号 第三条

Pinned source:
  Law id: 322CO0000000109
  Revision: 322CO0000000109_19470627_000000000000000
  Raw snapshot: data/raw/322CO0000000109_19470627_000000000000000.law.json
  Statutory article: 第三条 (art. 3)

原文逐語:
  「前二条の場合において同一の登記所の管轄内に在る二箇以上の不動産につき登記を嘱託するには、登記原因又は登記の目的が同一でなくても、同一の嘱託書でその登記を嘱託することができる。」

The implementation is `sameOffice && 2 <= propertyCount`. This spec is an
INDEPENDENT formulation: it splits on the office flag and enumerates the
property-count cases structurally (0 or 1 rejected, 二箇及以上 accepted), with
its own threshold constant. It does not reuse any implementation definition;
only the `agree*` helpers below bridge to the implementation for comparison.
-/

namespace JapanTaxLaw.CombinedRegistrationRequest

/-- Spec-local statutory threshold: 二箇 (= 2). -/
def specMinProperties : Nat := 2

/-- Independent formula: same office AND at least 二箇 properties. -/
def specCanCombine (sameOffice : Bool) (propertyCount : Nat) : Bool :=
  match sameOffice with
  | false => false
  | true =>
      match propertyCount with
      | 0 => false
      | 1 => false
      | _ + 2 => true

/-- Kernel-checked equivalence of the two formulations for every input. -/
theorem agree_combined_registration (sameOffice : Bool) (propertyCount : Nat) :
    canCombineRequest sameOffice propertyCount = specCanCombine sameOffice propertyCount := by
  cases sameOffice with
  | false => simp [canCombineRequest, specCanCombine]
  | true =>
      cases propertyCount with
      | zero => simp [canCombineRequest, specCanCombine]
      | succ n =>
          cases n with
          | zero => simp [canCombineRequest, specCanCombine]
          | succ n => simp [canCombineRequest, specCanCombine]

/-- Finite Bool agreement grid; the universal theorem above is the proof. -/
def agreeCombinedRegistration : Bool :=
  [false, true].all fun so =>
    [0, 1, 2, 3, 10].all fun n =>
      canCombineRequest so n == specCanCombine so n

example : agreeCombinedRegistration = true := by decide

end JapanTaxLaw.CombinedRegistrationRequest
