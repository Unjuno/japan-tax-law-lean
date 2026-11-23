import JapanTaxLaw.DeemingRemainderNorms
import JapanTaxLaw.DeemingRemainderNormsSpec

/-!
# DeemingRemainderNormsTests — みなす演算子
-/
namespace JapanTaxLaw.DeemingRemainderNormsTests

open JapanTaxLaw.DeemingRemainderNorms

theorem deem_spec (s t : Nat) :
    deemAs s t = JapanTaxLaw.DeemingRemainderNormsSpec.deemSpec s t := by rfl

theorem deemFor_spec (c u s t : Nat) :
    deemFor c u s t = JapanTaxLaw.DeemingRemainderNormsSpec.deemForSpec c u s t := by
  unfold deemFor JapanTaxLaw.DeemingRemainderNormsSpec.deemForSpec
  by_cases h : c = u
  · simp [h]
  · simp [h]

example (s t : Nat) : deemAs s t = t := deemed_is_target s t
example {s t s' t' : Nat} (hs : s = s') (ht : t = t') : deemAs s t = deemAs s' t' := deem_congr hs ht
example (s : Nat) : deemAs s 0 = 0 := deem_zero_target s
example (c s t : Nat) : deemFor c c s t = t := deemFor_matched c s t
example (c u s t : Nat) (h : c ≠ u) : deemFor c u s t = s := deemFor_unmatched c u s t h
example (c s : Nat) : deemFor c c s s = s := deemFor_degenerate c s
example : deemingDeclared = true := deeming_is_declaration

end JapanTaxLaw.DeemingRemainderNormsTests
