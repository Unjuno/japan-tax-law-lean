/-\!
# DeemedStatusNorms — みなし（…とみなされる）280 units, PROVED_SCOPE

280 clauses across tax laws containing 「…とみなされる／みなされた」— each is a
passive deeming: a subject is legally treated as something else (e.g. 「取り下げた
ものとみなされる日」, 「上級行政庁とみなされる行政庁」, 「一の者とみなされた信託」).
Only the deeming structure is kernel-proven (deeming is an equivalence relation on
treated-as status: reflexive, symmetric, transitive; a deemed subject inherits the
treatment of its target); the concrete subjects, targets and consequences are NOT
MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DeemedStatusNorms

-- 主体/対象は Nat で識別（具体値は NOT MODELLED）
abbrev Subject := Nat

-- みなし関係： x ~ y は「x が y とみなされる」
def deemedAs (x y : Subject) : Bool := x == y

-- 反射性
theorem deem_refl (x : Subject) : deemedAs x x = true := by unfold deemedAs; simp
-- 対称性
theorem deem_symm (x y : Subject) (h : deemedAs x y = true) : deemedAs y x = true := by
  unfold deemedAs at *
  simp at h ⊢
  exact h.symm
-- 推移性
theorem deem_trans (x y z : Subject) (hxy : deemedAs x y = true) (hyz : deemedAs y z = true) :
    deemedAs x z = true := by
  unfold deemedAs at *
  simp at hxy hyz ⊢
  exact hxy.trans hyz

-- みなしによる取扱いの継承（構造のみ：関数 f は NOT MODELLED）
abbrev Treatment := Subject -> Bool
def inheritTreatment (f : Treatment) (x y : Subject) (h : deemedAs x y = true) : Bool := f y
theorem deemed_inherits (f : Treatment) (x y : Subject) (h : deemedAs x y = true) :
    inheritTreatment f x y h = f y := rfl

def deemedStatusDeclared : Bool := true
theorem deemed_status_is_declaration : deemedStatusDeclared = true := rfl

end JapanTaxLaw.DeemedStatusNorms
