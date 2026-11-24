import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffSupplArt1UnclosEnforcementDate — REFERENCE

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|6290b6ac5ca7107ae51c4755153893adb988f06112ac7e94716dd00aba840ebb
  Source path: LawBody[59]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「この法律は、国連海洋法条約が日本国について効力を生ずる日から施行する。」

Norm kind: REFERENCE — a temporal-application clause that fixes the enforcement
date relatively: the Act comes into force on the day 国連海洋法条約 takes effect for
Japan (効力を生ずる日). The computable slice models the trigger-based in-force
predicate: the Act is in force only after the treaty has taken effect for Japan
and the date is on/after that effective date. All statutory terms below are
reproduced programmatically from the verbatim needle; the canonical quote is
byte-verbatim.

Variable contract (meaning / domain / type):
  treatyEffective : Bool — whether 国連海洋法条約 has taken effect for Japan (caller-established).
  onOrAfterEffectiveDate : Bool — whether the date is on/after 効力を生ずる日 (caller-established).
  inForce : Bool -> Bool -> Bool — treatyEffective && onOrAfterEffectiveDate.
  No calendar date is fixed by the statute (relative date); no numeric amount/unit.

Scope: only the trigger-based in-force condition. The actual calendar date, the
treaty's substantive content, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1UnclosEnforcementDate

/-- 当該条約が日本国について効力を生ずる日から施行する: trigger-based in-force. -/
def inForce (treatyEffective onOrAfterEffectiveDate : Bool) : Bool :=
  treatyEffective && onOrAfterEffectiveDate

/-- In force once the treaty has taken effect and the date is on/after it. -/
theorem in_force_after_trigger : inForce true true = true := rfl

/-- Not in force before the treaty takes effect. -/
theorem not_in_force_before_trigger : inForce false true = false := rfl

/-- Not in force before the effective date. -/
theorem not_in_force_before_date : inForce true false = false := rfl

end JapanTaxLaw.CustomsTariffSupplArt1UnclosEnforcementDate
