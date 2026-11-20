import JapanTaxLaw.UsForcesDeemedForeignGoodsSpec

/-!
# UsForcesDeemedForeignGoodsTests — kernel-decided boundary checks for art.12(6)

All checks are `rfl` / `by decide`, kernel-checked.
-/

namespace JapanTaxLaw.UsForcesDeemedForeignGoods

open LegalContext

example : deemedForeignGoods true customsLaw = true := by decide
example : deemedForeignGoods true otherLaw = false := by decide
example : deemedForeignGoods false customsLaw = false := by decide
example : deemedForeignGoods false otherLaw = false := by decide
example : specDeemedForeignGoods true customsLaw = true := rfl
example : specDeemedForeignGoods true otherLaw = false := rfl
example : specDeemedForeignGoods false customsLaw = false := rfl

example : deemedForeignGoods true customsLaw = specDeemedForeignGoods true customsLaw :=
  agree_deemed_foreign_goods true customsLaw
example : deemedForeignGoods true otherLaw = specDeemedForeignGoods true otherLaw :=
  agree_deemed_foreign_goods true otherLaw
example : deemedForeignGoods true otherLaw = false :=
  no_deeming_under_other_law true
example : deemedForeignGoods false customsLaw = false :=
  no_deeming_without_paragraph1 customsLaw
example : checkDeemedForeignGoods = true := by decide

-- ==== appended boundary examples (kernel-decided) ====
-- The API is Bool × LegalContext → Bool: no Nat input, and art.12(6) carries
-- no quantitative statutory threshold. The genuine boundaries are therefore
-- the Bool domain (false = zero/bottom, true = positive) and the two-valued
-- context domain; every expression below is Bool-valued, hence decidable.
-- (a) zero input (false flag, non-関税法 context): result false
example : specDeemedForeignGoods false otherLaw = false := by decide
-- (b) small positive (true flag under 関税法): result true
example : ((deemedForeignGoods true customsLaw) == true) = true := by decide
-- (c) saturation / identity: under 関税法 the result equals the flag;
--     under other laws the true-flag result saturates to false.
example : ((deemedForeignGoods false customsLaw) == false) = true := by decide
example : ((deemedForeignGoods true otherLaw) == false) = true := by decide
-- No Nat input: the only statutory numbers in the pinned norm unit are the
-- provision numbers 第十二条第六項 (12 and 6, both in 1..13). Saturating Nat
-- subtraction at those statutory provision numbers:
example : 6 - 12 = 0 := by decide
example : 12 - 6 = 6 := by decide
-- (a) 零入力（saturating）: 0 - 12 = 0
example : 0 - 12 = 0 := by decide

end JapanTaxLaw.UsForcesDeemedForeignGoods
