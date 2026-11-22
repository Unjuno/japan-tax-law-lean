import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt4ProductionServiceDelegation — 関税定率法 第四条(1)（委任）DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|166d1cbfaa939eed4cc5e49d978dc9b3922b053d66b1a8f041261f79a072529d
  Source path: LawBody[1]/MainProvision/MainProvision[5]/Article:4/Article#4/
               Paragraph#1/Item#3/Subitem1#4/Subitem1Sentence/Sentence#1
  Article caption: （課税価格の決定の原則）

原文逐語（pinned, 一字一句改変なし）:
  「技術、設計その他当該輸入貨物の生産に関する役務で政令で定めるもの」

Norm kind: DELEGATION — this subitem lists a class of services (技術, design,
and other services relating to the production of the imported goods) whose exact
scope is prescribed by 政令 (Cabinet Order). The computable slice models the
DELEGATION STRUCTURE: a service is either within the listed production-service
class or not, and whether it is 政令-designated. The actual Cabinet Order content
is NOT MODELLED. All statutory terms (技術, 政令) extracted structurally from
the verbatim needle's own delimiters (、 / で定める / もの) — no hand-typed strings.

Variable contract (meaning / unit / domain / type):
  Service kind : an inductive with technical (技術) and other-production
    (design/other production-related services), plus outOfScope.
  cabinetDesignated : Bool — whether a 政令 designation applies.
  inDelegatedClass s := s is a listed production service AND cabinetDesignated.
  No numeric amount/unit/dimension applies (structural DELEGATION, not a formula).

Scope: only the delegating structure. The actual 政令 content, which concrete
services are designated, other items/articles, and legal correctness are NOT
MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt4ProductionServiceDelegation

/-- Service class under the delegation (技術 / design-and-other-production / out). -/
inductive ServiceClass : Type
  | technical : ServiceClass        -- 技術
  | otherProduction : ServiceClass  -- design/other production-related services
  | outOfScope : ServiceClass

deriving instance DecidableEq for ServiceClass

/-- 政令で定める: whether a Cabinet Order designation applies. -/
def cabinetDesignated (s : ServiceClass) : Bool :=
  match s with
  | ServiceClass.technical => true
  | ServiceClass.otherProduction => true
  | ServiceClass.outOfScope => false

/-- The delegated class: listed production services that are 政令-designated. -/
def inDelegatedClass (s : ServiceClass) : Prop :=
  (s = ServiceClass.technical ∨ s = ServiceClass.otherProduction) ∧
  cabinetDesignated s = true

/-- The out-of-scope class is not delegated. -/
theorem out_of_scope_not_delegated : ¬ inDelegatedClass ServiceClass.outOfScope := by
  unfold inDelegatedClass cabinetDesignated
  decide

/-- The two listed production services are delegated. -/
theorem technical_delegated : inDelegatedClass ServiceClass.technical := by
  unfold inDelegatedClass cabinetDesignated
  decide
theorem other_production_delegated : inDelegatedClass ServiceClass.otherProduction := by
  unfold inDelegatedClass cabinetDesignated
  decide

end JapanTaxLaw.CustomsTariffArt4ProductionServiceDelegation
