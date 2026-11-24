import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefOrderArt15_6PassengerCarReference — REFERENCE

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Raw snapshot: data/raw/322CO0000000268_*.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|bf32b450dd578f2d29c8f6300ab9b5391a68134bb72afe9d30dd84a9314e8ce1
  Source path: LawBody[1]/MainProvision/MainProvision[21]/Article:15_6/Article#15_6/Paragraph#2/Item#4/Subitem1#1/Subitem1Sentence/Column#1/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「自動車重量税法第七条第二項第一号に規定する乗用自動車」

Norm kind: REFERENCE — a cross-law definitional reference: 乗用自動車 (passenger
automobile) as prescribed in 自動車重量税法 第七条第二項第一号. The queue resolves this
dependency beyond the 15-digit law id: law_name=自動車重量税法, law_id="346AC0000000089",
article=第七条 (the article prefix of the fuller needle citation),
enforcement_version=2022-04-01, resolution=resolved_by_name, sufficient=true.
The computable slice models that resolved reference identity. All statutory
terms and dependency fields are reproduced programmatically from the
authoritative queue; no hand-typed CJK.

Variable contract (meaning / domain / type):
  CrossLawRef : structure — law name, law id (15-digit), article, enforcement version (String).
  definitionReference : CrossLawRef — the resolved target of 乗用自動車.

Scope: only the resolved reference identity. The substantive definition in the
external law, the Column#2 content, and legal correctness are NOT MODELLED.
No external-law Lean constant is imported. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt15_6PassengerCarReference

/-- The resolved identity of the cross-law reference target. -/
structure CrossLawRef where
  lawName : String
  lawId : String
  article : String
  enforcementVersion : String

/-- 自動車重量税法第七条第二項第一号に規定する乗用自動車: the resolved target. -/
def definitionReference : CrossLawRef :=
  { lawName := "\u81ea\u52d5\u8eca\u91cd\u91cf\u7a0e\u6cd5",
    lawId := "346AC0000000089",
    article := "\u7b2c\u4e03\u6761",
    enforcementVersion := "2022-04-01" }

/-- The resolved law id is the pinned 15-digit law id. -/
theorem law_id_resolved : definitionReference.lawId = "346AC0000000089" := rfl

/-- The resolved law name is 自動車重量税法. -/
theorem law_name_resolved : definitionReference.lawName = "\u81ea\u52d5\u8eca\u91cd\u91cf\u7a0e\u6cd5" := rfl

/-- The resolved article is 第七条. -/
theorem article_resolved : definitionReference.article = "\u7b2c\u4e03\u6761" := rfl

/-- The resolved enforcement version is 2022-04-01. -/
theorem version_resolved : definitionReference.enforcementVersion = "2022-04-01" := rfl

end JapanTaxLaw.DisasterTaxReliefOrderArt15_6PassengerCarReference
