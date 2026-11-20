import JapanTaxLaw.LocalTobaccoTaxRate

/-!
# LocalTobaccoTaxRateSpec — 地方税法 art.74の5 の独立形式仕様

This restates the statutory amount independently of the implementation
constant: 「千七十円」 is parsed as a bare `Nat` literal (1,070), without
referencing `ratePerThousand`. The correspondence theorem is a kernel-checked
decidable equality on this single constant, NOT a source-fidelity proof: the
Lean-independent source audit is recorded separately in the evidence ledger.
-/

namespace JapanTaxLaw.LocalTobaccoTaxRate

/-- 独立定式: 原文「千七十円」を Nat で書き下した値（円/千本）。 -/
def specRateYen : Nat := 1_070

example : specRateYen = 1_070 := by rfl

/-- 実装 ↔ 独立定式の一致（カーネル検証、定数1点のみ）。 -/
def agreeLocalTobaccoTaxRate : Bool :=
  ratePerThousand == specRateYen

theorem specRate_eq_impl : specRateYen = ratePerThousand := by rfl

example : agreeLocalTobaccoTaxRate = true := by decide

end JapanTaxLaw.LocalTobaccoTaxRate
