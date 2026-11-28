import JapanTaxLaw.TaxFinance

/-
# BoronContentInterval — 不当廉売関税政令 art.1 第一号ロ(1)（ほう素含有量 0.0008%〜0.007%）

Pinned: law 504CO0000000372, revision 504CO0000000372_20221208_000000000000000,
raw `data/raw/504CO0000000372_20221208_000000000000000.law.json`, Article 1 item 1 ロ(1).

原文逐語: 「ほう素の含有量が全重量の〇・〇〇〇八パーセント以上〇・〇〇七パーセント以下のもの」

Variable: `scaled : Nat` = ほう素重量 / 全重量 × 10^7 (unit 1/10^7, i.e.
percentage × 10^5). 0.0008% → 80, 0.007% → 700.
`inBoronRange scaled := 80 <= scaled ∧ scaled <= 700` (both bounds INCLUSIVE:
以上 and 以下).

Scope: ONLY the numeric interval. The certification procedure, other elements,
carbon content, cross-section and zinc plating are NOT MODELLED.
No `sorry`, `admit`, `axiom`, no `Classical.choice`.
-/
namespace JapanTaxLaw.BoronContentInterval

def lowerScaled : Nat := 80
def upperScaled : Nat := 700

@[reducible] def inBoronRange (scaled : Nat) : Prop :=
  lowerScaled <= scaled ∧ scaled <= upperScaled

theorem lowerBoundaryIncluded : inBoronRange 80 := by
  unfold inBoronRange lowerScaled upperScaled
  omega

theorem upperBoundaryIncluded : inBoronRange 700 := by
  unfold inBoronRange lowerScaled upperScaled
  omega

theorem justBelowLowerExcluded : ¬ inBoronRange 79 := by
  unfold inBoronRange lowerScaled upperScaled
  omega

theorem justAboveUpperExcluded : ¬ inBoronRange 701 := by
  unfold inBoronRange lowerScaled upperScaled
  omega

end JapanTaxLaw.BoronContentInterval
