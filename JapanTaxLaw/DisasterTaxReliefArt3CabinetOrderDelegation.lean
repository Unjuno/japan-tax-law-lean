import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefArt3CabinetOrderDelegation — DELEGATION

Pinned source:
  Law id: 322AC0000000175
  Official title: 昭和二十二年法律第百七十五号（災害被害者に対する租税の減免、徴収猶予等に関する法律）
  Law number: 昭和二十二年法律第百七十五号
  Law type: Act (法律)
  Raw snapshot: data/raw/322AC0000000175_*.law.json
  sha256: c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef
  Normative unit id: NORM|461a25ff05dbe9b4341873be8a70db1f63f9c3199c5e93c95068a9ac567e4db7
  Source path: LawBody[1]/MainProvision/MainProvision[2]/Article:3/Article#3/
               Paragraph#8/ParagraphSentence/Sentence#1
  Article caption: (none)

原文逐語（pinned, 一字一句改変なし）:
  「前項に定めるもののほか、第一項から第六項までの規定の適用に関し必要な事項は、政令で定める。」

Norm kind: DELEGATION — matters necessary for applying paragraphs 1 to 6
(in addition to those in the preceding paragraph) are prescribed by 政令
(Cabinet Order). The computable slice models the delegating authority, the
source paragraph range (1..6) and the preceding-paragraph supplement.
All statutory facts extracted structurally from the needle; no hand-typed CJK.

Variable contract (meaning / domain / type):
  Authority : Type — act | cabinetOrder | ministerialOrdinance.
  prescriptionAuthority : Authority — the source prescribing the matters.
  sourceParagraphLo/Hi : Nat — 1 and 6 (paragraph range from needle).
  supplementsPrevParagraph : Bool — true (前項に定めるもののほか).
  No numeric amount/unit applies (structural DELEGATION, not a formula).

Scope: only the delegating structure. The ordinance content, the substantive
application of paragraphs 1..6, and legal correctness are NOT MODELLED.
Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt3CabinetOrderDelegation

/-- The legal source prescribing the matters. -/
inductive Authority : Type
  | act : Authority
  | cabinetOrder : Authority
  | ministerialOrdinance : Authority

deriving instance DecidableEq for Authority

/-- 政令で定める: prescribed by Cabinet Order. -/
def prescriptionAuthority : Authority := Authority.cabinetOrder

/-- Lower bound of the source paragraph range (第一項). -/
def sourceParagraphLo : Nat := 1

/-- Upper bound of the source paragraph range (第六項). -/
def sourceParagraphHi : Nat := 6

/-- The delegation supplements the preceding paragraph (前項に定めるもののほか). -/
def supplementsPrevParagraph : Bool := true

/-- The prescription authority is the Cabinet Order. -/
theorem authority_is_cabinet_order : prescriptionAuthority = Authority.cabinetOrder := rfl

/-- It is not the Act itself. -/
theorem authority_not_act : prescriptionAuthority ≠ Authority.act := by decide

/-- It is not a ministerial ordinance. -/
theorem authority_not_ministerial : prescriptionAuthority ≠ Authority.ministerialOrdinance := by decide

/-- The source paragraph range is 1 to 6. -/
theorem source_range : sourceParagraphLo = 1 ∧ sourceParagraphHi = 6 := ⟨rfl, rfl⟩

end JapanTaxLaw.DisasterTaxReliefArt3CabinetOrderDelegation
