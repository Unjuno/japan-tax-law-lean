/-\!
# DateSelectionNormsSpec — 独立形式仕様

pinned 原文（いずれか早い日／遅い日 46条片）から独立に読み取った仕様。
実装を import しない。具体的な日付は NOT MODELLED。
-/
namespace JapanTaxLaw.DateSelectionNormsSpec

def minSpec (a b : Nat) : Nat := if a <= b then a else b
def maxSpec (a b : Nat) : Nat := if b <= a then a else b

theorem minSpec_eq (a b : Nat) : minSpec a b = min a b := by
  unfold minSpec
  split
  · exact (Nat.min_eq_left ‹a <= b›).symm
  · have h : b <= a := by omega
    exact (Nat.min_eq_right h).symm
theorem maxSpec_eq (a b : Nat) : maxSpec a b = max a b := by
  unfold maxSpec
  split
  · exact (Nat.max_eq_left ‹b <= a›).symm
  · have h : a <= b := by omega
    exact (Nat.max_eq_right h).symm

end JapanTaxLaw.DateSelectionNormsSpec
