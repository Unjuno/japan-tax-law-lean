import JapanTaxLaw.TaxFinance

/-
# InheritanceTax27JointReturnTwoOrMore — pinned clause 「同一の被相続人から相続又は遺贈により財産を取得した者又はその者の相続人で第一項、第二項（次条第二項において準用する場合を含む。）又は第三項の規定により申告書を提出すべきもの又は提出することができるものが二人以上ある場合において、当該申告書の提出先の税務署長が同一であるときは、これらの者は、政令で定めるところにより、当該申告書を共同して提出することができる。」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 27, paragraph 5.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|b57c14ffe5e08ed7df8104720224b0e391927073925885c5261e22abfae0372f.
Source path: LawBody[3]/MainProvision/MainProvision[3]/Article:27/Article#27/Paragraph#5/ParagraphSentence/Sentence#1.
原文逐語: 「同一の被相続人から相続又は遺贈により財産を取得した者又はその者の相続人で第一項、第二項（次条第二項において準用する場合を含む。）又は第三項の規定により申告書を提出すべきもの又は提出することができるものが二人以上ある場合において、当該申告書の提出先の税務署長が同一であるときは、これらの者は、政令で定めるところにより、当該申告書を共同して提出することができる。」
Scope: ONLY the 申告書を提出すべき者が二人以上 (persons ≥ 2) INCLUSIVE lower bound for the 共同申告 with the same 税務署長. 第一項・第二項・第三項の申告書提出者の範囲・政令の定め・共同申告の効果・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax27JointReturnTwoOrMore

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「同一の被相続人から相続又は遺贈により財産を取得した者又はその者の相続人で第一項、第二項（次条第二項において準用する場合を含む。）又は第三項の規定により申告書を提出すべきもの又は提出することができるものが二人以上ある場合において、当該申告書の提出先の税務署長が同一であるときは、これらの者は、政令で定めるところにより、当該申告書を共同して提出することができる。」. -/
def inScope (persons : Nat) : Prop := threshold ≤ persons

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (persons : Nat) : Bool := decide (2 ≤ persons)

end JapanTaxLaw.InheritanceTax27JointReturnTwoOrMore
