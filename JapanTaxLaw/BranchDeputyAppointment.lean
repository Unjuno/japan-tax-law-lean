import JapanTaxLaw.TaxFinance

/-
# BranchDeputyAppointment — 国税不服審判所組織令 第二条（支部指定＋各一人配置）delegation + per-unit count モデル

Pinned source:
  Law id: 345CO0000000050 (国税不服審判所組織令)
  Revision: 345CO0000000050_20010106_412CO0000000307
  Raw snapshot: data/raw/345CO0000000050_20010106_412CO0000000307.law.json
  sha256: 1084c2d40d7dd4535dfdd548819a261dfcf33d50952ab927b2b5db95345cc6da
  Article Num 2 (main provision, 111 chars).

原文逐語 (scoped Article 2, pinned 一字一句改変なし):
  「国税不服審判所の支部（以下「支部」という。）のうち財務省令で定めるものに、次席国税審判官各一人を置き、国税審判官をもつてこれに充てる。」

Variable contract:
  designatedBranches : Nat = 財務省令で定める支部の数 (支部);
  deputyPerBranch : Nat = 各一人 (人/支部), exactly ONE deputy per designated branch;
  result : Nat = 次席国税審判官の数 (人).
  designationByOrdinance : Bool = true encodes the DELEGATION to 財務省令: the
  ordinance designates WHICH branches are covered. This is a delegation flag,
  NOT a numeric threshold and NOT a count cutoff.

Norm type: DELEGATION (財務省令 designation) combined with a fixed per-unit
appointment count (各一人). The total is designation count × one.
Scope: only the ordinance-designation trigger and the one-per-designated-branch
count. The designation procedure itself, the 国税審判官 appointment mechanics
and other articles are NOT MODELLED.
This model provides no legal review. No `sorry`, `axiom`, `Classical.choice`,
`omega`, struct literals or `by_cases`; every proof is `rfl` / `decide`.
-/

namespace JapanTaxLaw.BranchDeputyAppointment

/-- 各一人: exactly one 次席国税審判官 per ordinance-designated branch. -/
def deputyPerBranch : Nat := 1

/-- 財務省令で定めるもの: designation delegated to Ministry of Finance ordinance.
    Bool DELEGATION flag, NOT a numeric threshold. -/
def designationByOrdinance : Bool := true

/-- Total 次席国税審判官 = ordinance-designated branches × one per branch. -/
def deputyCount (designatedBranches : Nat) : Nat := designatedBranches * deputyPerBranch

theorem deputyPerBranch_ok : deputyPerBranch = 1 := by rfl
theorem designationByOrdinance_ok : designationByOrdinance = true := by decide
theorem deputyCount_zero : deputyCount 0 = 0 := by rfl
theorem deputyCount_one : deputyCount 1 = 1 := by rfl
theorem deputyCount_three : deputyCount 3 = 3 := by rfl
theorem deputyCount_ten : deputyCount 10 = 10 := by rfl

end JapanTaxLaw.BranchDeputyAppointment
