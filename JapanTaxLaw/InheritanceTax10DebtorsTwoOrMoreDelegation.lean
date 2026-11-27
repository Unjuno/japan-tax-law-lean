import JapanTaxLaw.TaxFinance

/-
# InheritanceTax10DebtorsTwoOrMoreDelegation — pinned clause 「貸付金債権については、その債務者（債務者が二以上ある場合においては、主たる債務者とし、主たる債務者がないときは政令で定める一の債務者）の住所又は本店若しくは主たる事務所の所在」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 10, paragraph 1, item 7.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|9a128f02927adc92c51413534f9ae96a2edbdcc05ec84c5156d3e6f52d732a11.
Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:10/Article#10/Paragraph#1/Item#7/ItemSentence/Sentence#1.
原文逐語: 「貸付金債権については、その債務者（債務者が二以上ある場合においては、主たる債務者とし、主たる債務者がないときは政令で定める一の債務者）の住所又は本店若しくは主たる事務所の所在」
Scope: ONLY the 貸付金債権の債務者が二以上 (debtors ≥ 2) threshold. 主たる債務者として誰を扱うかの特定, 政令で定める一の債務者, 住所・本店・主たる事務所の所在, 他の号, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax10DebtorsTwoOrMoreDelegation

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「貸付金債権については、その債務者（債務者が二以上ある場合においては、主たる債務者とし、主たる債務者がないときは政令で定める一の債務者）の住所又は本店若しくは主たる事務所の所在」. -/
def inScope (debtors : Nat) : Prop := threshold ≤ debtors

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (debtors : Nat) : Bool := decide (2 ≤ debtors)

end JapanTaxLaw.InheritanceTax10DebtorsTwoOrMoreDelegation
