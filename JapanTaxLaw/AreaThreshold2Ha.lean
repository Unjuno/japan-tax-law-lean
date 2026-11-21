import JapanTaxLaw.TaxFinance

/-
# AreaThreshold2Ha — 特定市街化区域農地の固定資産税の課税の適正化に伴う宅地化促進臨時措置法 第三条
  （区域面積二ヘクタール以上）

Pinned source:
  Law id: 348AC0000000102
  Official title: 特定市街化区域農地の固定資産税の課税の適正化に伴う宅地化促進臨時措置法
  Law number: 昭和四十八年法律第百二号
  Law type: Act (法律)
  Revision: 348AC0000000102_20010106_411AC0000000160
  Raw snapshot: data/raw/348AC0000000102_20010106_411AC0000000160.law.json
  sha256: 1aff9700ac6c8028a1901fc056959c771fb539c1c40da205f498bab4f67a063b
  Statutory article: 第三条 (art. 3; raw JSON Article attr.Num = "3",
  Paragraph#1 / Item#2 — verified by independent re-extraction: 1 structural
  hit, needle occurs verbatim once inside Article 3 and once in the whole file).

原文逐語（pinned, 一字一句改変なし）:
  「当該区域の面積が二ヘクタール以上であること」

Variable contract:
  `ha : Nat` = 区域の面積 (area of the 区域), unit ヘクタール (ha), whole hectares.
  `areaFloor : Nat := 2` = 二ヘクタール (2 ha).
  `meetsAreaFloor ha := decide (ha >= areaFloor)`; 「以上」 is INCLUSIVE (>=),
  so exactly 2 ha meets the floor and 1 ha does not.

Scope: ONLY the explicit numeric threshold in the pinned needle is modelled —
  二ヘクタール = 2 ha and 「以上」 = inclusive >=. Other Item thresholds in
  Article 3 (一ヘクタール = 1 ha, 十ヘクタール = 10 ha), the 事業計画要件,
  rates, other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `Classical.choice`, or monotonicity typeclass.
-/

namespace JapanTaxLaw.AreaThreshold2Ha

/-- 二ヘクタール = 2 ha. Unit ヘクタール; domain Nat. -/
def areaFloor : Nat := 2

/-- 「当該区域の面積が二ヘクタール以上」: ha is at least 2 ha (以上 = inclusive >=). -/
def meetsAreaFloor (ha : Nat) : Bool :=
  decide (ha >= areaFloor)

/-- 0 ha < 2 ha: the area floor is not met. -/
theorem zero_false : meetsAreaFloor 0 = false := by
  unfold meetsAreaFloor areaFloor
  decide

/-- 1 ha < 2 ha: just below the floor is not met. -/
theorem one_false : meetsAreaFloor 1 = false := by
  unfold meetsAreaFloor areaFloor
  decide

/-- Exactly 2 ha (二ヘクタール) meets the floor: 以上 is inclusive. -/
theorem two_true : meetsAreaFloor 2 = true := by
  unfold meetsAreaFloor areaFloor
  decide

/-- 3 ha > 2 ha: above the floor is met. -/
theorem three_true : meetsAreaFloor 3 = true := by
  unfold meetsAreaFloor areaFloor
  decide

/-- Direct-inequality monotonicity (no typeclass): if ha meets the floor and
    ha <= ha', then ha' meets the floor too. -/
theorem meetsAreaFloor_of_ge {ha ha' : Nat}
    (h : meetsAreaFloor ha = true) (hle : ha <= ha') :
    meetsAreaFloor ha' = true := by
  unfold meetsAreaFloor areaFloor at h ⊢
  apply decide_eq_true
  have hha : 2 <= ha := of_decide_eq_true h
  omega

end JapanTaxLaw.AreaThreshold2Ha
