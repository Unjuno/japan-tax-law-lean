import JapanTaxLaw.TaxFinance

/-
# DividedCertificateIssuance — とうもろこし等関税割当省令 第四条第二項（分割証明書の交付）

Pinned source:
  Law id: 340M50010000013 (とうもろこし等の関税割当制度に関する省令)
  Revision: 340M50010000013_20220401_504M60000200005
  Raw snapshot: data/raw/340M50010000013_20220401_504M60000200005.law.json
  Article: 第四条 (art. 4), 第二項, 第一文
  Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence#1
  Normative unit id: NORM|834e3b379b625233df4e9132533eabcb0a102072417003492cc995dd3282f8a8

原文逐語（pinned, verbatim, CONDITION）:
  「農林水産大臣は、前項の申請書を受理したときは、申請に係る証明書に代えて、分割した証明書を交付するものとする。」

Variable contract:
  A case kind is a Nat code: 0 = 前項の申請書を受理したとき,
  1 = 分割した証明書を交付する (instead of the original), 2+ = caller-defined
  kinds. `asDividedCert` maps 0 to 1 and preserves every other kind.
  Unit: a discrete case tag; domain: Nat.

Scope: ONLY the case condition 「申請書を受理したときは分割した証明書を交付する」 is modelled. The previous paragraph's application requirements, the certificate contents and all other provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.DividedCertificateIssuance

/-- 「申請書を受理したときは、分割した証明書を交付する」。 -/
def asDividedCert : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem acceptance_gives_divided_cert : asDividedCert 0 = 1 := rfl

theorem divided_unchanged : asDividedCert 1 = 1 := rfl

theorem other_unchanged : asDividedCert 2 = 2 := rfl

theorem idempotent (c : Nat) : asDividedCert (asDividedCert c) = asDividedCert c := by
  cases c <;> rfl

end JapanTaxLaw.DividedCertificateIssuance
