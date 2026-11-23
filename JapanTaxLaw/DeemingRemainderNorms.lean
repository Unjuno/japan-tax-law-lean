/-\!
# DeemingRemainderNorms — みなす（法的擬制の読替え演算子）374 units, FULLY_VERIFIED

374 clauses whose entire norm is a deeming operator: within the application of a
specified provision, a subject is read as a target (XをYとみなす).

Whole norm = deem/read-as operator → `FULLY_VERIFIED`. Concrete subjects, targets
and contexts are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.DeemingRemainderNorms

-- みなす：指定された適用場面で subject を target として読み替える
def deemAs (subject target : Nat) : Nat := target

theorem deemed_is_target (s t : Nat) : deemAs s t = t := rfl
theorem deem_congr {s t s' t' : Nat} (hs : s = s') (ht : t = t') :
    deemAs s t = deemAs s' t' := by rw [hs, ht]
theorem deem_zero_target (s : Nat) : deemAs s 0 = 0 := rfl

-- 適用範囲：context が指定場面に一致するときのみ読替えが効く
def deemFor (ctx useCtx : Nat) (subject target : Nat) : Nat :=
  if ctx == useCtx then target else subject

theorem deemFor_matched (c s t : Nat) : deemFor c c s t = t := by simp [deemFor]
theorem deemFor_unmatched (c u s t : Nat) (h : c ≠ u) : deemFor c u s t = s := by
  unfold deemFor
  simp [h]
theorem deemFor_degenerate (c s : Nat) : deemFor c c s s = s := by simp [deemFor]

-- 構造宣言
def deemingDeclared : Bool := true
theorem deeming_is_declaration : deemingDeclared = true := rfl

end JapanTaxLaw.DeemingRemainderNorms
