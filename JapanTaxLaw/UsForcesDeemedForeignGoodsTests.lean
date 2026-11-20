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

end JapanTaxLaw.UsForcesDeemedForeignGoods
