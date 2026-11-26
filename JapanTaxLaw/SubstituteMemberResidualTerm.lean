import JapanTaxLaw.TaxFinance

/-
# SubstituteMemberResidualTerm — 国税審議会令 第四条第一項ただし書（補欠委員の残任期間）

Pinned source:
  Law id: 412CO0000000278 (国税審議会令)
  Revision: 412CO0000000278_20260401_507CO0000000412
  Raw snapshot: data/raw/412CO0000000278_20260401_507CO0000000412.law.json
  Article: 第四条 (art. 4), 第一項, 第二文 (proviso)
  Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#1/ParagraphSentence/Sentence#2
  Normative unit id: NORM|cf722af4d2f2c121fe0a14ac50941eeabab052f69898d39460641b370230662e

原文逐語（pinned, verbatim, EXCEPTION）:
  「ただし、補欠の委員の任期は、前任者の残任期間とする。」

Variable contract:
  `residual : Nat` is the predecessor's remaining term, in whole years.
  Unit: 年; domain: Nat. `substituteTerm residual` is the substitute member's
  term, which equals that remaining period.

Scope: ONLY the proviso's term rule (substitute = predecessor's residual) is
modelled. The ordinary two-year term, appointment/renewal and all other
provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.SubstituteMemberResidualTerm

/-- 「補欠の委員の任期は、前任者の残任期間とする」。 -/
def substituteTerm (residual : Nat) : Nat :=
  residual

theorem term_equals_residual (residual : Nat) : substituteTerm residual = residual := rfl

theorem zero_residual : substituteTerm 0 = 0 := rfl

end JapanTaxLaw.SubstituteMemberResidualTerm
