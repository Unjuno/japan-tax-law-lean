import JapanTaxLaw.BulkStructLblbbc9c0de6c

/-! Independent branch-form spec per label namespace. -/
namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xbaf13fae1a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xbaf13fae1a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa46acbc7fa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa46acbc7fa

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x20b04620fe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x20b04620fe

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa48a4e4e05
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa48a4e4e05

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x2839346a26
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x2839346a26

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x680532a655
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x680532a655

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb637096e32
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb637096e32

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6203fad99d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6203fad99d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc540ffd6ff
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc540ffd6ff

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x337462c3fe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x337462c3fe

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x53f966079c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x53f966079c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xab2726fd24
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xab2726fd24

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x32dffe2e5c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x32dffe2e5c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1b882d002
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1b882d002

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf0de41ce67
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf0de41ce67

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x056b928115
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x056b928115

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9ee2e33a51
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9ee2e33a51

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x533257d84f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x533257d84f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0b3ed106ed
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0b3ed106ed

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x98d52c0f17
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x98d52c0f17

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x31af2e00e0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x31af2e00e0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xff09623fe9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xff09623fe9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5414e9ac1c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5414e9ac1c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4dbb54e084
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4dbb54e084

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xec07676ce7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xec07676ce7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf39154fb83
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf39154fb83

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8bef806c9e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8bef806c9e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4bd220162e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4bd220162e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9f79129409
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9f79129409

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x640ba6a0f9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x640ba6a0f9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6a13a85d78
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6a13a85d78

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf0d1e0ef4d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf0d1e0ef4d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc026a7ddec
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc026a7ddec

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf125ef1188
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf125ef1188

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5a303c791a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5a303c791a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9f739c08ab
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9f739c08ab

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9da8c018e8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9da8c018e8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x11b722bd09
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x11b722bd09

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9d5edfa5e9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9d5edfa5e9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7a63f7e8ea
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7a63f7e8ea

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc8fc1cc37c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc8fc1cc37c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8efc56bfbf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8efc56bfbf

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x818d64c19f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x818d64c19f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x707af46032
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x707af46032

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4534473f5a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4534473f5a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xcc2c16ea76
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xcc2c16ea76

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5b60740e0b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5b60740e0b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8a31969320
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8a31969320

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb9d47fd6fd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb9d47fd6fd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6d38dcae97
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6d38dcae97

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc3fcbe3120
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc3fcbe3120

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1666d7613
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1666d7613

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfa339f0611
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfa339f0611

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3376e8738f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3376e8738f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x024aad6df4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x024aad6df4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf45274e1ad
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf45274e1ad

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4db06b8bae
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4db06b8bae

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd8b1f99290
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd8b1f99290

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xaf9355030f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xaf9355030f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8d791e254c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8d791e254c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5a3d0ff17f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5a3d0ff17f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x00392d10e3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x00392d10e3

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x541e0c6f69
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x541e0c6f69

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x272489b7e4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x272489b7e4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x27730b05df
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x27730b05df

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7a5fb9a3a7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7a5fb9a3a7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x45a3eeecfb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x45a3eeecfb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3a61a02cc5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3a61a02cc5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf969d5f235
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf969d5f235

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdd76ad6431
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdd76ad6431

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x63c783102b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x63c783102b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9fcd69c3c0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9fcd69c3c0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf6afb44e76
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf6afb44e76

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd7406b3da0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd7406b3da0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x32d7c12996
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x32d7c12996

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa29f34bfba
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa29f34bfba

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc8ce2787ba
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc8ce2787ba

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf6dbe4b446
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf6dbe4b446

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe8756ab04d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe8756ab04d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6471f546c4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6471f546c4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x65dbe002a4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x65dbe002a4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3de3e7996a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3de3e7996a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x90c41c3059
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x90c41c3059

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x008d0daada
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x008d0daada

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1b2d849c44
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1b2d849c44

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x03a0e8dfba
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x03a0e8dfba

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa4b6a5a136
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa4b6a5a136

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1325cc5681
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1325cc5681

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7783c9c609
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7783c9c609

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x76ae4893ee
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x76ae4893ee

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x14bc90d2bc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x14bc90d2bc

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb9954489fd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb9954489fd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd466624ca2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd466624ca2

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0009dfd28f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0009dfd28f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe211ea9b54
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe211ea9b54

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0ab976a61d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0ab976a61d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x718cd16695
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x718cd16695

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa1ce2ef5cc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa1ce2ef5cc

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x92ca3ee1c3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x92ca3ee1c3

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa581275027
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa581275027

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc452a95c8d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc452a95c8d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf91b8fe49e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf91b8fe49e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe89db534f6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe89db534f6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x712533203c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x712533203c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1fd421cbc4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1fd421cbc4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4e35b0837b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4e35b0837b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x2c10425cf3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x2c10425cf3

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xbc2124a2a8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xbc2124a2a8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8a281165bc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8a281165bc

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa15a4f66ec
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa15a4f66ec

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa66ebc439b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa66ebc439b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x070215fead
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x070215fead

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x321d8c13b5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x321d8c13b5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xbca700c274
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xbca700c274

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x47efd23444
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x47efd23444

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3ce42eb589
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3ce42eb589

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8aedfa5aae
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8aedfa5aae

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9d4c8e5322
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9d4c8e5322

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe597a303f1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe597a303f1

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7473a86cd7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7473a86cd7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc16ab93f2f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc16ab93f2f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd3a571c0f9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd3a571c0f9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa1c3a65cb8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa1c3a65cb8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x81d71e365b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x81d71e365b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe8ca9fac7e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe8ca9fac7e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x62ba4f26a0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x62ba4f26a0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7cdb2f14cf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7cdb2f14cf

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd5df077f4f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd5df077f4f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x40b1400289
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x40b1400289

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x2ca003a7e0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x2ca003a7e0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdb00179737
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdb00179737

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4521ccf416
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4521ccf416

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa2c2624cf7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa2c2624cf7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc8885a1757
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc8885a1757

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xde7dd0c22b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xde7dd0c22b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9be2b69545
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9be2b69545

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x11b5ad5885
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x11b5ad5885

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xad694405dd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xad694405dd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xae6dbc8e82
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xae6dbc8e82

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf317041487
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf317041487

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x25f575cbcd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x25f575cbcd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x552e38a8f6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x552e38a8f6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1a0ea73bf5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1a0ea73bf5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x62b4972180
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x62b4972180

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x22f8740fbb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x22f8740fbb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd4e462185e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd4e462185e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe56333e42d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe56333e42d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x853ba352fe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x853ba352fe

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x375178a212
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x375178a212

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa712f5100c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa712f5100c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfb20da90fd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfb20da90fd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1b6b22e89
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1b6b22e89

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x530d66391b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x530d66391b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8276d4063e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8276d4063e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb295971e53
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb295971e53

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x109002e7bb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x109002e7bb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfc4a04951b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfc4a04951b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5d704126a7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5d704126a7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd3be1e18db
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd3be1e18db

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa6381416cb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa6381416cb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf6356d0065
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf6356d0065

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9ec5329b46
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9ec5329b46

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfa55b606fb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfa55b606fb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x43578647cf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x43578647cf

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa36f963937
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa36f963937

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd878a93d05
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd878a93d05

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xbd98f3ce39
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xbd98f3ce39

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x78b7b8fafe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x78b7b8fafe

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa01526a257
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa01526a257

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9b09dd992f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9b09dd992f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xbca296ac2f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xbca296ac2f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xcbfc4b0641
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xcbfc4b0641

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc188156e9d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc188156e9d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7960bd1b46
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7960bd1b46

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8390193ece
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8390193ece

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6ad311cd76
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6ad311cd76

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6aef7b0895
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6aef7b0895

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5d8c81a746
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5d8c81a746

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x31679dcba6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x31679dcba6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xef27defe47
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xef27defe47

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6b8244dfd6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6b8244dfd6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa9d0cbab39
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa9d0cbab39

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x12c3e74ee5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x12c3e74ee5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1fe61583d0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1fe61583d0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1c80ebf0e5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1c80ebf0e5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3e477f3e45
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3e477f3e45

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0161ffd41f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0161ffd41f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe2729cebd4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe2729cebd4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3bbe316c27
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3bbe316c27

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4ddb98760b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4ddb98760b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x39480d753e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x39480d753e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xcf0c3078a3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xcf0c3078a3

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6021ae6b27
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6021ae6b27

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x53d624fca8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x53d624fca8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1e15f09818
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1e15f09818

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x719554b15d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x719554b15d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfbeb5f4edf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfbeb5f4edf

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x771d90eb64
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x771d90eb64

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3195db55b5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3195db55b5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x10ed249d45
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x10ed249d45

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x68c45601fb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x68c45601fb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4ffd815460
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4ffd815460

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1171105950
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1171105950

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdd1bf03eb0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdd1bf03eb0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x46ac0077e1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x46ac0077e1

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x57d9e1f8a0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x57d9e1f8a0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x27b450d912
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x27b450d912

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x73eacd9177
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x73eacd9177

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe916df11fe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe916df11fe

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x15c1786c60
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x15c1786c60

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x18a281a30a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x18a281a30a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9cb7561651
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9cb7561651

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x39d2059e76
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x39d2059e76

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd4cb9220b4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd4cb9220b4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x539515d5db
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x539515d5db

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xda7ad83a83
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xda7ad83a83

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xbca865a2cb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xbca865a2cb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf1373a5b8a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf1373a5b8a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4b674faef0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4b674faef0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xaddbe106c0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xaddbe106c0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0f9d54cd6a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0f9d54cd6a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xde9f5065c5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xde9f5065c5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x909d2bd6ff
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x909d2bd6ff

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x534790fe7d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x534790fe7d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xaee163bc06
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xaee163bc06

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x11ec42b33a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x11ec42b33a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb8eec6a356
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb8eec6a356

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5badcc3be4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5badcc3be4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe4de6cb823
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe4de6cb823

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x98a9277ec8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x98a9277ec8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x65ff4cd2b9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x65ff4cd2b9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0b1f28af17
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0b1f28af17

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x01a038a8c4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x01a038a8c4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0c325158ec
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0c325158ec

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7d4aef62f4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7d4aef62f4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfc9300a0bd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfc9300a0bd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x2ec444f88d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x2ec444f88d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa6c3d9283c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa6c3d9283c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7a235cdc3a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7a235cdc3a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x153263937b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x153263937b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5ea96da300
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5ea96da300

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x23819d63a6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x23819d63a6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe866461520
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe866461520

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb96689e182
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb96689e182

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x63236e88ad
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x63236e88ad

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3a57cac933
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3a57cac933

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1b68cd3f9f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1b68cd3f9f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7b214c9cff
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7b214c9cff

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xbca8a4dbcd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xbca8a4dbcd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6391ff4377
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6391ff4377

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa51481599b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa51481599b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x14b006397f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x14b006397f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x86cfed36a5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x86cfed36a5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x267df9b610
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x267df9b610

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x42f42fc5ab
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x42f42fc5ab

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x07a8708c3c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x07a8708c3c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xad5e673e0d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xad5e673e0d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1412c0d23
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1412c0d23

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6bfa902f6a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6bfa902f6a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x22de7a8ac7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x22de7a8ac7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd3561d5c9e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd3561d5c9e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x79fc3e9723
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x79fc3e9723

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa46203f56a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa46203f56a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x24bfe8e434
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x24bfe8e434

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x219e0182b4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x219e0182b4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdcc2d5134d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdcc2d5134d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x85415abba2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x85415abba2

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb27cc1fcfa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb27cc1fcfa

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x670a176c29
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x670a176c29

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe152b580a5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe152b580a5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x308c048554
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x308c048554

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9722f9a9d7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9722f9a9d7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5c38353eaa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5c38353eaa

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x871904a4f0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x871904a4f0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4cb1b70000
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4cb1b70000

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe87ef785ba
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe87ef785ba

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x19e69b8df8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x19e69b8df8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x839c973f22
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x839c973f22

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x863219f4bc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x863219f4bc

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfc749f890c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfc749f890c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0a06532536
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0a06532536

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6fae270c1c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6fae270c1c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4b0eb472f6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4b0eb472f6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x783b15e8d2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x783b15e8d2

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x850508ea7f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x850508ea7f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd81bc33e51
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd81bc33e51

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x17105219fa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x17105219fa

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb021c60aa8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb021c60aa8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf35eb36fb5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf35eb36fb5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x68bc731b77
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x68bc731b77

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xaff5e87a63
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xaff5e87a63

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4ad2517602
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4ad2517602

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x506eaa431c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x506eaa431c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6bae485ea9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6bae485ea9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd230fed250
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd230fed250

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb41e429320
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb41e429320

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x186ef279fb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x186ef279fb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc75c71eee5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc75c71eee5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe992ea7872
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe992ea7872

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6d73ce8c42
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6d73ce8c42

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb85f08bfbb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb85f08bfbb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x72cb02d5e6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x72cb02d5e6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdef5be0061
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdef5be0061

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6a7b401133
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6a7b401133

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9fd43f5502
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9fd43f5502

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x10511c70b4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x10511c70b4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x81ec012999
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x81ec012999

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x98b9a8b768
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x98b9a8b768

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3a887f7671
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3a887f7671

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8ccd880a80
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8ccd880a80

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x40b3c6e4c9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x40b3c6e4c9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x95ad5cdf2d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x95ad5cdf2d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x163a1dbc10
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x163a1dbc10

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e64409fec
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e64409fec

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd390caeb41
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd390caeb41

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd871620a96
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd871620a96

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7266d932e7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7266d932e7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8dd665ac72
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8dd665ac72

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0bf888435c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0bf888435c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x85c1388b2c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x85c1388b2c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x746fe255a6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x746fe255a6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6c43b93cb5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6c43b93cb5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x134db4efee
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x134db4efee

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x31560edd6d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x31560edd6d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xcb279d657e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xcb279d657e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xba24214c25
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xba24214c25

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e87c33286
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e87c33286

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb94323a6a3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb94323a6a3

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x703f92cd58
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x703f92cd58

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb5124b1a1f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb5124b1a1f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdd54b4ab7b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdd54b4ab7b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x388a3c0bc6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x388a3c0bc6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd66ad7d77a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd66ad7d77a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1bb6a5038e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1bb6a5038e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x52efa3564c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x52efa3564c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x797407df05
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x797407df05

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd0046855a5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd0046855a5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe1d982f3a1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe1d982f3a1

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf1b8520512
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf1b8520512

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x2e464e152a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x2e464e152a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xed742c950e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xed742c950e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x58f03b5d09
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x58f03b5d09

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x40903b6313
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x40903b6313

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x08a0895774
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x08a0895774

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x75152e05c8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x75152e05c8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9f756269ea
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9f756269ea

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdcd6dcb00c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdcd6dcb00c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb2c8db91d9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb2c8db91d9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd12e619b17
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd12e619b17

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x679d8edd13
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x679d8edd13

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x03bb98abbb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x03bb98abbb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x890600f9de
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x890600f9de

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xed4bcb06e6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xed4bcb06e6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xac9ecaa3eb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xac9ecaa3eb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xeb006fb637
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xeb006fb637

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3ddbbfb41e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3ddbbfb41e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1895b1380
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb1895b1380

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6ed00646cd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6ed00646cd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x26dedaa98a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x26dedaa98a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x249ec907ee
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x249ec907ee

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1e859a9fd5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1e859a9fd5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7e9c142da8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7e9c142da8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfd920d4c75
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfd920d4c75

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa538d5cc91
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa538d5cc91

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb54bec158f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb54bec158f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x25b64e4711
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x25b64e4711

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1b2b22a66c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1b2b22a66c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0cc1e0e5bf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0cc1e0e5bf

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc56593d936
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc56593d936

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe2c21938f2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe2c21938f2

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x2f3acdff1c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x2f3acdff1c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd1d3874c51
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd1d3874c51

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xadb492d44c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xadb492d44c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe455d06677
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe455d06677

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe1406c179c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe1406c179c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x79ed0958fc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x79ed0958fc

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd0a5ad0fbd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd0a5ad0fbd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e33b72f2a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e33b72f2a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x094b859775
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x094b859775

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfaf06897cd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfaf06897cd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x33a65cfb3b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x33a65cfb3b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfb2163fedb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfb2163fedb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc0f755c821
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc0f755c821

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xda703b76de
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xda703b76de

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x55992b1ff7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x55992b1ff7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfc95202c94
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfc95202c94

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x788cddd964
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x788cddd964

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3991de14f2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3991de14f2

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf146b741e4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf146b741e4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9bd43235bc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9bd43235bc

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x719a2737a1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x719a2737a1

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8ce8b13aa5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8ce8b13aa5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x870a2c3f63
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x870a2c3f63

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e73b5718d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e73b5718d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9c8e0a48a0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9c8e0a48a0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5586f98414
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5586f98414

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x01ce9d4964
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x01ce9d4964

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa828e5d149
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa828e5d149

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e241ab1e7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e241ab1e7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd6a17b0e50
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd6a17b0e50

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x34e96b9932
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x34e96b9932

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0f278eee2b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0f278eee2b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd00c4c4567
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd00c4c4567

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xad0643e2ac
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xad0643e2ac

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x87357eda4e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x87357eda4e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x13d60852a1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x13d60852a1

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd85cecde66
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd85cecde66

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb58f7ec6b7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb58f7ec6b7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5ed947b64b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5ed947b64b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4716212753
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4716212753

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xead5d01ad9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xead5d01ad9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9cb2f94c8e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9cb2f94c8e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x919ec4c7f6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x919ec4c7f6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf4da871c34
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf4da871c34

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdfa2eb21cb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdfa2eb21cb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x859b02e200
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x859b02e200

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb8149561b0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb8149561b0

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7cfdd4a79e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7cfdd4a79e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x79c7a1b95f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x79c7a1b95f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x6f136e50b9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x6f136e50b9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x7237f5c07e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x7237f5c07e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdb263cce2b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdb263cce2b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa426018054
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa426018054

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x2bf5b9e46f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x2bf5b9e46f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x741077e6fb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x741077e6fb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x98df2bb0bd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x98df2bb0bd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf2fdfd9345
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf2fdfd9345

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x936661e287
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x936661e287

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe80b1c3502
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe80b1c3502

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc4d3c332c4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc4d3c332c4

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xbc18a876fc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xbc18a876fc

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xef384af65a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xef384af65a

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xed9c1c20a6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xed9c1c20a6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x8558059c48
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x8558059c48

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xffe17ccd30
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xffe17ccd30

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x156103a317
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x156103a317

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x2460f1034e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x2460f1034e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1902dd2d88
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1902dd2d88

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5baab4afcd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5baab4afcd

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa09a88025e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa09a88025e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfd287eec43
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfd287eec43

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd72aca7bbf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd72aca7bbf

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xbf22f3bf10
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xbf22f3bf10

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x56b67b9ec1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x56b67b9ec1

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x78921283d6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x78921283d6

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x33e3abf3fa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x33e3abf3fa

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9c8f964e8e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9c8f964e8e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1790c5b59c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1790c5b59c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0218589cb5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0218589cb5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdfc122a174
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdfc122a174

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc2f918c020
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc2f918c020

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x39fe63f9b8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x39fe63f9b8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe0014a57d7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe0014a57d7

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5167b0afe5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5167b0afe5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xad042e2226
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xad042e2226

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xcf545e11af
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xcf545e11af

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa79ee464b5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa79ee464b5

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e3a1c888d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0e3a1c888d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5d6c8978fe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5d6c8978fe

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa07e3db144
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa07e3db144

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa34c0f0d6f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa34c0f0d6f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xc64e7c9545
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xc64e7c9545

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xf360f40efb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xf360f40efb

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xdb0de1b33b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xdb0de1b33b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3662333243
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3662333243

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x9a96a61aee
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x9a96a61aee

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x63c6ca1ffe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x63c6ca1ffe

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0d520ab817
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0d520ab817

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x4813d2f84f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x4813d2f84f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1926576435
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1926576435

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x48adf58424
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x48adf58424

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xeaad6ff76c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xeaad6ff76c

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x27beedb9f8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x27beedb9f8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x84b2735b3b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x84b2735b3b

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x5bf01beed9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x5bf01beed9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x33339a5f19
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x33339a5f19

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb285a85e2d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb285a85e2d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa7c233d178
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa7c233d178

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x67a95013b8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x67a95013b8

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x3351d2e202
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x3351d2e202

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1544f8e138
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1544f8e138

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xddc4460872
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xddc4460872

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xec3cc06104
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xec3cc06104

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe4bcbfb989
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe4bcbfb989

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa3536fc79f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa3536fc79f

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xfb26c22995
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xfb26c22995

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xb94216d928
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xb94216d928

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xe768d691ec
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xe768d691ec

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd8898eab85
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd8898eab85

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1ed67abfae
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1ed67abfae

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x38b6162f51
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x38b6162f51

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x52f55d620e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x52f55d620e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xa64772c87d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xa64772c87d

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x0638807ae9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x0638807ae9

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x80abcc61ca
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x80abcc61ca

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1be5c3cfab
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1be5c3cfab

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x95f928a145
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x95f928a145

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.x1d7179d106
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.x1d7179d106

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xef49846b1e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xef49846b1e

namespace JapanTaxLaw.BulkStructLblbbc9c0de6c.xd86a88fc6b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLblbbc9c0de6c.xd86a88fc6b
