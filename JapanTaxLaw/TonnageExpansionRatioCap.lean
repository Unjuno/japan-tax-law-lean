import JapanTaxLaw.TaxFinance

/-
# TonnageExpansionRatioCap — 登録免許税法施行令 第二十一条（設備拡張の最大トン数一・六倍規制）

Pinned source:
  Law id: 342CO0000000146
  Revision: 342CO0000000146_20261001_507CO0000000124
  Raw snapshot: data/raw/342CO0000000146_20261001_507CO0000000124.law.json
  sha256: 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b
  Statutory article: 第二十一条 (art. 21; raw JSON Article attr.Num = "21",
    Caption （船舶の製造事業等に係る設備の拡張の許可で課税しないものの範囲）, Item 一).
  Law title: 登録免許税法施行令 (CabinetOrder, 昭和四十二年政令第百四十六号);
    revision enforced 2026-10-01 (改正 令和七年政令第百二十四号).

原文逐語（pinned, 一字一句改変なし; scoped Article 21, Item 一）:
  「当該設備における最大トン数（製造又は修繕をすることができる船舶の総トン数の最大値をいう。以下この号において同じ。）が、拡張許可前の当該設備における最大トン数の一・六倍を超えることとならないものであること。」

Variable contract:
  `before : Nat` = 拡張許可前の当該設備における最大トン数 (総トン).
  `after : Nat` = 拡張許可後の当該設備における最大トン数 (総トン).
  一・六倍 = 1.6 = 16/10, expressed as exact integer cross-multiplication:
    10 * after <= 16 * before, i.e. after <= 1.6 * before.
  「超えることとならない」 = must not exceed = INCLUSIVE <= (equality allowed).
  before = 0 guard: with before = 0 only after = 0 passes (10 * after <= 0).

Scope: ONLY the explicit numeric ceiling 一・六倍 = 16/10 of Item 一 is modelled.
  The sibling Item 二 (最大船長 一・一五倍), the definition of 拡張許可, the other
  requirements of this article and all other provisions are OUT OF SCOPE.
  No floats, division or rounding: exact integer cross-multiplication only.
  No `sorry`, `admit`, `axiom` or `Classical.choice`; no order-typeclass
  monotonicity abstraction. The predicate is a direct Bool relation.
-/

namespace JapanTaxLaw.TonnageExpansionRatioCap

/-- 一・六 = 1.6 — statutory multiplier numerator = 16 tenths. -/
def scaledRatio : Nat := 16

/-- 一・六 = 1.6 = 16/10 — statutory multiplier denominator = 10. -/
def scaleBase : Nat := 10

/-- The INCLUSIVE numeric ceiling: after <= 1.6 * before, encoded exactly as
    10 * after <= 16 * before (no division, no floats). -/
def withinCap (before : Nat) (after : Nat) : Bool :=
  decide (scaleBase * after <= scaledRatio * before)

/-- 一・六 = 16/10 sanity witness. -/
theorem scaledRatioIsOnePointSix : scaledRatio = 16 := by
  rfl

/-- Exactly 1.6x: before=100, after=160 is within the ceiling (inclusive). -/
theorem withinCap_at_cap : withinCap 100 160 = true := by
  decide

/-- Just above: before=100, after=161 exceeds the ceiling. -/
theorem withinCap_above_cap : withinCap 100 161 = false := by
  decide

/-- Just below: before=100, after=159 is within the ceiling. -/
theorem withinCap_below_cap : withinCap 100 159 = true := by
  decide

/-- before=0 guard: only after=0 passes. -/
theorem withinCap_zero : withinCap 0 0 = true := by
  decide

end JapanTaxLaw.TonnageExpansionRatioCap
