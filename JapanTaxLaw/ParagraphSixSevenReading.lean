import JapanTaxLaw.TaxFinance

/-
# ParagraphSixSevenReading — たばこ税法改正政令整備政令 第三条（第六項・第七項の準用）

Pinned source:
  Law id: 422CO0000000060
  Revision: 422CO0000000060_20101001_000000000000000
  Raw snapshot: data/raw/422CO0000000060_20101001_000000000000000.law.json
  Article: 第三条 (art. 3), 第九項 (reading sentence)
  Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:3/Article#3/Paragraph#9/ParagraphSentence/Sentence#1
  Normative unit id: NORM|3b374d46b3620530b433d1c8d12e627f7d2327139e6f3f92e7209a4c140854a5

原文逐語（pinned, verbatim, READING）:
  「第六項及び第七項の規定は、前項の場合について準用する。」

Variable contract:
  A paragraph label is encoded as a Nat code: 0 = 第六項, 1 = 第七項,
  2+ = caller-defined labels. `asListed` returns 1 (listed for 準用) for
  codes 0 and 1, and 0 otherwise. Unit: a discrete paragraph tag; domain: Nat.

Scope: ONLY the selection of 第六項 and 第七項 for mutatis-mutandis application
is modelled. The content of those paragraphs and the triggering case are NOT
MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.ParagraphSixSevenReading

/-- 「第六項及び第七項の規定は、前項の場合について準用する」。 -/
def asListed : Nat → Nat
  | 0 => 1
  | 1 => 1
  | Nat.succ (Nat.succ _) => 0

theorem sixth_listed : asListed 0 = 1 := rfl

theorem seventh_listed : asListed 1 = 1 := rfl

theorem other_not_listed : asListed 2 = 0 := rfl

end JapanTaxLaw.ParagraphSixSevenReading
