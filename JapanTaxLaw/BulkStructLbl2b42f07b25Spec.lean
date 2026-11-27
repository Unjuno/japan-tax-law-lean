import JapanTaxLaw.BulkStructLbl2b42f07b25

/-! Independent branch-form spec per label namespace. -/
namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x603d6966a1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x603d6966a1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x58b7a9f38f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x58b7a9f38f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe1a8028d9b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe1a8028d9b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6ef686c240
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6ef686c240

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf1078766fd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf1078766fd

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x105d434ebd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x105d434ebd

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x89a4aea1c5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x89a4aea1c5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x41946c6f98
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x41946c6f98

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6d7278c8d9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6d7278c8d9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xff1f907a7b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xff1f907a7b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1e461bab90
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1e461bab90

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbde7149dc2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbde7149dc2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1b2d5a9562
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1b2d5a9562

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xdc253df3da
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xdc253df3da

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa06a6f5cb3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa06a6f5cb3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x01c99dc643
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x01c99dc643

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x53ac87bbf5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x53ac87bbf5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x16cbf7ee1b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x16cbf7ee1b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2646396b73
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2646396b73

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0737ff7ae5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0737ff7ae5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd7b6fbfc7a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd7b6fbfc7a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6960b5d832
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6960b5d832

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7d7d0ba7de
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7d7d0ba7de

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3b2a663423
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3b2a663423

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd4b7c063d5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd4b7c063d5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8ffa95b329
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8ffa95b329

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xeb31534b1f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xeb31534b1f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xead29f93ed
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xead29f93ed

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd99771cfa8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd99771cfa8

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe764fdd45b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe764fdd45b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x156a3f87fa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x156a3f87fa

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x499ed7a92b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x499ed7a92b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x164da6fa4f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x164da6fa4f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa619636dba
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa619636dba

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x519ec556fc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x519ec556fc

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x93eadc8707
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x93eadc8707

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbfde6a7b3b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbfde6a7b3b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9745443489
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9745443489

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5793b49550
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5793b49550

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x755a54ca6a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x755a54ca6a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xabae91033e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xabae91033e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xcb6a19df5b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xcb6a19df5b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x23b2afbd93
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x23b2afbd93

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe76443dca3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe76443dca3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3e768075b9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3e768075b9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x10c39cd295
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x10c39cd295

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xeeb3fe534f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xeeb3fe534f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x371c1e9e58
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x371c1e9e58

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x852a63ff7e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x852a63ff7e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc27233bb90
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc27233bb90

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x30272e26b2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x30272e26b2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x385245d017
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x385245d017

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9d124764ed
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9d124764ed

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9b0dc1b486
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9b0dc1b486

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2f96b8d8b7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2f96b8d8b7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x41c2d42247
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x41c2d42247

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xedb4da71ba
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xedb4da71ba

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5c8dd2c0b4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5c8dd2c0b4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x59427be1c3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x59427be1c3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf109310126
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf109310126

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd0ccb0b065
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd0ccb0b065

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x660c1d1dc5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x660c1d1dc5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x030c1f62cb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x030c1f62cb

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc391f7b35e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc391f7b35e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6bec10418d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6bec10418d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x95ffdc72c5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x95ffdc72c5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x54372a14ef
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x54372a14ef

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6aa223c4ca
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6aa223c4ca

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x4053fbc6aa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x4053fbc6aa

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc6ab6689d3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc6ab6689d3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x39a744457c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x39a744457c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x53488aea35
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x53488aea35

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x24de69326a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x24de69326a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa5dfd66dd6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa5dfd66dd6

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbd7954e31d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbd7954e31d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9c515b982f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9c515b982f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb4f20f796b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb4f20f796b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1c5a6d366a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1c5a6d366a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc09a6bcb7b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc09a6bcb7b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x24eeb0dc05
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x24eeb0dc05

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0690a4e152
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0690a4e152

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbe0a18c4b7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbe0a18c4b7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5ad732137e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5ad732137e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc74fb4bcad
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc74fb4bcad

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x11ec4ccb85
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x11ec4ccb85

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5906fabdce
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5906fabdce

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe9fdbdbd32
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe9fdbdbd32

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x29afa87ef9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x29afa87ef9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe2771d8a0f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe2771d8a0f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x83609b2834
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x83609b2834

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x837ce874a4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x837ce874a4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x25893663fe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x25893663fe

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc829c846da
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc829c846da

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd9bd40ac1a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd9bd40ac1a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5133752917
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5133752917

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0efbaa7829
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0efbaa7829

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x727c930a26
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x727c930a26

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x52d65b34fc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x52d65b34fc

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x98f3419309
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x98f3419309

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc7ff944333
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc7ff944333

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x174f3e152f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x174f3e152f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xcc155b9600
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xcc155b9600

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x646717dbae
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x646717dbae

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9a92404753
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9a92404753

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x040741f102
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x040741f102

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf24d3372a4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf24d3372a4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7b3540005f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7b3540005f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9d91ef90d8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9d91ef90d8

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xdef6544874
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xdef6544874

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7a921c5fd4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7a921c5fd4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xadc530b7ad
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xadc530b7ad

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xefc608feea
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xefc608feea

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb3affe5aef
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb3affe5aef

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa81fd8f377
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa81fd8f377

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0a50cdbd37
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0a50cdbd37

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7cb1ab6d6a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7cb1ab6d6a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2c952f39ce
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2c952f39ce

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xfb78249c7f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xfb78249c7f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6f06d651c0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6f06d651c0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe74a737064
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe74a737064

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x74c03f2018
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x74c03f2018

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xee18eb6179
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xee18eb6179

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9320bdc706
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9320bdc706

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x851d6c4183
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x851d6c4183

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3cd06a5c20
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3cd06a5c20

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x4762954a90
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x4762954a90

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1186428a2d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1186428a2d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x35b8e04573
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x35b8e04573

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8bbde9abf1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8bbde9abf1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x36e70a736d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x36e70a736d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb470b9beef
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb470b9beef

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd3aba98a70
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd3aba98a70

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb45fb756d5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb45fb756d5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb9ed87dddc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb9ed87dddc

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5c0c836e47
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5c0c836e47

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x23fbef399e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x23fbef399e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa8dd37d201
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa8dd37d201

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2a58ddaa74
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2a58ddaa74

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa07fb2194c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa07fb2194c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xebde7169f1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xebde7169f1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe81ae4db38
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe81ae4db38

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x34fc62e175
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x34fc62e175

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8e14704ade
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8e14704ade

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xfde31081f9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xfde31081f9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2cdd7b7789
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2cdd7b7789

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xdfedbef015
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xdfedbef015

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbdd8894dc1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbdd8894dc1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0b4266201d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0b4266201d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc7bb2cd4c1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc7bb2cd4c1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x185a7fbcaf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x185a7fbcaf

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x4037c5343b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x4037c5343b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc4b5a9686f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc4b5a9686f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3e3505c948
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3e3505c948

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0e5ad8e549
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0e5ad8e549

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8585f27b74
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8585f27b74

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x49e27d221b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x49e27d221b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x147efa2d85
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x147efa2d85

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xba06780c94
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xba06780c94

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1746848bbb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1746848bbb

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc43b5d2c4b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc43b5d2c4b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd41230fcac
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd41230fcac

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x04d7daa50d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x04d7daa50d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8782a25f78
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8782a25f78

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x24fa2285fb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x24fa2285fb

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd55572e736
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd55572e736

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xaebaaaf4a2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xaebaaaf4a2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbb22afbd2d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbb22afbd2d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7c77419233
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7c77419233

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x4a3a7199cf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x4a3a7199cf

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7a5db0bef1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7a5db0bef1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0eaf201e96
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0eaf201e96

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8949977c88
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8949977c88

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x162b32f8a6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x162b32f8a6

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbc35b627d5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbc35b627d5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x69fffa7c50
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x69fffa7c50

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9b79e8a0f6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9b79e8a0f6

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x87debc1ad6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x87debc1ad6

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x23783e243a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x23783e243a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3b5537f7db
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3b5537f7db

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xfdbb4b8f79
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xfdbb4b8f79

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xfd2c966062
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xfd2c966062

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x495f4a5dcc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x495f4a5dcc

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6aff1a994c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6aff1a994c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x68f5246c4a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x68f5246c4a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0569a90d94
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0569a90d94

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5d73189181
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5d73189181

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x82f717155d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x82f717155d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x06065ac7bf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x06065ac7bf

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x91ea07d89c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x91ea07d89c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x735140f30d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x735140f30d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x48748ac09b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x48748ac09b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9b36b8fdf8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9b36b8fdf8

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xea7f839e92
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xea7f839e92

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xeffcd1e226
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xeffcd1e226

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x65ce81db62
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x65ce81db62

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7d007643a5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7d007643a5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc704ff7e7a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc704ff7e7a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9d7a8dfafe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9d7a8dfafe

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x987a619e8c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x987a619e8c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x303cb4c1be
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x303cb4c1be

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3b09a1bee2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3b09a1bee2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x841eecb21d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x841eecb21d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8679ad2bfc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8679ad2bfc

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x285996a922
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x285996a922

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xfe4ce9559e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xfe4ce9559e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x986086e393
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x986086e393

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3da8e2a3b7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3da8e2a3b7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xeef1a3ad66
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xeef1a3ad66

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0adb2c712c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0adb2c712c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x95d0425791
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x95d0425791

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xabd02ae672
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xabd02ae672

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd27daadb18
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd27daadb18

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3a1b15d3e9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3a1b15d3e9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x4f1d44cecf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x4f1d44cecf

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3769382585
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3769382585

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe76edb49a1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe76edb49a1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x084900ceae
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x084900ceae

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3c1e6592c7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3c1e6592c7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc271598a44
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc271598a44

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7230d63e96
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7230d63e96

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc4a3c1c4af
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc4a3c1c4af

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8ec186ecae
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8ec186ecae

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x62aea467de
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x62aea467de

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf45dcffd7b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf45dcffd7b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8f275d9176
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8f275d9176

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xcd9ad36e7b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xcd9ad36e7b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x398ccccec4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x398ccccec4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd9cd4aa514
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd9cd4aa514

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc2439fe4a9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc2439fe4a9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xde4a55832e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xde4a55832e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xcbcf410e53
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xcbcf410e53

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xeba720828b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xeba720828b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x48fe60e8c3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x48fe60e8c3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9dbe2fb0cb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9dbe2fb0cb

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1ce43cdff1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1ce43cdff1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x4ea2ee946a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x4ea2ee946a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x41a9a306c6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x41a9a306c6

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0f61ff8454
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0f61ff8454

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x01a837597f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x01a837597f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf75a2add38
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf75a2add38

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x847e1ae6ab
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x847e1ae6ab

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7ccbc2a514
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7ccbc2a514

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xaf12fae122
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xaf12fae122

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xefc7063d76
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xefc7063d76

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7edbfefd98
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7edbfefd98

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x22991f3ea4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x22991f3ea4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xac92f08f17
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xac92f08f17

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xcad33d8344
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xcad33d8344

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xce939ff481
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xce939ff481

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8e0bd068fd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8e0bd068fd

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa6d1b820ca
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa6d1b820ca

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xba589b3145
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xba589b3145

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd999cb23ab
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd999cb23ab

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd4c710e70e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd4c710e70e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xab5fe00b73
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xab5fe00b73

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xdaaeb8812d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xdaaeb8812d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x4743a70020
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x4743a70020

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x15a5d9d2c8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x15a5d9d2c8

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa147498b92
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa147498b92

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x95afa833cb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x95afa833cb

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2efaf944e3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2efaf944e3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x669ddd3b7c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x669ddd3b7c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x35242241d4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x35242241d4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd30917c83a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd30917c83a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd77f97ace3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd77f97ace3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0b42d8febb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0b42d8febb

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x263186ced8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x263186ced8

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2cc14d9d92
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2cc14d9d92

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x32c4d1e488
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x32c4d1e488

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb7c3eb8dc4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb7c3eb8dc4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd5f8859653
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd5f8859653

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5f8f8760e7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5f8f8760e7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7e83c2af5e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7e83c2af5e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc7a0f62e92
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc7a0f62e92

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8c8a468ba0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8c8a468ba0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x985ba938f0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x985ba938f0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2e6eb0b3d1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2e6eb0b3d1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6bd504688a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6bd504688a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7f4487f281
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7f4487f281

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x95cbc5d442
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x95cbc5d442

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd5c400b089
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd5c400b089

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe7079a5b5d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe7079a5b5d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6a0ff7fbf5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6a0ff7fbf5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x66b47b87f1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x66b47b87f1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe6ef80440d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe6ef80440d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xabe497888b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xabe497888b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa6ceca3d3e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa6ceca3d3e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7243cb52a1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7243cb52a1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x52e81d387f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x52e81d387f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xdf73789388
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xdf73789388

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2b0ce5744e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2b0ce5744e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe14030ec27
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe14030ec27

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf31f700508
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf31f700508

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x96c7c34c7d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x96c7c34c7d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x94a66745fa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x94a66745fa

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf4ba7905d7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf4ba7905d7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xcca60fabc9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xcca60fabc9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0db07bf881
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0db07bf881

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2af256b2ce
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2af256b2ce

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x58c44a45e2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x58c44a45e2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x151791f725
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x151791f725

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbd69819cf0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbd69819cf0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xafddedd560
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xafddedd560

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xda4f9f8be9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xda4f9f8be9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x333a8f7cb4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x333a8f7cb4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xaa29839ad1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xaa29839ad1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5186761583
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5186761583

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe9b1d24212
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe9b1d24212

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1b5a9b4542
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1b5a9b4542

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1bed8080d0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1bed8080d0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x37710c4029
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x37710c4029

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x42aa33208c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x42aa33208c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb74753799d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb74753799d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xddb95f4b07
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xddb95f4b07

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9a62636bfb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9a62636bfb

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x70f45453d7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x70f45453d7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3282910542
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3282910542

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe25d64cbd3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe25d64cbd3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x51bda17149
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x51bda17149

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7a63e670a3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7a63e670a3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7016a2aba6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7016a2aba6

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbf60b9fdd0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbf60b9fdd0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x18c206ec59
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x18c206ec59

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x603ccf1633
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x603ccf1633

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x04c24e5efa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x04c24e5efa

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf48d0c0130
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf48d0c0130

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x286ba255ad
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x286ba255ad

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x503a1c7d89
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x503a1c7d89

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xea16838acd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xea16838acd

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2fde55bf8f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2fde55bf8f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x30506f09f7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x30506f09f7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x64126cf936
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x64126cf936

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1fcf485f15
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1fcf485f15

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xed05c4fcda
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xed05c4fcda

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x48cf1e2c65
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x48cf1e2c65

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb9555b251b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb9555b251b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x84b8b97c47
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x84b8b97c47

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x02ed1e1a02
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x02ed1e1a02

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xac4cd33712
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xac4cd33712

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb935de699b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb935de699b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc0e7995729
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc0e7995729

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x93277d5f6d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x93277d5f6d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xaa317154f4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xaa317154f4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x563a341ee6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x563a341ee6

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x548912bc60
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x548912bc60

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa5b8d9c7fc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa5b8d9c7fc

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x34a6bc7a36
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x34a6bc7a36

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0faa384101
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0faa384101

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9b80fc30bf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9b80fc30bf

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6215a35562
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6215a35562

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2a5fd2dc6b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2a5fd2dc6b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa9d7540972
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa9d7540972

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xad992e9178
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xad992e9178

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe85a2b8107
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe85a2b8107

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6567425c55
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6567425c55

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xfa9968461c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xfa9968461c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc119ee70aa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc119ee70aa

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0e37aadce8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0e37aadce8

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x02cf7f9bb2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x02cf7f9bb2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2a6dbc1c0e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2a6dbc1c0e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6660ffd2d1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6660ffd2d1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x14c5340d7b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x14c5340d7b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd1d04f5abb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd1d04f5abb

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3e6258bf0d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3e6258bf0d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xfd9bf99644
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xfd9bf99644

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xff9d35eb8b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xff9d35eb8b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe7ed976458
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe7ed976458

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1856c0a7f0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1856c0a7f0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x00356eb1fa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x00356eb1fa

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xdf33c2908e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xdf33c2908e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xad84854931
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xad84854931

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x83bba4429a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x83bba4429a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x48696687bf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x48696687bf

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc6dec4f319
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc6dec4f319

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7e674a96f8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7e674a96f8

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2ab3256d75
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2ab3256d75

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf9bb2d8685
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf9bb2d8685

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x598a9c2006
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x598a9c2006

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf80fcdd5ad
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf80fcdd5ad

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbb0bc537df
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbb0bc537df

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xed477c52dd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xed477c52dd

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbd4606dddc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbd4606dddc

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x88f12f58d7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x88f12f58d7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6ef6914669
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6ef6914669

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc39779dc31
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc39779dc31

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5eed5aa081
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5eed5aa081

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb4f187ddf8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb4f187ddf8

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x78a73139b1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x78a73139b1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc8a92b99dc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc8a92b99dc

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xcd3ed880d0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xcd3ed880d0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe4130ef28e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe4130ef28e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0633c048e0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0633c048e0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x22ac0d4392
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x22ac0d4392

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc4a4b97a24
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc4a4b97a24

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x221a7c1952
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x221a7c1952

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb1adebbc23
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb1adebbc23

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2eb5a1925e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2eb5a1925e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa4813c9354
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa4813c9354

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf7a1ec049c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf7a1ec049c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xff8b6b8582
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xff8b6b8582

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7aa24979e0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7aa24979e0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x343da3c023
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x343da3c023

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbb3ae91377
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbb3ae91377

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x32b80815c9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x32b80815c9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbe3063946d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbe3063946d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xed1fec2c9a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xed1fec2c9a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x04c77ba67f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x04c77ba67f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe940387c23
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe940387c23

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf5eaa4a524
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf5eaa4a524

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb11f261775
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb11f261775

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3b92d80b43
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3b92d80b43

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7dcf935e26
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7dcf935e26

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1ae43fcc7c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1ae43fcc7c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x82832bd8d1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x82832bd8d1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x69c0e04499
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x69c0e04499

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa4863a1910
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa4863a1910

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x86ed002201
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x86ed002201

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb29c33c98b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb29c33c98b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x596452df0b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x596452df0b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd428a2ad67
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd428a2ad67

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1661c5cb22
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1661c5cb22

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf27f4c437e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf27f4c437e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x1bbe0339d9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x1bbe0339d9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x28f52f483c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x28f52f483c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3d2cd9b096
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3d2cd9b096

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xfb82f0bd48
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xfb82f0bd48

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6600985347
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6600985347

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x36193f264f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x36193f264f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xec49e2aad2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xec49e2aad2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x38178f0c59
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x38178f0c59

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xffafe88aa2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xffafe88aa2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6108aaa9ab
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6108aaa9ab

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x32748130bc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x32748130bc

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa6432a1052
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa6432a1052

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd79bf4bf85
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd79bf4bf85

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x73d0920b6f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x73d0920b6f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xaa87448670
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xaa87448670

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x98804cf4ec
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x98804cf4ec

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xe1069e1e01
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xe1069e1e01

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0467b06904
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0467b06904

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x50c5e7fcca
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x50c5e7fcca

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xdbd2f64fa4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xdbd2f64fa4

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2bead1471d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2bead1471d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc198d27930
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc198d27930

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0d55dcaa09
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0d55dcaa09

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc68ed69f96
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc68ed69f96

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x804a73d0d7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x804a73d0d7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x045bcac41d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x045bcac41d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xa92d986be2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xa92d986be2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0c2813222e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0c2813222e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x580106e8b1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x580106e8b1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7a7db247e3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7a7db247e3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6e2e329b25
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6e2e329b25

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x226361e866
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x226361e866

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x857a427bf3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x857a427bf3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x272f2770a1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x272f2770a1

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7526ce0398
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7526ce0398

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0ae5490997
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0ae5490997

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf850710701
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf850710701

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xdb3dc0c474
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xdb3dc0c474

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9298d37c39
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9298d37c39

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x80a392f07f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x80a392f07f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x8817e73151
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x8817e73151

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2378e8eecf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2378e8eecf

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x21c5a37b0b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x21c5a37b0b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xc7bc828806
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xc7bc828806

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3d3fd6c67b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3d3fd6c67b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbf25322e11
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbf25322e11

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x94cf88e804
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x94cf88e804

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x33c6944035
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x33c6944035

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0ee47ed840
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0ee47ed840

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x584e9f7f94
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x584e9f7f94

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x89aa6b300b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x89aa6b300b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x76a6c5ade5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x76a6c5ade5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd776775c3f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd776775c3f

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x5ca50a4bc2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x5ca50a4bc2

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x327281561c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x327281561c

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9867709a9b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9867709a9b

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6c56007c08
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6c56007c08

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x72bb4ae769
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x72bb4ae769

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x754eb4ffb6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x754eb4ffb6

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xde701b3fe3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xde701b3fe3

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb43ebb335e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb43ebb335e

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x0bf1e27239
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x0bf1e27239

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xb22c3ff5d7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xb22c3ff5d7

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x6b695de5a9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x6b695de5a9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9ce91322eb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9ce91322eb

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xf122785f29
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xf122785f29

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x9bb45be764
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x9bb45be764

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2813751988
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2813751988

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x694199f36d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x694199f36d

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xd38d17ce4a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xd38d17ce4a

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x7a225618f0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x7a225618f0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x159d3a0377
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x159d3a0377

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x2a99c47c03
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x2a99c47c03

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x4bd7853275
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x4bd7853275

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xbbf9a929b9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xbbf9a929b9

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x3c07521db0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x3c07521db0

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.x95aa57b0e5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.x95aa57b0e5

namespace JapanTaxLaw.BulkStructLbl2b42f07b25.xebfa5013e8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl2b42f07b25.xebfa5013e8
