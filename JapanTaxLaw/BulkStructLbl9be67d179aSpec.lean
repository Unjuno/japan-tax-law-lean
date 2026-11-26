import JapanTaxLaw.BulkStructLbl9be67d179a

/-! Independent branch-form spec per label namespace. -/
namespace JapanTaxLaw.BulkStructLbl9be67d179a.x609881fa33
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x609881fa33

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xed71a9620e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xed71a9620e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1c0f0f0026
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1c0f0f0026

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x01f0740676
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x01f0740676

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x77c51a9f06
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x77c51a9f06

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6c765f101a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6c765f101a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x492ccf2a8d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x492ccf2a8d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf7f8ab9ebc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf7f8ab9ebc

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xfcbd1d4cf7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xfcbd1d4cf7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xcbc9dc37e4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xcbc9dc37e4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3f6d1d76bc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3f6d1d76bc

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x16cd892daf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x16cd892daf

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1938f55d76
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1938f55d76

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x276195594a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x276195594a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6e540e6962
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6e540e6962

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xcf8bbe39a1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xcf8bbe39a1

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb9ddcd2fcb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb9ddcd2fcb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1d360eb962
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1d360eb962

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb52f7448a9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb52f7448a9

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc54471f9c6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc54471f9c6

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xec1f53762a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xec1f53762a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2f13b49f3c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2f13b49f3c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5524c60f5e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5524c60f5e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x668f3d8d6c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x668f3d8d6c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x75c8598797
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x75c8598797

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb063086560
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb063086560

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x78937969b3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x78937969b3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2466de80d2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2466de80d2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x157fcf710c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x157fcf710c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbe5327227d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbe5327227d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb54377912c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb54377912c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x92c12df8f3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x92c12df8f3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5bb99e0a88
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5bb99e0a88

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x01a9009629
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x01a9009629

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdf36a685ae
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdf36a685ae

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5e5b334358
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5e5b334358

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xda2dfb94a7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xda2dfb94a7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0b319ac0e5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0b319ac0e5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xedcfe9003c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xedcfe9003c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x32f0741a24
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x32f0741a24

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa8c79811f8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa8c79811f8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe156e732dc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe156e732dc

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1cc82c1461
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1cc82c1461

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0239975b6c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0239975b6c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdaedd84649
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdaedd84649

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xda88f44acb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xda88f44acb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x64bdde5dd6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x64bdde5dd6

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf4d5bfda5f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf4d5bfda5f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf2eedb4c75
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf2eedb4c75

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x575d72ed71
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x575d72ed71

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa932104a8a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa932104a8a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x255e932a2d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x255e932a2d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa38b028783
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa38b028783

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6c3a545136
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6c3a545136

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa49ebac42c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa49ebac42c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x263a9c4c01
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x263a9c4c01

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc38d6196be
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc38d6196be

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3d5aca7eb2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3d5aca7eb2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb640850187
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb640850187

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2565d8f646
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2565d8f646

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0e05f88f34
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0e05f88f34

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xec5bc6a394
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xec5bc6a394

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb63e2b8e83
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb63e2b8e83

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7fd08f4827
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7fd08f4827

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe52ef4fc5a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe52ef4fc5a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x12b1a63523
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x12b1a63523

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8179958b7c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8179958b7c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc9ea2bcb88
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc9ea2bcb88

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9a60b2ccf5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9a60b2ccf5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1b2cf78f48
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1b2cf78f48

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x62bff2ea80
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x62bff2ea80

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x250729b6a8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x250729b6a8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xfb846a3cb2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xfb846a3cb2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x42e151c3a0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x42e151c3a0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3eacd787aa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3eacd787aa

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdf1eea19d1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdf1eea19d1

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x29fc70f4a2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x29fc70f4a2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdb29ad78d6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdb29ad78d6

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x419bb5bc09
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x419bb5bc09

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc7eb41de8c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc7eb41de8c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0e99bcb37b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0e99bcb37b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbe500b0142
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbe500b0142

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe80c31d08d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe80c31d08d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x123f8e854c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x123f8e854c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xef97b03e9b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xef97b03e9b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x23430d7f36
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x23430d7f36

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x201263c40b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x201263c40b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x888ea78a99
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x888ea78a99

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf291fa90fd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf291fa90fd

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x41e097b47e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x41e097b47e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9debe10d69
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9debe10d69

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd7ae32705e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd7ae32705e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc76d610de9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc76d610de9

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb4c72a6c6c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb4c72a6c6c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xea3246a090
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xea3246a090

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd2d65419f8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd2d65419f8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x407e4c4efb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x407e4c4efb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa913b8f995
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa913b8f995

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5f67cf240b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5f67cf240b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x055e976bab
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x055e976bab

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x07b14d2181
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x07b14d2181

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x408cc8d53a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x408cc8d53a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x532b68febb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x532b68febb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa025f7d756
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa025f7d756

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3dd8916cc4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3dd8916cc4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc51860a83a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc51860a83a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0e6e8761d9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0e6e8761d9

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1cb1dd908c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1cb1dd908c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4113e899c2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4113e899c2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x043a9ea542
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x043a9ea542

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4699dc61b5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4699dc61b5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2c1cf3774c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2c1cf3774c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb0d0f40891
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb0d0f40891

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9cc69e46ea
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9cc69e46ea

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2d9ec436bf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2d9ec436bf

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf082a74c1a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf082a74c1a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xde54fe118b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xde54fe118b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0b4b98261e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0b4b98261e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x26b5c34a76
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x26b5c34a76

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdc3a722598
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdc3a722598

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x939f9157c4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x939f9157c4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3dfe7b1564
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3dfe7b1564

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9a29e3cdc2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9a29e3cdc2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4bf072a6c2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4bf072a6c2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x398a8a6985
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x398a8a6985

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x35eaf92475
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x35eaf92475

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb7260767e0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb7260767e0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa565162e7f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa565162e7f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xeb464f7358
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xeb464f7358

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc7276d1870
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc7276d1870

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6c033effc6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6c033effc6

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x564d28dd4e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x564d28dd4e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xfce4da064c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xfce4da064c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6ab09cafd7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6ab09cafd7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x30e8f6bfb8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x30e8f6bfb8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x57c4df32dd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x57c4df32dd

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd9cece2014
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd9cece2014

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x611457d74c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x611457d74c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x412161299c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x412161299c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8e9c390877
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8e9c390877

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd7c9e90529
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd7c9e90529

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xcb098ccc49
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xcb098ccc49

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa4e46f5b87
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa4e46f5b87

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2871621c65
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2871621c65

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7710adfc6a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7710adfc6a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb74e75a6d2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb74e75a6d2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x95235a5f4c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x95235a5f4c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x354e7a6773
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x354e7a6773

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3aed87fde4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3aed87fde4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa5a0c1f234
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa5a0c1f234

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xcb92b9a66e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xcb92b9a66e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd6382b0dc6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd6382b0dc6

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc897d4d841
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc897d4d841

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xae3c95ad01
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xae3c95ad01

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x304a2e5ded
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x304a2e5ded

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x60b339d687
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x60b339d687

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7a59be3bf7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7a59be3bf7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe0c416ef68
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe0c416ef68

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3838321176
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3838321176

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe3535060c0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe3535060c0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x25200a425c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x25200a425c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd5849ccf8e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd5849ccf8e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x21166321cf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x21166321cf

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbaa8121270
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbaa8121270

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2621d4a9ee
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2621d4a9ee

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc69df18d26
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc69df18d26

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3d998bfae9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3d998bfae9

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8d7a055e21
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8d7a055e21

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xfb64b95c34
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xfb64b95c34

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe40e482e98
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe40e482e98

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x358405c1e8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x358405c1e8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9d5d8f727f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9d5d8f727f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4c293732dc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4c293732dc

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x35d81101df
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x35d81101df

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8bcebe3bb0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8bcebe3bb0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf23cc926a7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf23cc926a7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x82872c06d8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x82872c06d8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2f91cb6102
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2f91cb6102

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x195f0af0c5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x195f0af0c5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf7fd5864c7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf7fd5864c7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x91ef7b5f69
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x91ef7b5f69

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa1e040d59e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa1e040d59e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe6e2d05068
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe6e2d05068

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd753bb86ac
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd753bb86ac

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe062017a40
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe062017a40

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x92d7aca3f4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x92d7aca3f4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xad3d71fdcb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xad3d71fdcb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4bd1f150af
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4bd1f150af

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x053dcdb24d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x053dcdb24d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xcb8a970df9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xcb8a970df9

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3a12362949
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3a12362949

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9edbc5c923
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9edbc5c923

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa9d5efe405
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa9d5efe405

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa101940e6d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa101940e6d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe61a930c27
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe61a930c27

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x49fbaa0309
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x49fbaa0309

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa366411d5d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa366411d5d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa88b250d2d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa88b250d2d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8579ef9d3a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8579ef9d3a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x76545c5c4f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x76545c5c4f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd49e370dc7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd49e370dc7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7d036bd5b3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7d036bd5b3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xaef45af775
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xaef45af775

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa1025baf34
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa1025baf34

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2360cc63bb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2360cc63bb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xee2e41f03b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xee2e41f03b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc40d5ac8cd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc40d5ac8cd

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd2dcd2aebb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd2dcd2aebb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x312250cc66
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x312250cc66

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7242892322
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7242892322

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe3789953ad
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe3789953ad

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x079fcb7793
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x079fcb7793

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x371c3c0b42
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x371c3c0b42

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe9e10bc17f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe9e10bc17f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5a9a4dbb83
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5a9a4dbb83

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x75c3e86e03
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x75c3e86e03

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf5646e9c16
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf5646e9c16

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x15e6dddf94
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x15e6dddf94

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x84bb3973ec
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x84bb3973ec

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe07a0cb9d1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe07a0cb9d1

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x44c563b0d8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x44c563b0d8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x63e16fa4df
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x63e16fa4df

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd8f329f4a1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd8f329f4a1

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xae9eb8e506
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xae9eb8e506

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6ba421eeb7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6ba421eeb7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9465ae23ec
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9465ae23ec

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf37f8ec94d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf37f8ec94d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x914c400cfb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x914c400cfb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd86f920c10
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd86f920c10

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x302a59eab8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x302a59eab8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9d2ac29e9c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9d2ac29e9c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x82fb1200c6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x82fb1200c6

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x78418bd670
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x78418bd670

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x43d2c77746
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x43d2c77746

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x299b363691
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x299b363691

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x076270c2a7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x076270c2a7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf3cd66d24e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf3cd66d24e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x29799be052
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x29799be052

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf5a045438e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf5a045438e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf80ade0a63
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf80ade0a63

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3d94837f7b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3d94837f7b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5327403b59
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5327403b59

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x24f74b4d8e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x24f74b4d8e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9f27f800b1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9f27f800b1

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd2100fca15
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd2100fca15

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdb4d3f33fd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdb4d3f33fd

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x436a6a6f26
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x436a6a6f26

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x24a76a7336
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x24a76a7336

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x959dbd4dcf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x959dbd4dcf

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x674307fc6f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x674307fc6f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x300425b2a9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x300425b2a9

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf4ff84682f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf4ff84682f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1b5e7e80a4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1b5e7e80a4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc177db542c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc177db542c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xecb18f9d84
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xecb18f9d84

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4408ae7ef3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4408ae7ef3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8534d55709
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8534d55709

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xee48406fee
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xee48406fee

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x06805de895
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x06805de895

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4d07cd44c0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4d07cd44c0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x30d5f80553
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x30d5f80553

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3bfb81a247
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3bfb81a247

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xccfaf76a5d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xccfaf76a5d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa42f73d95d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa42f73d95d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2fa8170964
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2fa8170964

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xaaaf5dba75
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xaaaf5dba75

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0a44d70f71
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0a44d70f71

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x010749eb75
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x010749eb75

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x14eaefe1f0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x14eaefe1f0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4241e8a7ed
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4241e8a7ed

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0cdb38d084
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0cdb38d084

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc5288436d7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc5288436d7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x249f9920a6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x249f9920a6

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x514d81ed2a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x514d81ed2a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x76023ffaef
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x76023ffaef

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2c0c90917a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2c0c90917a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb5b3231434
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb5b3231434

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xaa7e98f30c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xaa7e98f30c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5dc7947fc3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5dc7947fc3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbf3467e7d5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbf3467e7d5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xab38843480
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xab38843480

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb7b4144f20
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb7b4144f20

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5bebef5efc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5bebef5efc

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3cc2427e86
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3cc2427e86

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1b549871f5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1b549871f5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x445bca2324
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x445bca2324

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x09a230d877
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x09a230d877

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7261ecd7d3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7261ecd7d3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa85784bb87
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa85784bb87

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb2a51b9d5c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb2a51b9d5c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xab4bdd152b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xab4bdd152b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb1cb0bfe4d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb1cb0bfe4d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x77e79c9b23
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x77e79c9b23

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x630ab77f3c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x630ab77f3c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4fd9d6f86d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4fd9d6f86d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4106feda78
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4106feda78

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6dde4a5325
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6dde4a5325

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf23354008a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf23354008a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1c191ce861
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1c191ce861

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbfe4b248b9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbfe4b248b9

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5255d5b504
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5255d5b504

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6a81b0678f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6a81b0678f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd2c7280c24
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd2c7280c24

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x620f9b4233
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x620f9b4233

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7358bd3750
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7358bd3750

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x42db73b7de
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x42db73b7de

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc5a9c6c4db
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc5a9c6c4db

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xff39ce7a1e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xff39ce7a1e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8f04f11ead
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8f04f11ead

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdbe2fb7ad3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdbe2fb7ad3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x66133b86f4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x66133b86f4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x50e5af69fc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x50e5af69fc

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1b2ea3ffb4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1b2ea3ffb4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xcc3629d69b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xcc3629d69b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe2a85e600b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe2a85e600b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0956373774
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0956373774

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xba7f4616fc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xba7f4616fc

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0c9b1d3386
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0c9b1d3386

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x538e1d7cfe
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x538e1d7cfe

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb1c4b07312
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb1c4b07312

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd7d5e1a08e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd7d5e1a08e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x14d0ab47bf
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x14d0ab47bf

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x95d9ef7786
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x95d9ef7786

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x96a40f4a25
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x96a40f4a25

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xeb05b9dc8a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xeb05b9dc8a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3562d7ab6d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3562d7ab6d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4fa9602860
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4fa9602860

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x14f70aef5c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x14f70aef5c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x45ed21ef74
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x45ed21ef74

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa9cedfe87e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa9cedfe87e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb02830c088
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb02830c088

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x51aa5fa5ef
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x51aa5fa5ef

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x49f357c040
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x49f357c040

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd2c55ca7ae
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd2c55ca7ae

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4f34e5c20e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4f34e5c20e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x56c258ded8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x56c258ded8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x02d457b9cd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x02d457b9cd

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3e25db0579
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3e25db0579

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8d8b99f36b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8d8b99f36b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1a16630a4f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1a16630a4f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x469747a8cb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x469747a8cb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x955b9a8058
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x955b9a8058

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xce7c363e91
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xce7c363e91

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd8b2f14a80
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd8b2f14a80

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3f5911b4e0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3f5911b4e0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xebedb3487e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xebedb3487e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x522c4f7a6a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x522c4f7a6a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7769ececf8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7769ececf8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x07054a1446
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x07054a1446

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x78fea002b3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x78fea002b3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x931afe49d7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x931afe49d7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x318a2f96f4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x318a2f96f4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0db6af4070
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0db6af4070

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x31753c9572
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x31753c9572

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6d351d7dfa
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6d351d7dfa

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xae5202835e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xae5202835e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc6c6e30dd2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc6c6e30dd2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x03a69e11f2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x03a69e11f2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9bf393cfd2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9bf393cfd2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd75f7a8421
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd75f7a8421

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa27aad0b7f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa27aad0b7f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1d4b6be4ce
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1d4b6be4ce

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x326fe64001
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x326fe64001

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1f533e204f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1f533e204f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x35e71f6a90
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x35e71f6a90

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdf54cd9c11
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdf54cd9c11

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbe6c21c9d5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbe6c21c9d5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x461a108207
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x461a108207

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x210f6d82e0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x210f6d82e0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa364eb7999
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa364eb7999

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x95224f89f0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x95224f89f0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xaa87a618f4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xaa87a618f4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x65d780cf13
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x65d780cf13

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9151b1eef8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9151b1eef8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xed346cf0eb
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xed346cf0eb

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf47c17806b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf47c17806b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe0c35242be
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe0c35242be

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2c50bf4fbd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2c50bf4fbd

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x06b6d30379
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x06b6d30379

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe9a4e7fd2b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe9a4e7fd2b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x81881c19ae
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x81881c19ae

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc0e3a0563b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc0e3a0563b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x08d1b14e6c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x08d1b14e6c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0cee861a9e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0cee861a9e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xfa012ba911
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xfa012ba911

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0010c4f234
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0010c4f234

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x40fe5587d1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x40fe5587d1

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x45489cfd34
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x45489cfd34

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa3d6a19424
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa3d6a19424

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbac2c08446
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbac2c08446

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xef2b8b4f42
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xef2b8b4f42

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc021bf7e51
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc021bf7e51

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3557eb9388
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3557eb9388

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8ba5f4aaf0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8ba5f4aaf0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x21c3ded17a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x21c3ded17a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb99007a977
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb99007a977

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb486c98e49
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb486c98e49

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2b2e380dc3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2b2e380dc3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x53b5ab92c2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x53b5ab92c2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x14b1eb61e0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x14b1eb61e0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x541f46df1c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x541f46df1c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x276b102817
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x276b102817

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xfed0be5d02
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xfed0be5d02

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa04cf821f1
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa04cf821f1

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1e22de013f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1e22de013f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9971192115
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9971192115

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd1933195a0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd1933195a0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x5ecadb4d7c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x5ecadb4d7c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xfc6fecdb1e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xfc6fecdb1e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x552d899739
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x552d899739

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x800129ba1f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x800129ba1f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x167d723f11
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x167d723f11

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0d815c9e02
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0d815c9e02

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2db7e29bc3
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2db7e29bc3

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7e378f024b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7e378f024b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x6dd13f033a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x6dd13f033a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x81731b8d4e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x81731b8d4e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbb4abd001d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbb4abd001d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4be46d500b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4be46d500b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7b9b727f31
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7b9b727f31

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x04619e8ffc
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x04619e8ffc

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x75037d7622
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x75037d7622

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9ca226ba8b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9ca226ba8b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xcf76984791
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xcf76984791

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x67882dd871
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x67882dd871

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xab1653458e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xab1653458e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7a8601481a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7a8601481a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9d65688c42
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9d65688c42

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x861dc31a3f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x861dc31a3f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb161f5a20f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb161f5a20f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe6f8f3991a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe6f8f3991a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xae9a9525a5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xae9a9525a5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x22a8ea82ce
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x22a8ea82ce

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x84f96e0391
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x84f96e0391

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x80139c27b7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x80139c27b7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7f81d2845d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7f81d2845d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x53b3151c73
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x53b3151c73

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x28b4e457b0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x28b4e457b0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xabd9bfbba8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xabd9bfbba8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbe8bddab1d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbe8bddab1d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1ce94804df
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1ce94804df

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x82459df99a
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x82459df99a

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x088d51467b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x088d51467b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x96ccd95f06
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x96ccd95f06

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd6c22623e4
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd6c22623e4

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd82e1cbb10
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd82e1cbb10

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf335765ac2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf335765ac2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x50d484c0ef
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x50d484c0ef

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xb69ae05585
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xb69ae05585

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x90c45e5f90
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x90c45e5f90

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf0942987f8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf0942987f8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x690c15bad9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x690c15bad9

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdcbba97fb0
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdcbba97fb0

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xe3f1904471
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xe3f1904471

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x10069e2c5c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x10069e2c5c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc08924b9bd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc08924b9bd

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7906d0e56b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7906d0e56b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x9448469e37
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x9448469e37

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf1aafa2bf7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf1aafa2bf7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xde1bf85c51
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xde1bf85c51

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x19f1779351
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x19f1779351

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2066f2fa58
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2066f2fa58

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xdb76a69e39
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xdb76a69e39

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x70403560cd
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x70403560cd

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x023bd71084
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x023bd71084

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x37204c476f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x37204c476f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2a5bc4658f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2a5bc4658f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xc834cabfc5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xc834cabfc5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8ca10c005b
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8ca10c005b

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x8a589f57a8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x8a589f57a8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0862dc079f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0862dc079f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x222bdfcb14
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x222bdfcb14

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x486d642804
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x486d642804

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3bd31355a5
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3bd31355a5

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x06741f5be6
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x06741f5be6

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa9d6d49c14
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa9d6d49c14

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x0a98376315
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x0a98376315

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x821c4a50b7
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x821c4a50b7

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x821b357995
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x821b357995

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x98e883ce0c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x98e883ce0c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3afd18dd34
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3afd18dd34

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x707bda65b2
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x707bda65b2

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x60a1fd1c4c
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x60a1fd1c4c

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x490e75a4a9
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x490e75a4a9

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x1f4bc40e66
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x1f4bc40e66

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x713a0c0b23
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x713a0c0b23

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xf149fd7059
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xf149fd7059

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x4fba7b3705
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x4fba7b3705

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xec63798eee
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xec63798eee

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xbb7a9557b8
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xbb7a9557b8

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd049062003
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd049062003

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x98ba8a7715
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x98ba8a7715

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xd9798c1742
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xd9798c1742

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xef4ac00963
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xef4ac00963

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x83e47f165e
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x83e47f165e

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x7b615ef298
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x7b615ef298

namespace JapanTaxLaw.BulkStructLbl9be67d179a.xa609acfc45
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.xa609acfc45

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x56cbcffc1f
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x56cbcffc1f

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x2c5c856d1d
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x2c5c856d1d

namespace JapanTaxLaw.BulkStructLbl9be67d179a.x3d52574122
def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else true
theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BulkStructLbl9be67d179a.x3d52574122
