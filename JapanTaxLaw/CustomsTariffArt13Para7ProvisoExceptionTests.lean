import JapanTaxLaw.CustomsTariffArt13Para7ProvisoExceptionSpec

/-!
# CustomsTariffArt13Para7ProvisoExceptionTests — kernel-checked checks for 第十七条(5)

Verifies the EXCEPTION 「第十三条第七項ただし書の規定は、前項の規定により関税を徴収する場合について準用する。」: 第十三条第七項ただし書 (article 13, paragraph
7, proviso) read in only for the preceding-paragraph duty-collection case.
-/

namespace JapanTaxLaw.CustomsTariffArt13Para7ProvisoException

example : sourceArticle = 13 := source_article_is_13
example : sourceParagraph = 7 := source_paragraph_is_7
example : sourceIsProviso = true := source_is_proviso
example : withinException CollectionCase.prevParaCollection = true := applies_to_prev_collection
example : withinException CollectionCase.other = false := not_applies_to_other
example (c : CollectionCase) : (withinException c = true) ↔ SpecWithinException c :=
  agree_within_exception c

end JapanTaxLaw.CustomsTariffArt13Para7ProvisoException
