import JapanTaxLaw.BranchDeputyAppointment

/-
# BranchDeputyAppointmentSpec — independent spec for 国税不服審判所組織令 第二条

Sources (pinned): law 345CO0000000050,
revision 345CO0000000050_20010106_412CO0000000307,
data/raw/345CO0000000050_20010106_412CO0000000307.law.json,
sha256 1084c2d40d7dd4535dfdd548819a261dfcf33d50952ab927b2b5db95345cc6da.

Independent restatement of the scoped Article 2 needle: branches designated by
財務省令 each receive exactly one (各一人) 次席国税審判官; the ordinance
designation is a DELEGATION, not a numeric threshold. Total = designated
branches × 1. No implementation identifier appears in the spec* DEFINITIONS
below; only the bridge theorems reference the implementation.
-/

namespace JapanTaxLaw.BranchDeputyAppointment

/-- Independent per-branch count: 各一人 = 1. -/
def specPerBranch : Nat := 1

/-- Independent delegation flag: 財務省令 designation (not a numeric threshold). -/
def specDelegated : Bool := true

/-- Independent total: ordinance-designated branches × one per branch. -/
def specDeputyCount (designatedBranches : Nat) : Nat := designatedBranches * specPerBranch

/-- Bridge: the two independently typed per-branch counts agree (by rfl). -/
theorem agreePerBranch : deputyPerBranch = specPerBranch := by unfold deputyPerBranch specPerBranch; rfl

/-- Bridge: the two independently typed delegation flags agree (by rfl). -/
theorem agreeDelegated : designationByOrdinance = specDelegated := by unfold designationByOrdinance specDelegated; rfl

/-- Bridge: both totals agree. Unfold all four constants: after unfolding the
    two count functions their bodies still contain the per-branch constants. -/
theorem agreeDeputyCount (designatedBranches : Nat) :
    deputyCount designatedBranches = specDeputyCount designatedBranches := by
  unfold deputyCount specDeputyCount deputyPerBranch specPerBranch
  rfl

end JapanTaxLaw.BranchDeputyAppointment
