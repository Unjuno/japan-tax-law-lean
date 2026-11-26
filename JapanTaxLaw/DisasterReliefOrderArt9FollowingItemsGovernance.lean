import JapanTaxLaw.TaxFinance

/-!
# DisasterReliefOrderArt9FollowingItemsGovernance — DELEGATION

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Raw snapshot: data/raw/322CO0000000268_*.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|d0cb856a57842506990aec41a0c757458ed28f8db7c4057f954c919440bd54f0
  Source path: LawBody[1]/MainProvision/MainProvision[9]/Article:9/Article#9/Paragraph#3/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前二項の規定を適用する場合においては、次の各号の定めるところによる。」

Norm kind: DELEGATION (with CONDITION aspect) — when the preceding two
paragraphs are applied, the following items govern. The computable slice models
exactly the selection of the governing source (following items rather than an
unspecified alternative). The statutory quote above is byte-verbatim from the
pinned source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  GoverningSource : Type — followingItems, other.
  governingSource : GoverningSource — the selected governing provision source.
  No numeric amount/unit applies (structural source selection). The content of
  the following items and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterReliefOrderArt9FollowingItemsGovernance

/-- Possible sources governing the application of the preceding two paragraphs. -/
inductive GoverningSource : Type
  | followingItems : GoverningSource
  | other : GoverningSource

/-- The following items govern. -/
def governingSource : GoverningSource := GoverningSource.followingItems

/-- The selected source is the following items. -/
theorem source_is_following_items : governingSource = GoverningSource.followingItems := rfl

/-- An unspecified alternative is not selected. -/
theorem other_not_selected : governingSource ≠ GoverningSource.other := by
  unfold governingSource
  intro h
  cases h

end JapanTaxLaw.DisasterReliefOrderArt9FollowingItemsGovernance
