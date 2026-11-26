import JapanTaxLaw.TaxFinance

/-!
# TaxResearchCouncilQuorum — 税制調査会組織規則 art.7 §1（定足数）
Pinned: law 425CO0000000025, raw data/raw/425CO0000000025_20221202_504CO0000000367.law.json, Article 7 §1.
原文: 「調査会は、委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」
`present`: 出席者数 (人), `total`: 委員数 (人), Nat. 三分の一以上は inclusive。
Scope: numeric quorum only. Majority/tie-break/composition/procedure NOT MODELLED. No sorry/admit/axiom.
-/
namespace JapanTaxLaw.TaxResearchCouncilQuorum

@[reducible] def quorumMet (present total : Nat) : Prop :=
  0 < total ∧ 3 * present >= total

theorem quorumMonotone (present present' total : Nat) :
    present <= present' → quorumMet present total → quorumMet present' total := by
  unfold quorumMet
  intro hle hq
  constructor
  · exact hq.1
  · exact Nat.le_trans hq.2 (Nat.mul_le_mul_left 3 hle)

theorem notQuorumWhenZeroPresent (total : Nat) : 0 < total → ¬ quorumMet 0 total := by
  unfold quorumMet
  intro hpos hq
  have hzero : total = 0 := Nat.eq_zero_of_le_zero (by simpa using hq.2)
  rw [hzero] at hpos
  exact Nat.lt_irrefl 0 hpos

theorem allPresentSuffices (total : Nat) : 0 < total → quorumMet total total := by
  unfold quorumMet
  intro hpos
  constructor
  · exact hpos
  · have h13 : 1 <= 3 := by decide
    exact Nat.le_trans (Nat.le_refl total) (by simpa using Nat.mul_le_mul_right total h13)

end JapanTaxLaw.TaxResearchCouncilQuorum
