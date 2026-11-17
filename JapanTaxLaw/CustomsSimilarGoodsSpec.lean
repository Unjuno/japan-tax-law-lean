import JapanTaxLaw.CustomsSimilarGoods

/-!
# CustomsSimilarGoods spec — 関税定率法 art. 4の2

Sources (pinned; identical to CustomsSimilarGoods.lean):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of:
  * 双方あるときは同種、同種がなければ類似、双方なければ none
  impl が match を使うのに対し、spec は Bool の入れ子 if で独立定式。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 同種優先の選択（独立定式）。 -/
def specSelectSimilar (sameVal : Money) (samePresent : Bool) (similarVal : Money) (similarPresent : Bool) : Option Money :=
  if samePresent then some sameVal
  else if similarPresent then some similarVal
  else none

-- ==== points (kernel-decided) ====

example : specSelectSimilar 1_000_000 true 900_000 true = some 1_000_000 := by decide
example : specSelectSimilar 1_000_000 false 900_000 true = some 900_000 := by decide
example : specSelectSimilar 1_000_000 false 900_000 false = none := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCustomsSimilarGoods : Bool :=
  selectedSimilarGoodsPrice (some 1_000_000) (some 900_000) == specSelectSimilar 1_000_000 true 900_000 true
    && selectedSimilarGoodsPrice (some 1_000_000) none == specSelectSimilar 1_000_000 true 900_000 false
    && selectedSimilarGoodsPrice none (some 900_000) == specSelectSimilar 1_000_000 false 900_000 true
    && selectedSimilarGoodsPrice none none == specSelectSimilar 1_000_000 false 900_000 false

example : agreeCustomsSimilarGoods = true := by decide

end JapanTaxLaw
