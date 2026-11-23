import JapanTaxLaw.CustomsTariffArt20No2Art13ProvisoExceptionSpec

/-!
# CustomsTariffArt20No2Art13ProvisoExceptionTests — kernel-checked checks for 第二十条の二(3)

Verifies EXCEPTION 「この場合においては、第十三条第七項ただし書の規定を準用する。」: 第十三条第七項ただし書 read in for この場合 only.
-/

namespace JapanTaxLaw.CustomsTariffArt20No2Art13ProvisoException

example : sourceArticle = 13 := source_article_is_13
example : sourceParagraph = 7 := source_paragraph_is_7
example : sourceIsProviso = true := source_is_proviso
example : withinException Trigger.thisCase = true := applies_in_this_case
example : withinException Trigger.other = false := not_applies_in_other
example (tr : Trigger) : (withinException tr = true) ↔ SpecWithinException tr :=
  agree_within_exception tr

end JapanTaxLaw.CustomsTariffArt20No2Art13ProvisoException
