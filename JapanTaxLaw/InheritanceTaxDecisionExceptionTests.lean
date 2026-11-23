import JapanTaxLaw.InheritanceTaxDecisionExceptionSpec

/-!
# InheritanceTaxDecisionExceptionTests — kernel-checked checks

Verifies EXCEPTION 「第三十三条の二の場合を除き、国税通則法第二十五条（決定）の規定による決定をいう。」: carve-out for 第三十三条の二, 国税通則法 art.25.
-/

namespace JapanTaxLaw.InheritanceTaxDecisionException

example : referencedArticle = 25 := referenced_article_is_25
example : exceptedArticle = 33 := excepted_article_is_33
example : isDecision CaseKind.exceptedCase = false := excepted_not_decision
example : isDecision CaseKind.other = true := other_is_decision
example (h : isDecision CaseKind.other = true) :
    SpecDecision CaseKind.other referencedArticle exceptedArticle :=
  implementation_satisfies_spec CaseKind.other h

end JapanTaxLaw.InheritanceTaxDecisionException
