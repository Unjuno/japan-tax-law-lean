import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt14SamplesOrLowPriceException — 関税定率法 第十四条(1)（ただし書）EXCEPTION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|5730c2683082200288f2ec845009841a40eaab89c639586c3635625810b5edd3
  Source path: LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/
               Paragraph#1/Item#6/ItemSentence/Sentence#2
  Article caption: （無条件免税）

原文逐語（pinned, 一字一句改変なし）:
  「ただし、見本用にのみ適すると認められるもの又は著しく価額の低いものとして政令で定めるものに限る。」

Norm kind: EXCEPTION — a ただし書 proviso narrowing an item of the unconditional
duty-free list. It limits (に限る) the item's scope to the disjunction of two
classes: SAMPLES_TERM, or LOWERM_TERM. The computable slice models this
scope-limiting disjunction: an item qualifies only if it falls into one of the
two classes. All statutory terms extracted structurally from the needle's own
delimiters (、 / に限る / 又は) — no hand-typed statutory strings.

Variable contract (meaning / domain / type):
  ItemClass : Type — three classes: samplesOnly (SAMPLES_TERM),
    lowPriceByOrder (LOWERM_TERM), and other (outside the exception).
  withinException (c : ItemClass) : Bool — true for the two listed classes,
    false otherwise. This is the "に限る" (limited to) scope restriction.
  No numeric amount/unit/dimension applies (structural EXCEPTION, not a formula).

Scope: only this scope-limiting disjunction. What the underlying duty-free item
is, how 政令 determines low price, other items/articles and legal correctness are
NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt14SamplesOrLowPriceException

/-- Item class under the proviso. -/
inductive ItemClass : Type
  | samplesOnly : ItemClass       -- SAMPLES_TERM
  | lowPriceByOrder : ItemClass   -- LOWERM_TERM
  | other : ItemClass

deriving instance DecidableEq for ItemClass

/-- に限る: the exception covers only the two listed classes. -/
def withinException (c : ItemClass) : Bool :=
  match c with
  | ItemClass.samplesOnly => true
  | ItemClass.lowPriceByOrder => true
  | ItemClass.other => false

end JapanTaxLaw.CustomsTariffArt14SamplesOrLowPriceException
