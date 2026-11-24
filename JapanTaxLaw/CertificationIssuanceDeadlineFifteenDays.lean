import JapanTaxLaw.TaxFinance

/-
# CertificationIssuanceDeadlineFifteenDays — 特定国等証明書発給省令 第二条第四項（十五日以内）

Pinned source:
  Law id: 508M60000400060
  Official title: ニッケル系ステンレス冷延鋼帯及び冷延鋼板に対して課する不当廉売関税に関する政令第一条第三項に規定する特定国等において熱延鋼帯について冷間圧延をする工程を経て製造されていない旨の証明書の発給に関する省令
  Law type: MinisterialOrdinance (省令)
  Revision: 508M60000400060_20261031_508M60000400078
  Raw snapshot: data/raw/508M60000400060_20261031_508M60000400078.law.json
  sha256: b6e8cafa58a7ad7abefdaae2ae12dfb072104c3e69a18956fcf8759e35e9a901
  Statutory article: 第二条 (art. 2), 第四項 (4)
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/
               Paragraph#4/ParagraphSentence/Sentence#1
  Normative unit id: NORM|e3f96720f013bcbb5689c22af36d821a4342cd90bcb9a667f1bd983a7e93bbe1

原文逐語（pinned, 一字一句改変なし, REFERENCE, verbatim-unique in whole law）:
  「第一項の規定による証明書の交付は、交付申請を経済産業大臣が受理した日から十五日以内にするものとする。」

Variable contract:
  `issuanceDeadlineDays : Nat := 15` = 十五日 (inclusive upper bound: 以内).
  `withinIssuanceDeadline (days : Nat) : Bool := decide (days <= issuanceDeadlineDays)`.
  Unit 日 (days, counted from the day the Minister accepts the application);
  domain Nat.

Scope: ONLY the explicit numeric deadline is modelled. The application
requirements, the accepting authority, other paragraphs and enforcement rules
are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CertificationIssuanceDeadlineFifteenDays

/-- 十五日 — inclusive issuance deadline. Unit 日; domain Nat. -/
def issuanceDeadlineDays : Nat := 15

/-- 「受理した日から十五日以内」: issuance within fifteen days. -/
def withinIssuanceDeadline (days : Nat) : Bool :=
  decide (days <= issuanceDeadlineDays)

/-- 以内 is inclusive: exactly fifteen days qualifies. -/
theorem fifteen_inclusive : withinIssuanceDeadline 15 = true := by
  unfold withinIssuanceDeadline issuanceDeadlineDays
  decide

/-- Sixteen days exceeds the deadline. -/
theorem sixteen_false : withinIssuanceDeadline 16 = false := by
  unfold withinIssuanceDeadline issuanceDeadlineDays
  decide

/-- Fourteen days qualifies. -/
theorem fourteen_true : withinIssuanceDeadline 14 = true := by
  unfold withinIssuanceDeadline issuanceDeadlineDays
  decide

end JapanTaxLaw.CertificationIssuanceDeadlineFifteenDays
