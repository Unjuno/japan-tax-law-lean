import JapanTaxLaw.DisasterTaxReliefArt9VehicleNumberReferenceSpec

/-!
# DisasterTaxReliefArt9VehicleNumberReferenceTests — kernel-checked checks

Verifies REFERENCE 「自動車重量税法第二条第一項第三号に規定する車両番号の指定をいう。」: resolved cross-law identity (name/id/article/version).
-/

namespace JapanTaxLaw.DisasterTaxReliefArt9VehicleNumberReference

example : definitionReference.lawId = "346AC0000000089" := law_id_resolved
example : definitionReference.lawName = "\u81ea\u52d5\u8eca\u91cd\u91cf\u7a0e\u6cd5" := law_name_resolved
example : definitionReference.article = "\u7b2c\u4e8c\u6761" := article_resolved
example : definitionReference.enforcementVersion = "2022-04-01" := version_resolved
example : SpecResolvedRef definitionReference := implementation_satisfies_spec

end JapanTaxLaw.DisasterTaxReliefArt9VehicleNumberReference
