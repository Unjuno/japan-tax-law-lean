import JapanTaxLaw.TaxFinance

/-
# CustomsTerritoryCountryInclusion — 経済連携協定緊急措置政令 第二条第一項第一号（地域の「国」包含）

Pinned source:
  Law id: 414CO0000000116 (経済連携協定に基づく関税の緊急措置に関する政令)
  Revision: 414CO0000000116_20181230_429CO0000000006
  Raw snapshot: data/raw/414CO0000000116_20181230_429CO0000000006.law.json
  Article: 第二条 (art. 2), 第一項, 第一号
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/Paragraph#1/Item#1/ItemSentence/Sentence#1
  Normative unit id: NORM|e0b9627e8d1b6301081a5fa5f27500c0119196700f23f9775c514dce0ab9034d

原文逐語（pinned, verbatim, CONDITION）:
  「当該調査の対象となる国（固有の関税及び貿易に関する制度を有する地域を含む。以下同じ。）」

Variable contract:
  An entity code is a Nat: 0 = 固有の関税及び貿易に関する制度を有する地域,
  1 = 調査対象となる国として扱う, 2+ = caller-defined entities. `asCountry`
  maps 0 to 1 (such a territory is included in 「国」) and preserves others.
  Unit: a discrete entity tag; domain: Nat.

Scope: ONLY the inclusion 「固有の関税及び貿易に関する制度を有する地域を含む」 is modelled. The investigation procedure, the agreement itself and all other provisions are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `omega`, `simp` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTerritoryCountryInclusion

/-- 「固有の関税及び貿易に関する制度を有する地域を含む」。 -/
def asCountry : Nat → Nat
  | 0 => 1
  | n + 1 => n + 1

theorem territory_included_as_country : asCountry 0 = 1 := rfl

theorem country_unchanged : asCountry 1 = 1 := rfl

theorem other_unchanged : asCountry 2 = 2 := rfl

theorem idempotent (c : Nat) : asCountry (asCountry c) = asCountry c := by
  cases c <;> rfl

end JapanTaxLaw.CustomsTerritoryCountryInclusion
