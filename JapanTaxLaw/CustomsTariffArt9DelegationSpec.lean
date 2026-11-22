import JapanTaxLaw.CustomsTariffArt9Delegation

/-!
# CustomsTariffArt9DelegationSpec — independent spec for 関税定率法 第九条(15)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第九条(15) — DELEGATION 「前各項に定めるもののほか、これらの規定の適用に関し必要な事項は、政令で定める。」:
         residual delegation of matters necessary for these provisions' application to 政令.
Normative unit: NORM|0487f141eafcb7225b2ec1466a95d1352b743d3d6d2c42f1a051d94cb6f14f03

The implementation is `determinedBy : Matter -> LegalSource`. The independent
spec states the same delegation as two separate propositions (which class is
NOT delegated, which class is delegated), representationally distinct from the
single-function implementation, extensionally equivalent for both constructors.
Axiom-free by exhaustive cases with rfl/cases-h — no `decide`/`simp`/`propext`.

Not modelled: actual 政令 content, other articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt9Delegation

/-- Independent spec: in-Act matters are NOT delegated to Cabinet Order. -/
def SpecInActNotDelegated (s : LegalSource) : Prop :=
  s ≠ LegalSource.cabinetOrder

/-- Independent spec: necessary application matters ARE delegated to Cabinet Order. -/
def SpecApplicationDelegated (s : LegalSource) : Prop :=
  s = LegalSource.cabinetOrder

/-- Universal agreement for the in-Act class. Axiom-free. -/
theorem agree_in_act_not_delegated :
    SpecInActNotDelegated (determinedBy Matter.inAct) := by
  intro h
  cases h

/-- Universal agreement for the necessary-application class. Axiom-free. -/
theorem agree_application_delegated :
    SpecApplicationDelegated (determinedBy Matter.necessaryForApplication) := by
  rfl

end JapanTaxLaw.CustomsTariffArt9Delegation
