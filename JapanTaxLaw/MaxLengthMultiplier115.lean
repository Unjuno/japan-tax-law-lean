import JapanTaxLaw.TaxFinance

/-
# MaxLengthMultiplier115 — 登録免許税法施行令 第二十一条（船舶設備の最大船長一・一五倍規制）

Pinned source:
  Law id: 342CO0000000146
  Revision: 342CO0000000146_20261001_507CO0000000124
  Raw snapshot: data/raw/342CO0000000146_20261001_507CO0000000124.law.json
  sha256: 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b
  Statutory article: 第二十一条 (art. 21; raw JSON Article attr.Num = "21",
    Caption （船舶の製造事業等に係る設備の拡張の許可で課税しないものの範囲）, Item 二).
  Law title: 登録免許税法施行令 (CabinetOrder, 昭和四十二年政令第百四十六号);
    revision enforced 2026-10-01 (改正 令和七年政令第百二十四号).

原文逐語（pinned, 一字一句改変なし; scoped Article 21, Item 二）:
  「最大船長（製造又は修繕をすることができる船舶の長さの最大値をいう。以下この号において同じ。）が、拡張許可前の当該設備における最大船長の一・一五倍を超えることとならないものであること」

Variable contract:
  `after : Nat` = 拡張許可後の当該設備における最大船長 (length, consistent unit).
  `before : Nat` = 拡張許可前の当該設備における最大船長 (same unit).
  一・一五倍 = 1.15 = 115/100, expressed as exact integer cross-multiplication:
    100 * after <= 115 * before, i.e. after <= 1.15 * before.
  「超えることとならない」 = must not exceed = INCLUSIVE <= (equality allowed).
  before = 0 guard: with before = 0 only after = 0 passes (100 * after <= 0).

Scope: ONLY the explicit numeric ceiling 一・一五倍 = 115/100 of Item 二 is modelled.
  The sibling Item 一 (最大トン数 一・六倍), the definition of 拡張許可, the other
  requirements of this article and all other provisions are OUT OF SCOPE.
  No floats, division or rounding: exact integer cross-multiplication only.
  No `sorry`, `admit`, `axiom` or `Classical.choice`, and no order-typeclass
  monotonicity abstraction. The predicate is a direct Bool relation.
-/

namespace JapanTaxLaw.MaxLengthMultiplier115

/-- 一・一五 = 1.15 — statutory multiplier numerator = 115. -/
def multiplierNumer : Nat := 115

/-- 一・一五 = 1.15 = 115/100 — statutory multiplier denominator = 100. -/
def multiplierDenom : Nat := 100

/-- The INCLUSIVE numeric ceiling: after <= 1.15 * before, encoded exactly as
    100 * after <= 115 * before (no division, no floats). -/
def withinLengthLimit (after before : Nat) : Bool :=
  decide (100 * after <= 115 * before)

/-- 一・一五 = 115/100 sanity witness. -/
theorem multiplierIsOnePointFifteen : multiplierNumer * 100 = 115 * multiplierDenom := by
  decide

/-- Exactly 1.15x: after=115, before=100 is within the ceiling (inclusive). -/
theorem withinExact : withinLengthLimit 115 100 = true := by
  decide

/-- Just above: after=116, before=100 exceeds the ceiling. -/
theorem aboveCeiling : withinLengthLimit 116 100 = false := by
  decide

/-- Below: after=114, before=100 is within the ceiling. -/
theorem belowCeiling : withinLengthLimit 114 100 = true := by
  decide

/-- before=0 guard: only after=0 passes. -/
theorem zeroBeforeZeroAfter : withinLengthLimit 0 0 = true := by
  decide

/-- before=0 guard: after=1 is rejected. -/
theorem zeroBeforeNonzeroAfter : withinLengthLimit 1 0 = false := by
  decide

/-- Direct-inequality monotonicity in `before`: a larger before can never turn a
    passing after into a failing one. Kernel-checked by omega; this is NOT the
    impl/spec bridge (that bridge uses only Nat.mul_comm). -/
theorem withinLengthLimit_mono_before (after before1 before2 : Nat)
    (hle : before1 <= before2) (hok : withinLengthLimit after before1 = true) :
    withinLengthLimit after before2 = true := by
  unfold withinLengthLimit at hok ⊢
  simp at hok ⊢
  omega

end JapanTaxLaw.MaxLengthMultiplier115
