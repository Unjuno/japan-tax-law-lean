import JapanTaxLaw.TaxFinance

/-
# ApprovalRevocationSameTreatment — 石油ガス税法施行規則 第一条第五項（承認取消しの場合も同様）

Pinned source:
  Law id: 341M50000040004 (石油ガス税法施行規則)
  Revision: 341M50000040004_20250401_507M60000040023
  Raw snapshot: data/raw/341M50000040004_20250401_507M60000040023.law.json
  Article: 第一条 (art. 1), 第五項, 第二文
  Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#5/ParagraphSentence/Sentence#2
  Normative unit id: NORM|09558050800729550f1385a32bc0699eeacdd49be6ba2cfee74c9a19c9c1c617

原文逐語（pinned, verbatim, CONDITION）:
  「その承認を取り消す場合も、また同様とする。」

Variable contract:
  A case kind is a Nat code: 0 = 承認を取り消す場合, 1 = 前段と同様の取扱い,
  2+ = caller-defined kinds. `asSameTreatment` maps 0 to 1 (取消しの場合も前段と
  同様とする) and preserves every other kind. Unit: a discrete case tag; domain: Nat.

Scope: ONLY the case-extending condition 「承認を取り消す場合も、また同様とする」 is modelled. The preceding sentence's rule, the approval procedure and all other provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.ApprovalRevocationSameTreatment

/-- 「承認を取り消す場合も、また同様とする」。 -/
def asSameTreatment : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem revocation_gets_same_treatment : asSameTreatment 0 = 1 := rfl

theorem same_unchanged : asSameTreatment 1 = 1 := rfl

theorem other_unchanged : asSameTreatment 2 = 2 := rfl

theorem idempotent (c : Nat) : asSameTreatment (asSameTreatment c) = asSameTreatment c := by
  cases c <;> rfl

end JapanTaxLaw.ApprovalRevocationSameTreatment
