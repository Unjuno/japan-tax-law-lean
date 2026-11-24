import JapanTaxLaw.TaxFinance

/-
# PenaltyCeilingsSixMonthsFiveHundredThousand — 租税条約等特例法 第十三条第四項（六月以下 / 五十万円以下）

Pinned source:
  Law id: 344AC0000000046
  Official title: 租税条約等の実施に伴う所得税法、法人税法及び地方税法の特例等に関する法律
  Law type: Act (法律)
  Revision: 344AC0000000046_20260521_508AC0000000012
  Raw snapshot: data/raw/344AC0000000046_20260521_508AC0000000012.law.json
  sha256: cd3975f035bee127e86b7cf244e137d624685182c7523f46a38c43f2e977b9ce
  Statutory article: 第十三条 (art. 13), 第四項 (4)
  Source path: LawBody[1]/MainProvision/MainProvision[39]/Article:13/Article#13/
               Paragraph#4/ParagraphSentence/Sentence#1
  Normative unit id: NORM|06ce1bd2e2b43bb2fb31d77ec0beca6f0da0b72a0704e63fc9126cbf83722dc9

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「次の各号のいずれかに該当する場合には、その違反行為をした者は、六月以下の拘禁刑又は五十万円以下の罰金に処する。」

Variable contract:
  `imprisonmentMonthsCap : Nat := 6` = 六月以下, unit 月, domain Nat.
  `fineYenCap : Nat := 500000` = 五十万円以下, unit 円, domain Nat.
  Both ceilings are inclusive (以下). The two penalties are ALTERNATIVES (又は),
  not cumulative; this module exposes each ceiling as a separate predicate and
  does NOT decide which alternative applies.

Scope: ONLY the two numeric ceilings are modelled. The 各号 conditions, the
offence elements, sentencing rules, other paragraphs and enforcement rules are
NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.PenaltyCeilingsSixMonthsFiveHundredThousand

/-- 六月以下 — inclusive imprisonment ceiling. Unit 月; domain Nat. -/
def imprisonmentMonthsCap : Nat := 6

/-- 五十万円以下 — inclusive fine ceiling. Unit 円; domain Nat. -/
def fineYenCap : Nat := 500000

/-- 拘禁刑: the imposed term is at most six months. -/
def withinImprisonmentCeiling (months : Nat) : Bool :=
  decide (months <= imprisonmentMonthsCap)

/-- 罰金: the imposed fine is at most 500,000 yen. -/
def withinFineCeiling (yen : Nat) : Bool :=
  decide (yen <= fineYenCap)

/-- 以下 is inclusive: exactly six months qualifies. -/
theorem six_months_inclusive : withinImprisonmentCeiling 6 = true := by
  unfold withinImprisonmentCeiling imprisonmentMonthsCap
  decide

/-- Seven months exceeds the imprisonment ceiling. -/
theorem seven_months_false : withinImprisonmentCeiling 7 = false := by
  unfold withinImprisonmentCeiling imprisonmentMonthsCap
  decide

/-- 以下 is inclusive: exactly 500,000 yen qualifies. -/
theorem five_hundred_thousand_inclusive : withinFineCeiling 500000 = true := by
  unfold withinFineCeiling fineYenCap
  decide

/-- 500,001 yen exceeds the fine ceiling. -/
theorem over_fine_false : withinFineCeiling 500001 = false := by
  unfold withinFineCeiling fineYenCap
  decide

end JapanTaxLaw.PenaltyCeilingsSixMonthsFiveHundredThousand
