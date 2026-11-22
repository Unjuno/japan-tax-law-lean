import JapanTaxLaw.TaxFinance

/-
# MachineryCostExcess1M — 沖縄振興特別措置法第九条等の地方税の課税免除又は不均一課税に伴う措置が適用される場合等を定める省令 第四条(1)(3)ロ
（機械及び装置の取得価額の合計額が百万円を超えるもの）

Pinned source:
  Law id: 414M60000008042
  Official title: 沖縄振興特別措置法第九条等の地方税の課税免除又は不均一課税に伴う措置が適用される場合等を定める省令
  Law type: MinisterialOrdinance (省令)
  Revision: 414M60000008042_20250401_507M60000008028
  Raw snapshot: data/raw/414M60000008042_20250401_507M60000008028.law.json
  sha256: 5aca579dacd513116533f1a62abe88320dd4fdf5200b57d45973f41cd6fa1182
  Statutory article: 第四条 (art. 4), 第一項 (1), 第三号 (3), ロ (subitem 2)
  Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/
               Paragraph#1/Item#3/Subitem1#2/Subitem1Sentence/Sentence#1
  Normative unit id: NORM|c04fbcd7afdfbd2789ed292aed888fce9110f73ce74c9c5ced62c87e82924d41

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「イに掲げるもののほか、機械及び装置で、これらの取得価額の合計額が百万円を超えるもの」

Variable contract:
  `costFloor : Nat := 1_000_000` = 百万円 (strict lower bound: 超える).
  `exceedsCostFloor total : Bool := decide (costFloor < total)`.
  Unit 円; domain Nat (whole yen). 「超える」 = strict `>`, NOT inclusive
  以上. A total acquisition cost of exactly 百万円 does NOT qualify.

Scope: ONLY this explicit numeric acquisition-cost condition is modelled — a
sum of acquisition costs strictly exceeds ¥1,000,000. The イ category it
qualifies, the tax exemption/non-uniform taxation this condition gates, the
definition of 機械及び装置, other items/subitems and all enforcement rules are
NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.MachineryCostExcess1M

/-- 百万円 — strict lower bound (超える). Unit 円; domain Nat. -/
def costFloor : Nat := 1_000_000

/-- 「取得価額の合計額が百万円を超える」: total > ¥1,000,000. -/
def exceedsCostFloor (total : Nat) : Bool :=
  decide (costFloor < total)

/-- 超える is exclusive: exactly 百万円 does not qualify. -/
theorem floor_exclusive : exceedsCostFloor 1_000_000 = false := by
  unfold exceedsCostFloor costFloor
  decide

/-- One yen above the floor qualifies. -/
theorem first_above : exceedsCostFloor 1_000_001 = true := by
  unfold exceedsCostFloor costFloor
  decide

/-- Zero acquisition cost does not satisfy the condition. -/
theorem zero_false : exceedsCostFloor 0 = false := by
  unfold exceedsCostFloor costFloor
  decide

end JapanTaxLaw.MachineryCostExcess1M
