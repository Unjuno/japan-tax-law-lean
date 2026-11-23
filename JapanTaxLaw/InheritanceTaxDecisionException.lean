import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxDecisionException — EXCEPTION

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|a272ba5227e609d49ff344bf1f6a7aee167ba66f8fba72b65dc48fca6e30bb39
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/
               Paragraph#1/Item#6/ItemSentence/Column#2/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「第三十三条の二の場合を除き、国税通則法第二十五条（決定）の規定による決定をいう。」

Norm kind: EXCEPTION — this definition clause (定義) defines "決定" by reference
to 国税通則法第25条, EXCLUDING the case of 第33条の二. The computable slice
models the carve-out: the decision concept applies outside the excepted case.
Both cross-law dependencies (law 国税通則法, articles 33-2 and 25) are
resolved by name with enforcement version in the queue. Structural facts extracted
from the needle; no hand-typed CJK.

Variable contract (meaning / domain / type):
  CaseKind : Type — exceptedCase (第33条の二の場合) or other.
  isDecision : CaseKind -> Bool — false for the excepted case, true otherwise.
  referencedArticle : Nat — 25 (国税通則法第二十五条, 決定).
  exceptedArticle : Nat — 33 (第三十三条の二).
  No numeric amount/unit applies (structural EXCEPTION, not a formula).

Scope: only the carve-out structure and the referenced article numbers. The
substantive content of 国税通則法第25条/第33条の二 and legal correctness
are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxDecisionException

/-- The case kind: the excepted 第33条の二 case, or other. -/
inductive CaseKind : Type
  | exceptedCase : CaseKind
  | other : CaseKind

/-- The carve-out: "決定" applies except in the excepted case. -/
def isDecision (c : CaseKind) : Bool :=
  match c with
  | CaseKind.exceptedCase => false
  | CaseKind.other => true

/-- Referenced article in 国税通則法 (決定). -/
def referencedArticle : Nat := 25

/-- Excepted article in 国税通則法 (第三十三条の二). -/
def exceptedArticle : Nat := 33

/-- The referenced article is 25. -/
theorem referenced_article_is_25 : referencedArticle = 25 := rfl

/-- The excepted article is 33-2. -/
theorem excepted_article_is_33 : exceptedArticle = 33 := rfl

/-- The decision concept is excluded in the excepted case. -/
theorem excepted_not_decision : isDecision CaseKind.exceptedCase = false := rfl

/-- The decision concept applies in other cases. -/
theorem other_is_decision : isDecision CaseKind.other = true := rfl

end JapanTaxLaw.InheritanceTaxDecisionException
