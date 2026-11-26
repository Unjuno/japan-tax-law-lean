import JapanTaxLaw.TaxFinance

/-
# ApplicationChangeSameTreatment — 相互防衛援助協定臨時特例法施行令 第四条第一項（変更時も同様）

Pinned source:
  Law id: 329CO0000000103
  Revision: 329CO0000000103_20250401_507CO0000000006
  Raw snapshot: data/raw/329CO0000000103_20250401_507CO0000000006.law.json
  Article: 第四条 (art. 4), 第一項, 第二文
  Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#1/ParagraphSentence/Sentence#2
  Normative unit id: NORM|df91b6eeec113081b40d8e33fb133b7e3742721e266f430dbcdc8292415ea617

原文逐語（pinned, verbatim, CONDITION）:
  「当該申請書に係る申請の内容を変更しようとする場合も、また同様とする。」

Variable contract:
  A case kind is a Nat code: 0 = 申請内容を変更しようとする場合,
  1 = 前項と同様の取扱い, 2+ = caller-defined kinds. `asSameTreatment`
  maps 0 to 1 (変更の場合も前項と同様とする) and preserves every other kind.
  Unit: a discrete case tag; domain: Nat.

Scope: ONLY the case-extending condition 「変更しようとする場合も、また同様とする」 is modelled. The content of 前項, the application procedure and all other provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.ApplicationChangeSameTreatment

/-- 「申請内容を変更しようとする場合も、また同様とする」。 -/
def asSameTreatment : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem change_gets_same_treatment : asSameTreatment 0 = 1 := rfl

theorem same_unchanged : asSameTreatment 1 = 1 := rfl

theorem other_unchanged : asSameTreatment 2 = 2 := rfl

theorem idempotent (c : Nat) : asSameTreatment (asSameTreatment c) = asSameTreatment c := by
  cases c <;> rfl

end JapanTaxLaw.ApplicationChangeSameTreatment
