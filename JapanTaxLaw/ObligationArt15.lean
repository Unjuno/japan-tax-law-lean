import JapanTaxLaw.TaxGeneral

/-!
# ObligationArt15 — 国税通則法（国税の通則に関する法律）第15条（納税義務の成立及びその納付すべき税額の確定）

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Law id: 337AC0000000066（昭和三十七年法律第六十六号）
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)
Raw snapshot sha256: 6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE

Act art. 15, verbatim (pinned):
  第一項: 国税を納付する義務（源泉徴収等による国税については、これを徴収して国に納付する
  義務。以下「納税義務」という。）が成立する場合には、その成立と同時に特別の手続を要
  しないで納付すべき税額が確定する国税を除き、国税に関する法律の定める手続により、
  その国税についての納付すべき税額が確定されるものとする。
  第二項: 納税義務は、次の各号に掲げる国税（第一号から第十三号までにおいて、附帯税を
  除く。）については、当該各号に定める時（当該国税のうち政令で定めるものについては、
  政令で定める時）に成立する。
  第三項: 納税義務の成立と同時に特別の手続を要しないで納付すべき税額が確定する国税は、
  次に掲げる国税とする。（一 予定納税に係る所得税 … 七 延滞税及び利子税 に列挙）

Scope (AAA-pattern, respectful of the mission's "limited to what is formalized" discipline):
* Maps the 22-kind `TaxKind` universe of `TaxGeneral.lean` (Act art. 2 items 1–4 scope) to
  the Act art. 15 establishment events. Maps exactly: not more, not less honestly.
* Mappings:
    withholdingIncomeTax → art15ii_timeOfIncomePayment （源泉徴収をすべき所得の支払の時）
    consumptionTaxBut? — full 消費税等列挙 → art15vii_timeOfSupplyOrRemoval
    underDeclarationTax  → art15xiv_expiryOfFilingDeadline
    nonDeclarationTax    → art15xiv_expiryOfFilingDeadline
    nonPaymentTax        → art15xv_expiryOfPaymentDeadline
    latePaymentTax       → art15para3vii_noSpecialProcedure
    interestTax          → art15para3vii_noSpecialProcedure
* Everything else is mapped to `.unsupported` and is documented below as out of scope:
  we do NOT pretend that Act art. 15 lists e.g. 所得税法法人税法のうち Act art. 2(3)
  以外の税目, and we do NOT infer
  (i) time events for 1号所得税， 3号法人税 and other taxes not inside the closed
      TaxKind universe — those are `unsupported` for this module, not `.unknown`.
* The "政令で定めるもの" sub-branch (ministerial delegated establishment time) is NOT
  modeled.

Axiom discipline: all theorems are proved by `cases`/`decide` over
DecidableEq/inductive instances. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

/-- Act art. 15 establishment events for the tax kinds we formally model. -/
inductive EstablishmentEventKind where
  /-- art. 15(2)(ii) — 源泉徴収による所得税： 所得の支払の時 -/
  | timeOfIncomePayment
  /-- art. 15(2)(vii) — 消費税等： 課税資産の譲渡等若しくは特定課税仕入れをした時
      又は課税物件の製造場からの移出若しくは保税地域からの引取りの時 -/
  | timeOfSupplyOrRemoval
  /-- art. 15(2)(xiv) — 過少申告加算税・無申告加算税（及び重加算税のうち第一項又は
      第二項に係る部分。当該混合が「当該国税のうち政令で定めるもの」に該当するか否かは切り分けていない）：
      法定申告期限の経過の時 -/
  | timeOfExpiryOfFilingDeadline
  /-- art. 15(2)(xv) — 不納付加算税（及び重加算税のうち第三項に係る部分）：
      法定納期限の経過の時 -/
  | timeOfExpiryOfPaymentDeadline
  /-- art. 15(3)(vii) — 延滞税及び利子税： 納税義務の成立と同時に特別の手続を要しないで
      納付すべき税額が確定する -/
  | noSpecialProcedureNeeded
  /-- 本モデルでカバーされていない税目・分岐。unsupported ≠ unknown。 -/
  | unsupported
  deriving DecidableEq, Repr

/-- The art. 2 enumerated kinds list (item 3). -/
def consumptionAndEtcKinds : List TaxKind :=
  [.consumptionTax, .liquorTax, .tobaccoTax, .gasolineTax,
   .localGasolineTax, .petroleumGasTax, .petroleumAndCoalTax]

/-- Act art. 15 mapping for the closed `TaxKind` universe. -/
def establishmentEvent (k : TaxKind) : EstablishmentEventKind :=
  match k with
  | .withholdingIncomeTax => .timeOfIncomePayment
  | .consumptionTax | .liquorTax | .tobaccoTax | .gasolineTax
  | .localGasolineTax | .petroleumGasTax | .petroleumAndCoalTax => .timeOfSupplyOrRemoval
  | .underDeclarationTax | .nonDeclarationTax => .timeOfExpiryOfFilingDeadline
  | .nonPaymentTax => .timeOfExpiryOfPaymentDeadline
  | .latePaymentTax | .interestTax => .noSpecialProcedureNeeded
  | .customsDuty | .tonZei | .specialTonZei | .forestEnvironmentZei | .specialCorporateBizZei => .unsupported
  | .internationalTourismSpecialCollZei => .unsupported  -- 国際観光旅客税のうち特別徴収による分は art. 15(3)(ii); art. 2(2) の分類は第15条では timeOfIncomePayment に該当するが、源泉徴収による所得税の時間と同一と断定しないため unsupported
  | .heavyAdditionalTax => .unsupported  -- 第68条（重加算税）のどの部分に該当するかは形式化していないため unsupported
  | .otherNationalTax => .unsupported

/-- Every consumption-and-etc-listed kind maps to the supply/removal event. -/
theorem consumption_etc_mapped :
    ∀ k : TaxKind, k ∈ consumptionAndEtcKinds → establishmentEvent k = .timeOfSupplyOrRemoval := by
  intro k h
  simp [consumptionAndEtcKinds] at h
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> rfl

/-- The non-listed 附帯税 and exclusion-listed kinds map to `unsupported`. -/
theorem excluded_or_other_unsupported :
    ∀ k : TaxKind, (k = .customsDuty ∨ k = .tonZei ∨ k = .specialTonZei ∨
                    k = .forestEnvironmentZei ∨ k = .specialCorporateBizZei ∨
                    k = .internationalTourismSpecialCollZei ∨ k = .heavyAdditionalTax ∨
                    k = .otherNationalTax) → establishmentEvent k = .unsupported := by
  intro k h
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> rfl

/-- Para 3(vii) kinds have no special procedure needed at obligation establishment. -/
theorem extension_relate_to_para3_vii :
    establishmentEvent .latePaymentTax = .noSpecialProcedureNeeded ∧
    establishmentEvent .interestTax = .noSpecialProcedureNeeded := by
  decide

/-- 過少申告加算税・無申告加算税は 法定申告期限の経過の時に成立. -/
theorem under_and_non_declaration_filing_deadline :
    establishmentEvent .underDeclarationTax = .timeOfExpiryOfFilingDeadline ∧
    establishmentEvent .nonDeclarationTax = .timeOfExpiryOfFilingDeadline := by
  decide

/-- 不納付加算税は 法定納期限の経過の時に成立. -/
theorem non_payment_payment_deadline :
    establishmentEvent .nonPaymentTax = .timeOfExpiryOfPaymentDeadline := by
  decide

/-- 源泉徴収による所得税は 所得の支払の時に成立. -/
theorem withholding_income_payment :
    establishmentEvent .withholdingIncomeTax = .timeOfIncomePayment := by
  decide

end JapanTaxLaw
