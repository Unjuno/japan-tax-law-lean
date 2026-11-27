import JapanTaxLaw.TaxFinance

/-
# InheritanceTax42SnowSurveyOver6Months — pinned clause 「第二項の規定により、税務署長が、同項の調査を行う場合において、積雪その他これに準ずる事由により当該調査に六月を超える期間を要すると認めるときにおける前項の規定の適用については、同項中「六月」とあるのは、「九月」とする。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 42, paragraph 17.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|721c4e58fb684025cc0465e3fba349bb869a1d6ad1a369aed6fc13bd4159f9e2.
Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:42/Article#42/Paragraph#17/ParagraphSentence/Sentence#1.
原文逐語: 「第二項の規定により、税務署長が、同項の調査を行う場合において、積雪その他これに準ずる事由により当該調査に六月を超える期間を要すると認めるときにおける前項の規定の適用については、同項中「六月」とあるのは、「九月」とする。」
Scope: ONLY the 積雪その他これに準ずる事由により当該調査に六月を超える期間を要すると認めるとき (months > 6) STRICT lower bound for applying 前項 in this special case. 同項中「六月」を「九月」とする書換え・第二項の調査手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax42SnowSurveyOver6Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (6), STRICT lower bound. -/
def threshold : Nat := 6

/-- 「第二項の規定により、税務署長が、同項の調査を行う場合において、積雪その他これに準ずる事由により当該調査に六月を超える期間を要すると認めるときにおける前項の規定の適用については、同項中「六月」とあるのは、「九月」とする。」. -/
def inScope (months : Nat) : Prop := threshold < months

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (6 < months)

end JapanTaxLaw.InheritanceTax42SnowSurveyOver6Months
