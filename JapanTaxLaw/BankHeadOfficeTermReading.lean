import JapanTaxLaw.TaxFinance

/-
# BankHeadOfficeTermReading — 電子情報処理組織特例省令 第十一条第四項（読替え）

Pinned source:
  Law id: 403M50000040054
  Official title: 電子情報処理組織を使用して処理する場合における国税等の徴収関係事務等の取扱いの特例に関する省令
  Revision: 403M50000040054_20260924_508M60000040059
  Raw snapshot: data/raw/403M50000040054_20260924_508M60000040059.law.json
  Article: 第十一条 (art. 11), 第四項, 第二文
  Source path: LawBody[2]/MainProvision/MainProvision[11]/Article:11/Article#11/Paragraph#4/ParagraphSentence/Sentence#2
  Normative unit id: NORM|9fd94438ec86e54b93185af79c792e4d717118ed05e061a185155d2d8ac463f0

原文逐語（pinned, verbatim, READING）:
  「この場合において、同条第六項中「日本銀行統轄店」とあるのは、「所轄歳入取りまとめ店」と読み替えるものとする。」

Variable contract:
  A term is encoded as a Nat code: 0 = 日本銀行統轄店, 1 = 所轄歳入取りまとめ店,
  2+ = caller-defined terms. `readAs` maps 0 to 1 (the 読替え) and preserves
  every other term. Unit: a discrete term tag; domain: Nat.

Scope: ONLY the term substitution 「日本銀行統轄店」→「所轄歳入取りまとめ店」 in
同条第六項 is modelled. The triggering case (この場合), the operation of
第六項 itself and all other provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.BankHeadOfficeTermReading

/-- 「日本銀行統轄店」を「所轄歳入取りまとめ店」と読み替える。 -/
def readAs : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem head_office_read_as_branch : readAs 0 = 1 := rfl

theorem branch_preserved : readAs 1 = 1 := rfl

theorem other_preserved : readAs 2 = 2 := rfl

theorem idempotent (c : Nat) : readAs (readAs c) = readAs c := by
  cases c <;> rfl

end JapanTaxLaw.BankHeadOfficeTermReading
