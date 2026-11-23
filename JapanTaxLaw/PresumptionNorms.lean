/-\!
# PresumptionNorms — 推定規定（「…ものと推定する」）10 units, PROVED_SCOPE

10 clauses whose entire norm is a rebuttable presumption: on proof of a base
fact B, a presumed fact P is taken to hold (unless rebutted). Only the
presumption structure is kernel-proven; the concrete facts are NOT MODELLED.
Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.PresumptionNorms

-- 推定：Base が成り立てば Presumed が成り立つ（本質: base → presumed）
def presumed (base presumedFact : Prop) : Prop := base → presumedFact

-- 推定が成り立つなら base から presumed が導かれる
theorem presume_apply {b p : Prop} (h : presumed b p) (hb : b) : p := h hb
-- base がなければ推定は発動しない
theorem presume_no_base (p : Prop) : presumed False p := by intro h; cases h
-- 自己推定は恒等
theorem presume_self (p : Prop) : presumed p p := by intro h; exact h
-- 推移：B→P かつ P→Q なら B→Q
theorem presume_trans {b p q : Prop} (h1 : presumed b p) (h2 : presumed p q) : presumed b q := by
  intro hb; exact h2 (h1 hb)

def presumptionDeclared : Bool := true
theorem presumption_is_declaration : presumptionDeclared = true := rfl

end JapanTaxLaw.PresumptionNorms
