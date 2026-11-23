import JapanTaxLaw.TaxFinance

/-
# LimitRateSevenPercent — 租税条約等実施特例法施行令 第四条(1)(4)（限度税率が百分の七である場合）

Pinned source:
  Law id: 362CO0000000335
  Official title: 租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律施行令
  Law type: CabinetOrder (政令)
  Revision: 362CO0000000335_20260521_506CO0000000150
  Raw snapshot: data/raw/362CO0000000335_20260521_506CO0000000150.law.json
  sha256: 8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18
  Statutory article: 第四条 (art. 4), 第一項 (1), 第四号 (4)
  Source path: LawBody[2]/MainProvision/MainProvision[8]/Article:4/Article#4/
               Paragraph#1/Item#4/ItemSentence/Column#1/Sentence#1
  Normative unit id: NORM|dfc45330a683e8b1b033e5b78eaf211d568a0c15cdf9ae0da6cdd3554c54c4fe

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「限度税率が百分の七である場合」

Variable contract:
  `statutoryRatePercent : Nat := 7` = 百分の七 = 7/100.
  `isSevenPercent (percent : Nat) : Bool := decide (percent == statutoryRatePercent)`.
  Domain Nat (whole percent points). The predicate is true exactly at 7%.

Scope: ONLY this explicit limit-rate condition is modelled. The tax base to
which the rate applies, the other rate cases (百分の二/五/八/十/十二/十五/十六),
the gated special measure, other items/paragraphs and enforcement rules are
NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LimitRateSevenPercent

/-- 百分の七 — the statutory limit rate, in percent points. -/
def statutoryRatePercent : Nat := 7

/-- 「限度税率が百分の七」: the limit rate is exactly 7%. -/
def isSevenPercent (percent : Nat) : Bool :=
  decide (percent == statutoryRatePercent)

/-- Exactly seven percent qualifies. -/
theorem seven_true : isSevenPercent 7 = true := by
  unfold isSevenPercent statutoryRatePercent
  decide

/-- Eight percent is not this case. -/
theorem eight_false : isSevenPercent 8 = false := by
  unfold isSevenPercent statutoryRatePercent
  decide

/-- Zero percent is not this case. -/
theorem zero_false : isSevenPercent 0 = false := by
  unfold isSevenPercent statutoryRatePercent
  decide

end JapanTaxLaw.LimitRateSevenPercent
