import JapanTaxLaw.TaxFinance

/-
# OkinawaDividedCertificateIssuance — 沖縄減免税割当省令 第四条第二項（分割証明書の交付）

Pinned source:
  Law id: 347M50010000033 (沖縄県の区域における製造用原料品の減免税割当制度に関する省令)
  Revision: 347M50010000033_19950401_407M50000200026
  Raw snapshot: data/raw/347M50010000033_19950401_407M50000200026.law.json
  Article: 第四条 (art. 4), 第二項
  Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence
  Normative unit id: NORM|3c61e72146aeaf0747d12de360880c43d12d5692358e64bfac73b2ae6c13f621

原文逐語（pinned, verbatim, CONDITION）:
  「沖縄県知事は、前項の申請書を受理したときは、申請に係る証明書に代えて、分割した証明書を交付するものとする。」

Variable contract:
  A case kind is a Nat code: 0 = 前項の申請書を受理したとき,
  1 = 分割した証明書を交付する (instead of the original), 2+ = caller-defined
  kinds. `asDividedCert` maps 0 to 1 and preserves every other kind.
  Unit: a discrete case tag; domain: Nat.

Scope: ONLY the case condition 「受理したときは分割した証明書を交付する」 is modelled. The previous paragraph's application requirements, the certificate contents and all other provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.OkinawaDividedCertificateIssuance

/-- 「申請書を受理したときは、分割した証明書を交付する」。 -/
def asDividedCert : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem acceptance_gives_divided_cert : asDividedCert 0 = 1 := rfl

theorem divided_unchanged : asDividedCert 1 = 1 := rfl

theorem other_unchanged : asDividedCert 2 = 2 := rfl

theorem idempotent (c : Nat) : asDividedCert (asDividedCert c) = asDividedCert c := by
  cases c <;> rfl

end JapanTaxLaw.OkinawaDividedCertificateIssuance
