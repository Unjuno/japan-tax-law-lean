import JapanTaxLaw.TaxFinance

/-
# SecrecyBreachPenaltyCeilings — 租税特別措置の適用状況の透明化等に関する法律 第十二条（二年以下 / 百万円以下）

Pinned source:
  Law id: 422AC0000000008
  Official title: 租税特別措置の適用状況の透明化等に関する法律
  Law type: Act (法律)
  Revision: 422AC0000000008_20260401_507AC0000000013
  Raw snapshot: data/raw/422AC0000000008_20260401_507AC0000000013.law.json
  sha256: c77407cb86390875550d2fc40f5f88a1225b29e4b8cbd2618abff1dadeabbf11
  Statutory article: 第十二条 (art. 12), 第一項 (1)
  Source path: LawBody[1]/MainProvision/MainProvision[11]/Article:12/Article#12/
               Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit id: NORM|aa899a2aff6a364b1a8e0838170134762b03cd0a9655819f9a51aca918a2f697

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「第九条の規定に違反して、その業務に関して知り得た個人又は法人その他の団体の秘密を漏らした者は、二年以下の拘禁刑又は百万円以下の罰金に処する。」

Variable contract:
  `imprisonmentMonthsCap : Nat := 2` = 二年以下, unit 月, domain Nat.
  `fineYenCap : Nat := 1000000` = 百万円以下, unit 円, domain Nat.
  Both ceilings are inclusive (以下). The two penalties are ALTERNATIVES (又は),
  not cumulative; each ceiling is exposed as a separate predicate.

Scope: ONLY the two numeric ceilings are modelled. 第九条's duty, the offence
elements, sentencing rules, other articles and enforcement rules are NOT
MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SecrecyBreachPenaltyCeilings

/-- 二年以下 — inclusive imprisonment ceiling. Unit 月; domain Nat. -/
def imprisonmentMonthsCap : Nat := 2

/-- 百万円以下 — inclusive fine ceiling. Unit 円; domain Nat. -/
def fineYenCap : Nat := 1000000

/-- 拘禁刑: at most two months. -/
def withinImprisonmentCeiling (months : Nat) : Bool :=
  decide (months <= imprisonmentMonthsCap)

/-- 罰金: at most one million yen. -/
def withinFineCeiling (yen : Nat) : Bool :=
  decide (yen <= fineYenCap)

/-- 以下 is inclusive: exactly two months qualifies. -/
theorem two_months_inclusive : withinImprisonmentCeiling 2 = true := by
  unfold withinImprisonmentCeiling imprisonmentMonthsCap
  decide

/-- Three months exceeds the ceiling. -/
theorem three_months_false : withinImprisonmentCeiling 3 = false := by
  unfold withinImprisonmentCeiling imprisonmentMonthsCap
  decide

/-- 以下 is inclusive: exactly one million yen qualifies. -/
theorem one_million_inclusive : withinFineCeiling 1000000 = true := by
  unfold withinFineCeiling fineYenCap
  decide

/-- One million and one yen exceeds the ceiling. -/
theorem over_fine_false : withinFineCeiling 1000001 = false := by
  unfold withinFineCeiling fineYenCap
  decide

end JapanTaxLaw.SecrecyBreachPenaltyCeilings
