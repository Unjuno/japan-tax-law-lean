import JapanTaxLaw.DisasterTaxReliefOrderArt15_6PassengerCarReferenceSpec

/-!
# DisasterTaxReliefOrderArt15_6PassengerCarReferenceTests — kernel-checked checks

Verifies REFERENCE 「自動車重量税法第七条第二項第一号に規定する乗用自動車」: resolved cross-law identity (name/id/article/version).
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt15_6PassengerCarReference

example : definitionReference.lawId = "346AC0000000089" := law_id_resolved
example : definitionReference.lawName = "\u81ea\u52d5\u8eca\u91cd\u91cf\u7a0e\u6cd5" := law_name_resolved
example : definitionReference.article = "\u7b2c\u4e03\u6761" := article_resolved
example : definitionReference.enforcementVersion = "2022-04-01" := version_resolved
example : SpecResolvedRef definitionReference := implementation_satisfies_spec

end JapanTaxLaw.DisasterTaxReliefOrderArt15_6PassengerCarReference
