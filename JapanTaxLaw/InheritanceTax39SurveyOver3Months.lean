import JapanTaxLaw.TaxFinance

/-
# InheritanceTax39SurveyOver3Months — pinned clause 「第二項の規定により、税務署長が、同項の調査を行う場合において、当該調査に三月を超える期間を要すると認めるときにおける同項の規定の適用については、同項中「三月」とあるのは、「六月」とする。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 39, paragraph 23.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|8b6ad2301459e101007e7cb127a3db0a668a9c19709eeacf3a13097a06a6d348.
Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:39/Article#39/Paragraph#23/ParagraphSentence/Sentence#1.
原文逐語: 「第二項の規定により、税務署長が、同項の調査を行う場合において、当該調査に三月を超える期間を要すると認めるときにおける同項の規定の適用については、同項中「三月」とあるのは、「六月」とする。」
Scope: ONLY the 当該調査に三月を超える期間を要すると認めるとき (months > 3) STRICT lower bound for applying 第二項 in this special case. 同項中「三月」を「六月」とする書換え・第二項の調査手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax39SurveyOver3Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), STRICT lower bound. -/
def threshold : Nat := 3

/-- 「第二項の規定により、税務署長が、同項の調査を行う場合において、当該調査に三月を超える期間を要すると認めるときにおける同項の規定の適用については、同項中「三月」とあるのは、「六月」とする。」. -/
def inScope (months : Nat) : Prop := threshold < months

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (3 < months)

end JapanTaxLaw.InheritanceTax39SurveyOver3Months
