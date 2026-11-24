import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefArt9VehicleNumberReference — REFERENCE

Pinned source:
  Law id: 322AC0000000175
  Official title: 昭和二十二年法律第百七十五号（災害被害者に対する租税の減免、徴収猶予等に関する法律）
  Law number: 昭和二十二年法律第百七十五号
  Law type: Act (法律)
  Raw snapshot: data/raw/322AC0000000175_*.law.json
  sha256: c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef
  Normative unit id: NORM|5bbe8f54b0c419b7fc98b824f274be232c9427117dac9d087a1d1e143eea7575
  Source path: LawBody[1]/MainProvision/MainProvision[8]/Article:9/Article#9/Paragraph#2/Item#3/ItemSentence/Column#2/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「自動車重量税法第二条第一項第三号に規定する車両番号の指定をいう。」

Norm kind: REFERENCE — a cross-law definitional reference: 車両番号の指定 (the vehicle
number designation) means that prescribed in 自動車重量税法 第二条第一項第三号. The queue
resolves this dependency beyond the 15-digit law id: law_name=自動車重量税法,
law_id="346AC0000000089", article=第二条, enforcement_version=2022-04-01,
resolution=resolved_by_name, sufficient=true. The computable slice models that
resolved reference identity. All statutory terms and dependency fields are
reproduced programmatically from the authoritative queue; no hand-typed CJK.

Variable contract (meaning / domain / type):
  CrossLawRef : structure — law name, law id (15-digit), article, enforcement version (String).
  definitionReference : CrossLawRef — the resolved target of 車両番号の指定.
  No numeric amount/unit applies (structural reference identity).

Scope: only the resolved reference identity. The substantive definition in the
external law and legal correctness are NOT MODELLED. No external-law Lean constant
is imported. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt9VehicleNumberReference

/-- The resolved identity of the cross-law reference target. -/
structure CrossLawRef where
  lawName : String
  lawId : String
  article : String
  enforcementVersion : String

/-- 自動車重量税法第二条第一項第三号に規定する車両番号の指定: the resolved target. -/
def definitionReference : CrossLawRef :=
  { lawName := "\u81ea\u52d5\u8eca\u91cd\u91cf\u7a0e\u6cd5",
    lawId := "346AC0000000089",
    article := "\u7b2c\u4e8c\u6761",
    enforcementVersion := "2022-04-01" }

/-- The resolved law id is the pinned 15-digit law id. -/
theorem law_id_resolved : definitionReference.lawId = "346AC0000000089" := rfl

/-- The resolved law name is 自動車重量税法. -/
theorem law_name_resolved : definitionReference.lawName = "\u81ea\u52d5\u8eca\u91cd\u91cf\u7a0e\u6cd5" := rfl

/-- The resolved article is 第二条. -/
theorem article_resolved : definitionReference.article = "\u7b2c\u4e8c\u6761" := rfl

/-- The resolved enforcement version is 2022-04-01. -/
theorem version_resolved : definitionReference.enforcementVersion = "2022-04-01" := rfl

end JapanTaxLaw.DisasterTaxReliefArt9VehicleNumberReference
