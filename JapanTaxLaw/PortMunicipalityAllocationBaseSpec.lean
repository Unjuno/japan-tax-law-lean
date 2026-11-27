import JapanTaxLaw.PortMunicipalityAllocationBase

/-! # PortMunicipalityAllocationBase spec — 独立定式 (law 332AC0000000077 / art.2(2))

二以上を `Nat.succ (Nat.succ _)` による構造的パターンとして再記述する。
実装の識別子は使わない。 -/

namespace JapanTaxLaw.PortMunicipalityAllocationBase

def specBase (n : Nat) (portRevenue : Nat) (customsRevenue : Nat) : Nat :=
  match n with
  | 0 => portRevenue
  | 1 => portRevenue
  | Nat.succ (Nat.succ _) => customsRevenue

example : specBase 0 100 7 = 100 := by decide
example : specBase 1 100 7 = 100 := by decide
example : specBase 2 100 7 = 7 := by decide

/-- 実装と独立仕様の一致: 構造的 cases のみ、公理なし。 -/
theorem spec_agrees (n : Nat) (portRevenue : Nat) (customsRevenue : Nat) :
    allocationBase n portRevenue customsRevenue = specBase n portRevenue customsRevenue := by
  cases n with
  | zero => rfl
  | succ n =>
      cases n with
      | zero => rfl
      | succ n =>
          have h : Nat.succ (Nat.succ n) >= threshold := by
            unfold threshold
            exact Nat.succ_le_succ (Nat.succ_le_succ (Nat.zero_le n))
          simp [allocationBase, specBase, h]

end JapanTaxLaw.PortMunicipalityAllocationBase
